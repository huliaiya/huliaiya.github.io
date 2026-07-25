<?php

@ini_set('display_errors', '0');
@ini_set('log_errors', '1');
error_reporting(0);

// 禁用 mysqli 异常模式（PHP 8.1+ 默认会抛异常），改为传统的 connect_error 方式
if (function_exists('mysqli_report')) {
	mysqli_report(MYSQLI_REPORT_OFF);
}

// 捕获致命错误，避免空白页
register_shutdown_function(function() {
	$error = error_get_last();
	if ($error && in_array($error['type'], array(E_ERROR, E_PARSE, E_CORE_ERROR, E_COMPILE_ERROR, E_RECOVERABLE_ERROR), true)) {
		if (!headers_sent()) {
			header('Content-Type: text/html; charset=utf-8');
		}
		echo '<div style="padding:20px;font-family:sans-serif;color:#333;max-width:600px;margin:40px auto;border:1px solid #ddd;border-radius:8px;">';
		echo '<h2 style="color:#d32f2f;">页面加载出错</h2>';
		echo '<p>错误类型: ' . htmlspecialchars($error['type']) . '</p>';
		echo '<p>错误信息: ' . htmlspecialchars($error['message']) . '</p>';
		echo '<p>文件: ' . htmlspecialchars($error['file']) . ' (行 ' . $error['line'] . ')</p>';
		echo '<p style="color:#666;font-size:13px;margin-top:16px;">请检查PHP版本兼容性或联系管理员。</p>';
		echo '</div>';
	}
});

function startSessionSafe()
{
	if (session_status() === PHP_SESSION_NONE) {
		ini_set('session.cookie_httponly', 1);
		ini_set('session.cookie_samesite', 'Lax');
		if (requestScheme() === 'https') {
			ini_set('session.cookie_secure', 1);
		}
		session_start();
	}
}

function dbEscape($value)
{
	global $db;
	if (!isset($db) || !($db instanceof mysqli)) {
		return addslashes(trim((string)$value));
	}
	return $db->real_escape_string(trim((string)$value));
}

function e($str)
{
	return htmlspecialchars((string)$str, ENT_QUOTES, 'UTF-8');
}

function loadDatabaseSafe($connectFile)
{
	global $db;
	if (!file_exists($connectFile)) {
		jsonError(-1, '数据库配置文件不存在，请重新安装');
	}
	ob_start();
	try {
		require $connectFile;
	} catch (Throwable $e) {
		ob_end_clean();
		jsonError(-1, '数据库连接失败，请检查数据库配置');
	}
	$output = trim(ob_get_clean());
	if ($output !== '' || !isset($db) || !($db instanceof mysqli) || $db->connect_error) {
		jsonError(-1, '数据库连接失败，请检查数据库配置');
	}
	@$db->query("set names utf8");
}

function ensureColumn($table, $column, $definition)
{
	global $db;
	if (!isset($db) || !($db instanceof mysqli)) {
		return false;
	}
	$result = @$db->query("SHOW COLUMNS FROM `{$table}` LIKE '{$column}'");
	if ($result && $result->num_rows == 0) {
		@$db->query("ALTER TABLE `{$table}` ADD COLUMN `{$column}` {$definition}");
	}
	return true;
}

function migrateConfigTable()
{
	ensureColumn('huli_config', 'pay_desc', "text NOT NULL COMMENT '打赏说明'");
	ensureColumn('huli_config', 'afdian', "varchar(255) NOT NULL DEFAULT '' COMMENT '爱发电链接/二维码'");
	// sparkle 动画开关
	ensureColumn('huli_config', 'sparkle_enabled', "varchar(1) NOT NULL DEFAULT '1' COMMENT 'sparkle点击动画开关'");
}

function hashAdminPassword($password)
{
	return password_hash((string)$password, PASSWORD_DEFAULT);
}

function verifyAdminPassword($password, $storedHash)
{
	$password = (string)$password;
	$storedHash = (string)$storedHash;
	if (password_get_info($storedHash)['algo'] !== 0) {
		return password_verify($password, $storedHash);
	}
	return hash_equals($storedHash, $password);
}

function clientIp()
{
	return $_SERVER['REMOTE_ADDR'] ?? '0.0.0.0';
}

function requestScheme()
{
	if (!empty($_SERVER['HTTP_X_FORWARDED_PROTO'])) {
		$proto = strtolower(trim(explode(',', $_SERVER['HTTP_X_FORWARDED_PROTO'])[0]));
		if (in_array($proto, array('http', 'https'), true)) {
			return $proto;
		}
	}
	if (!empty($_SERVER['HTTP_X_FORWARDED_SSL']) && strtolower($_SERVER['HTTP_X_FORWARDED_SSL']) === 'on') {
		return 'https';
	}
	if (!empty($_SERVER['HTTP_FRONT_END_HTTPS']) && strtolower($_SERVER['HTTP_FRONT_END_HTTPS']) !== 'off') {
		return 'https';
	}
	if (!empty($_SERVER['HTTP_CF_VISITOR']) && stripos($_SERVER['HTTP_CF_VISITOR'], 'https') !== false) {
		return 'https';
	}
	if (!empty($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) !== 'off') {
		return 'https';
	}
	if (!empty($_SERVER['SERVER_PORT']) && intval($_SERVER['SERVER_PORT']) === 443) {
		return 'https';
	}
	return 'http';
}

function safePayLink($value)
{
	$value = trim((string)$value);
	if ($value === '') {
		return '';
	}
	if (preg_match('/^(javascript|data|vbscript|file):/i', $value)) {
		return '';
	}
	if (preg_match('/^https?:\/\//i', $value) || strpos($value, '//') === 0) {
		return $value;
	}
	$value = str_replace('\\', '/', $value);
	$value = preg_replace('/\.\.+\//', '', $value);
	$value = preg_replace('/^\.\//', '', $value);
	return $value;
}

function dbQueryOne($sql)
{
	global $db;
	if (!isset($db)) {
		return null;
	}
	$result = @$db->query($sql);
	if (!$result) {
		return null;
	}
	return $result->fetch_assoc();
}

function dbQueryAll($sql)
{
	global $db;
	if (!isset($db)) {
		return array();
	}
	$result = @$db->query($sql);
	if (!$result) {
		return array();
	}
	return $result->fetch_all(MYSQLI_ASSOC);
}

function dbCount($sql)
{
	global $db;
	if (!isset($db)) {
		return 0;
	}
	$result = @$db->query($sql);
	if (!$result) {
		return 0;
	}
	$row = $result->fetch_array();
	return intval($row[0] ?? 0);
}

function formatBytes($bytes)
{
	if($bytes <= 0) return '0 B';
	$units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
	$i = floor(log($bytes, 1024));
	if($i >= count($units)) $i = count($units) - 1;
	return round($bytes / pow(1024, $i), 2) . ' ' . $units[$i];
}

function normalizeApiFileName($name)
{
	$name = trim((string)$name);
	$name = preg_replace('/[?#].*$/', '', $name);
	$name = basename($name);
	$name = preg_replace('/[^A-Za-z0-9_-]/', '', preg_replace('/\.php$/i', '', $name));
	if ($name === '') {
		return '';
	}
	if (in_array(strtolower($name), array('function', 'index', 'init'), true)) {
		return '';
	}
	return $name . '.php';
}

function normalizeApiUrl($value)
{
	$value = trim((string)$value);
	$parts = explode('?', $value, 2);
	$file = normalizeApiFileName($parts[0]);
	if ($file === '') {
		return '';
	}
	return isset($parts[1]) && $parts[1] !== '' ? $file . '?' . $parts[1] : $file;
}

function defaultApiSource($fileName, $apiName = '')
{
	$title = str_replace(array("\\", "'"), array("\\\\", "\\'"), (string)$apiName);
	return "<?php\nheader('Content-Type: application/json; charset=utf-8');\n\n\$method = \$_SERVER['REQUEST_METHOD'] ?? 'GET';\n\$params = \$method === 'POST' ? \$_POST : \$_GET;\n\n\$response = array(\n\t'code' => 200,\n\t'message' => '新的世界新的开始',\n\t'name' => '{$title}',\n\t'file' => '{$fileName}',\n\t'method' => \$method,\n\t'params' => \$params\n);\n\necho json_encode(\$response, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);\n";
}

function readApiSource($fileName)
{
	$fileName = normalizeApiFileName($fileName);
	if ($fileName === '') {
		return '';
	}
	$path = __DIR__ . '/../API/' . $fileName;
	if (!is_file($path)) {
		return '';
	}
	return (string)@file_get_contents($path);
}

function createApiFile($fileName, $apiName = '', $sourceCode = null)
{
	$fileName = normalizeApiFileName($fileName);
	if ($fileName === '') {
		return false;
	}
	$dir = __DIR__ . '/../API';
	if (!is_dir($dir) && !mkdir($dir, 0755, true)) {
		return false;
	}
	$path = $dir . '/' . $fileName;
	if ($sourceCode === null || trim((string)$sourceCode) === '') {
		if (file_exists($path)) {
			return true;
		}
		$content = defaultApiSource($fileName, $apiName);
	} else {
		$content = (string)$sourceCode;
		if (strpos(ltrim($content), '<?php') !== 0) {
			$content = "<?php\n" . $content;
		}
	}
	return file_put_contents($path, $content, LOCK_EX) !== false;
}

function removeApiFile($fileName)
{
	$fileName = normalizeApiFileName($fileName);
	if ($fileName === '') {
		return true;
	}
	$path = __DIR__ . '/../API/' . $fileName;
	if (is_file($path)) {
		return @unlink($path);
	}
	return true;
}


function jsonError($code, $msg)
{
	if (!headers_sent()) {
		header('Content-Type: application/json; charset=utf-8');
	}
	die(json_encode(array(
		'code' => $code,
		'msg' => $msg
	), 320 | JSON_PRETTY_PRINT));
}


function json($code, $msg, $data)
{
	if (!headers_sent()) {
		header('Content-Type: application/json; charset=utf-8');
	}
	die(json_encode(array(
		'code' => $code,
		'msg' => $msg,
		'data' => $data
	), 320 | JSON_PRETTY_PRINT));
}


function isAdmin()
{
	startSessionSafe();
	$apikey = @include __DIR__ . '/../Core/Config/apikey.php';
	if (isset($_SESSION['login']) && $_SESSION['login'] === 'admin') {
		return true;
	} else if(isset($_SERVER['HTTP_X_API_KEY']) && $_SERVER['HTTP_X_API_KEY'] !== '' && hash_equals((string)$apikey, (string)$_SERVER['HTTP_X_API_KEY'])) {
		return true;
	} else if(isset($_GET['apikey']) && $_GET['apikey'] !== '' && hash_equals((string)$apikey, (string)$_GET['apikey'])) {
		// GET 参数传递 apikey 已弃用，建议使用 HTTP Header (X-API-Key)
		return true;
	} else {
		return false;
	}
}


function clearAdmin()
{
	startSessionSafe();
	if (isset($_SESSION['login']) && $_SESSION['login'] === 'admin') {
		unset($_SESSION['login']);
		return true;
	} else {
		return false;
	}
}

function generateCsrfToken()
{
	startSessionSafe();
	if (empty($_SESSION['csrf_token']) || empty($_SESSION['csrf_token_time']) || (time() - $_SESSION['csrf_token_time']) > 3600) {
		$_SESSION['csrf_token'] = bin2hex(random_bytes(32));
		$_SESSION['csrf_token_time'] = time();
	}
	return $_SESSION['csrf_token'];
}

function verifyCsrfToken()
{
	startSessionSafe();
	$token = $_POST['csrf_token'] ?? $_SERVER['HTTP_X_CSRF_TOKEN'] ?? '';
	$stored = $_SESSION['csrf_token'] ?? '';
	if ($stored === '' || $token === '' || !hash_equals($stored, $token)) {
		return false;
	}
	// 验证通过后保留 token（已有1小时过期机制），避免连续操作时第二次请求失败
	return true;
}

function validateApiSourceCode($code)
{
	$code = (string)$code;
	if ($code === '') {
		return true; // 空代码使用默认模板，安全
	}
	// 移除 PHP 注释和字符串内容，避免误判
	$cleaned = preg_replace('#//[^\n]*#', '', $code);      // 单行注释
	$cleaned = preg_replace('#/\*.*?\*/#s', '', $cleaned);  // 多行注释
	// 检查危险函数/关键字
	// 注意：$_GET、$_POST、$_SERVER、header() 是 API 开发必需的，允许使用
	$dangerous = array(
		'eval\s*\(', 'exec\s*\(', 'system\s*\(', 'passthru\s*\(',
		'shell_exec\s*\(', 'popen\s*\(', 'proc_open\s*\(',
		'pcntl_', 'unlink\s*\(', 'rmdir\s*\(', 'mkdir\s*\(',
		'file_put_contents\s*\(', 'fwrite\s*\(',
		'rename\s*\(', 'copy\s*\(', 'move_uploaded_file\s*\(',
		'include\s*[\(]', 'require\s*[\(]',
		'fsockopen\s*\(', 'mail\s*\(', 'setcookie\s*\(',
		'`'
	);
	foreach ($dangerous as $pattern) {
		if (preg_match('/' . $pattern . '/i', $cleaned)) {
			return false;
		}
	}
	return true;
}

/* ========================================
   登录防暴力破解 (Brute-Force Protection)
   基于 IP 维度的失败次数限制，使用文件存储
   规则: 15分钟内失败5次 → 封禁30分钟
   ======================================== */

function loginAttemptFile()
{
	$dir = __DIR__ . '/../Core/Cache';
	if (!is_dir($dir)) {
		@mkdir($dir, 0755, true);
	}
	return $dir . '/login_attempts.json';
}

function loadLoginAttempts()
{
	$file = loginAttemptFile();
	if (!file_exists($file)) {
		return array();
	}
	$content = @file_get_contents($file);
	if ($content === false || $content === '') {
		return array();
	}
	$data = json_decode($content, true);
	return is_array($data) ? $data : array();
}

function saveLoginAttempts($data)
{
	$file = loginAttemptFile();
	$content = json_encode($data, JSON_PRETTY_PRINT);
	return file_put_contents($file, $content, LOCK_EX) !== false;
}

/**
 * 检查 IP 是否被登录封禁
 * @return array ['blocked' => bool, 'retry_after' => int(秒)]
 */
function checkLoginRateLimit($ip)
{
	$ip = (string)$ip;
	if ($ip === '') {
		return array('blocked' => false, 'retry_after' => 0);
	}
	$attempts = loadLoginAttempts();
	$now = time();
	// 清理过期记录
	$changed = false;
	foreach ($attempts as $key => $entry) {
		if (!isset($entry['blocked_until']) && isset($entry['first_attempt']) && ($now - $entry['first_attempt']) > 900) {
			unset($attempts[$key]);
			$changed = true;
		}
		if (isset($entry['blocked_until']) && $now > $entry['blocked_until']) {
			unset($attempts[$key]);
			$changed = true;
		}
	}
	if ($changed) {
		saveLoginAttempts($attempts);
	}
	if (!isset($attempts[$ip])) {
		return array('blocked' => false, 'retry_after' => 0);
	}
	$entry = $attempts[$ip];
	if (isset($entry['blocked_until']) && $now <= $entry['blocked_until']) {
		return array('blocked' => true, 'retry_after' => $entry['blocked_until'] - $now);
	}
	return array('blocked' => false, 'retry_after' => 0);
}

/**
 * 记录一次失败的登录尝试
 */
function recordFailedLogin($ip)
{
	$ip = (string)$ip;
	if ($ip === '') {
		return;
	}
	$attempts = loadLoginAttempts();
	$now = time();
	if (!isset($attempts[$ip])) {
		$attempts[$ip] = array(
			'count' => 1,
			'first_attempt' => $now,
			'last_attempt' => $now,
		);
	} else {
		$entry = $attempts[$ip];
		// 如果窗口已过期（距首次失败超过15分钟），重置计数
		if (isset($entry['first_attempt']) && ($now - $entry['first_attempt']) > 900) {
			$entry['count'] = 1;
			$entry['first_attempt'] = $now;
		} else {
			$entry['count'] = ($entry['count'] ?? 0) + 1;
		}
		$entry['last_attempt'] = $now;
		$attempts[$ip] = $entry;
	}
	// 达到5次失败 → 封禁30分钟
	if ($attempts[$ip]['count'] >= 5) {
		$attempts[$ip]['blocked_until'] = $now + 1800;
	}
	saveLoginAttempts($attempts);
}

/**
 * 登录成功后清除该 IP 的失败记录
 */
function clearFailedLogins($ip)
{
	$ip = (string)$ip;
	if ($ip === '') {
		return;
	}
	$attempts = loadLoginAttempts();
	if (isset($attempts[$ip])) {
		unset($attempts[$ip]);
		saveLoginAttempts($attempts);
	}
}

/**
 * 邮箱脱敏：保留首2位 + *** + @域名
 * 例: admin@qq.com → ad***@qq.com
 */
function maskEmail($email)
{
	$email = (string)$email;
	if ($email === '') {
		return '';
	}
	$at = strpos($email, '@');
	if ($at === false || $at < 2) {
		return str_repeat('*', strlen($email));
	}
	$local = substr($email, 0, $at);
	$domain = substr($email, $at);
	$visible = min(2, strlen($local));
	return substr($local, 0, $visible) . str_repeat('*', max(1, strlen($local) - $visible)) . $domain;
}


function alert($msg, $url)
{
	$jsMsg = json_encode((string)$msg, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
	$jsUrl = json_encode((string)$url, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
	$alert = '<script>';
	$alert .= 'alert(' . $jsMsg . ');';
	$alert .= 'window.location.href=' . $jsUrl . ';';
	$alert .= '</script>';
	die($alert);
}


function jump($url)
{
	header('Location: ' . $url);
	exit;
}


function addAccess()
{
	global $db;
	if (!isset($db) || !($db instanceof mysqli)) {
		return false;
	}

	$queryString = $_SERVER['QUERY_STRING'] ?? '';
	$host = dbEscape($_SERVER["HTTP_HOST"] . $_SERVER["SCRIPT_NAME"] . '?' . $queryString);
	$user_agent = dbEscape($_SERVER["HTTP_USER_AGENT"]);
	$protocol = requestScheme();
	$method = dbEscape($_SERVER["REQUEST_METHOD"]);
	$ip = dbEscape($_SERVER["REMOTE_ADDR"] ?? '0.0.0.0');
	$time = intval($_SERVER["REQUEST_TIME"]);
	$result = $db->query("INSERT INTO `huli_access`(`id`, `host`, `user_agent`, `protocol`, `method`, `ip`, `time`) VALUES (NULL,'{$host}','{$user_agent}','{$protocol}','{$method}','{$ip}','{$time}');");
	if ($result) {
		return true;
	} else {
		return false;
	}
}


function checkEmail($email)
{
	$result = trim($email);
	if (filter_var($result, FILTER_VALIDATE_EMAIL)) {
		return true;
	} else {
		return false;
	}
}


use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

function sendMail($to, $title, $content)
{
	global $db;
	if (!isset($db) || !($db instanceof mysqli)) {
		return json_encode(array('code' => -1, 'msg' => '数据库未连接'), 320);
	}
	$rootDir = defined('__ROOT_DIR__') ? __ROOT_DIR__ : dirname(__DIR__);
	require $rootDir . '/Include/PHPMailer/Exception.php';
	require $rootDir . '/Include/PHPMailer/PHPMailer.php';
	require $rootDir . '/Include/PHPMailer/SMTP.php';
	$sql = "SELECT title,smtp_host,smtp_username,smtp_password,smtp_port,smtp_secure FROM `huli_config`;";
	$result = $db->query($sql);
	$row = $result ? $result->fetch_assoc() : null;
	if ($row) {
		$mail = new PHPMailer();
		$mail->isSMTP();
		$mail->SMTPAuth = true;
		$mail->Host = $row['smtp_host'];
		$mail->Username = $row['smtp_username'];
		$mail->Password = $row['smtp_password'];
		$mail->SMTPSecure = $row['smtp_secure'];
		$mail->Port = $row['smtp_port'];
		$mail->setFrom($row['smtp_username'], $row['title']);
		$mail->addAddress($to);
		$mail->WordWrap = 50;
		$mail->IsHTML(true);
		$mail->CharSet = "utf-8";
		$mail->Subject = $title;
		$safeTitle = htmlspecialchars($row['title'] ?? '', ENT_QUOTES, 'UTF-8');
		$safeContent = nl2br(htmlspecialchars($content, ENT_QUOTES, 'UTF-8'));
		$mail->Body = '
        	<div style="background-color:#0ea5e9;color:#0ea5e9;padding:15px;">
        		<p style="font-weight:bold;color:#fff;font-size:20px;text-align:center;">' . $safeTitle . '</p>
        	</div>
        	<div style="background-color:#fff;padding:10px;border:2px solid #0ea5e9;">
        		<p style="color:#000;font-size:15px;">' . $safeContent . '</p>
        		<p style="color:#000;font-size:15px;text-align:center;">' . date('Y-m-d') . '&nbsp;' . date('H:i:s') . '</p>
        	</div>
        ';
		if (!$mail->send()) {
			$code = -1;
			$msg = '发送失败: ' . $mail->ErrorInfo;
		} else {
			$code = 0;
			$msg = '发送成功';
		}
	} else {
		$code = -1;
		$msg = '获取邮件配置信息时发生错误';
	}
	$output = json_encode(array(
		'code' => $code,
		'msg' => $msg
	), 320);
	return $output;
}


function addApiAccess($id)
{
	global $db;
	if (!isset($db) || !($db instanceof mysqli)) {
		return false;
	}
	$id = intval($id);
	if ($id) {
		$get_access = $db->query("SELECT access FROM `huli_api` WHERE `id` = '{$id}';");
		if ($get_access) {
			$get_access = $get_access->fetch_assoc();
			$update_access = intval($get_access['access']) + 1;
			$update_result = $db->query("UPDATE `huli_api` SET `access` = '{$update_access}' WHERE `id` = '{$id}';");
			if ($update_result) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	} else {
		return false;
	}
}


function getUserIp()
{
	$ip = false;
	if (!empty($_SERVER["HTTP_CLIENT_IP"])) {
		$ip = $_SERVER["HTTP_CLIENT_IP"];
	}
	if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
		$ips = explode(", ", $_SERVER['HTTP_X_FORWARDED_FOR']);
		if ($ip && is_string($ip)) {
			array_unshift($ips, $ip);
		}
		$ip = false;
		for ($i = 0; $i < count($ips); $i++) {
			if (!preg_match('/^(10|172\.16|192\.168)\./i', $ips[$i])) {
				$ip = $ips[$i];
				break;
			}
		}
	}
	return ($ip ? $ip : ($_SERVER['REMOTE_ADDR'] ?? '0.0.0.0'));
}


function is_spider()
{
	global $db;
	if (!isset($db) || !($db instanceof mysqli)) {
		return false;
	}
	$agent = strtolower($_SERVER['HTTP_USER_AGENT'] ?? '');
	if (!empty($agent)) {
		$spiderSite = array(
			"TencentTraveler",
			"Baiduspider+",
			"BaiduGame",
			"Googlebot",
			"msnbot",
			"Sosospider+",
			"Sogou web spider",
			"ia_archiver",
			"Yahoo! Slurp",
			"YoudaoBot",
			"Yahoo Slurp",
			"MSNBot",
			"Java (Often spam bot)",
			"BaiDuSpider",
			"Voila",
			"Yandex bot",
			"BSpider",
			"twiceler",
			"Sogou Spider",
			"Speedy Spider",
			"Google AdSense",
			"Heritrix",
			"Python-urllib",
			"Alexa (IA Archiver)",
			"Ask",
			"Exabot",
			"Custo",
			"OutfoxBot/YodaoBot",
			"yacy",
			"SurveyBot",
			"legs",
			"lwp-trivial",
			"Nutch",
			"StackRambler",
			"The web archive (IA Archiver)",
			"Perl tool",
			"MJ12bot",
			"Netcraft",
			"MSIECrawler",
			"WGet tools",
			"larbin",
			"Fish search",
		);
		foreach ($spiderSite as $val) {
			$str = strtolower($val);
			if (strpos($agent, $str) !== false) {
				$safeStr = dbEscape($str);
				$safeIp = dbEscape(getUserIp());
				$safeTime = intval(time());
				$sql = "INSERT INTO `huli_spider` (`id`, `agent`, `ip`, `time`) VALUES (NULL, '{$safeStr}', '{$safeIp}', '{$safeTime}');";
				$result = $db->query($sql);
				if ($result) {
					return true;
				}
				return false;
			}
		}
		return false;
	} else {
		return false;
	}
}


function curl($url, $method, $headers, $params)
{
	// 协议白名单检查，防止SSRF
	$proto = strtolower(parse_url($url, PHP_URL_SCHEME) ?: '');
	if (!in_array($proto, array('http', 'https'), true)) {
		return array('Error' => '不允许的协议');
	}
	if (is_array($params)) {
		$requestString = http_build_query($params);
	} else {
		$requestString = $params ?: '';
	}
	if (empty($headers)) {
		$headers = array('Content-type: text/json');
	} elseif (!is_array($headers)) {
		parse_str($headers, $headers);
	}
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
	curl_setopt($ch, CURLOPT_TIMEOUT, 5);
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 3);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	switch ($method) {
		case "GET":
			curl_setopt($ch, CURLOPT_HTTPGET, 1);
			break;
		case "POST":
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $requestString);
			break;
		case "PUT":
			curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
			curl_setopt($ch, CURLOPT_POSTFIELDS, $requestString);
			break;
		case "DELETE":
			curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
			curl_setopt($ch, CURLOPT_POSTFIELDS, $requestString);
			break;
	}
	$response = curl_exec($ch);

	curl_close($ch);

	if (stristr($response, 'HTTP 404') || $response == '') {
		return array('Error' => '请求错误');
	}
	return $response;
}
