<?php
// CSRF Token 请求不需要数据库连接，提前处理
$type = $_REQUEST['type'] ?? '';
if ($type === 'getCsrfToken') {
	require '../Include/Common.php';
	startSessionSafe();
	json(0, '获取成功', generateCsrfToken());
}

require 'init.php';
$type = $_REQUEST['type'] ?? '';
if ($type === '') {
	jsonError(-1, '缺少请求类型');
}
switch($type){

	case 'getAllApi' :
		$sql = 'SELECT * FROM `huli_api` order by 1 desc';
		$result = $db->query($sql);
		if($result){
			$result = $result->fetch_all(MYSQLI_ASSOC);
			if(!$result){
				jsonError(-1, '暂无接口');
			}
			$arr = array();
			foreach($result as $v){
				$arr[] = array(
					'id' => $v['id'],
					'name' => $v['name'],
					'enname' => $v['enname'],
					'desc' => $v['desc'],
					'time' => date('Y-m-d H:i:s', $v['time']),
					'access' => $v['access'],
					'status' => $v['status']
				);
			}
			json(0, '获取成功', $arr);
		}else{
			jsonError(-1, '获取数据失败');
		}
		break;
		
	case 'getOneApi' :
		$id = intval($_REQUEST['id']);
		if(!$id){
			jsonError(-1, '缺少参数');
		}
		$sql = 'SELECT * FROM `huli_api` WHERE `id`='.$id;
		$result = $db->query($sql);
		if($result){
			$data = $result->fetch_assoc();
			if(!$data){
				jsonError(-1, '暂无接口');
			}
			// 源码仅对管理员返回，防止未授权用户查看接口源码
			if(isAdmin()){
				$data['source_code'] = readApiSource($data['url']);
			}
			json(0, '获取成功', $data);
		}else{
			jsonError(-1, '获取数据失败');
		}
		break;
		
	case 'searchApi' :
		$s = dbEscape($_REQUEST['s'] ?? '');
		$s = str_replace(['%', '_'], ['\%', '\_'], $s);
		if(!$s){
			jsonError(-1, '输入搜索内容');
		}
		$sql = "SELECT * FROM `huli_api` WHERE `status`='1' AND `name` LIKE '%" . $s . "%' order by 1 desc";
		$result = $db->query($sql);
		if($result){
			$result = $result->fetch_all(MYSQLI_ASSOC);
			if(!$result){
				jsonError(-1, '没有搜到你想要的接口');
			}
			$arr = array();
			foreach($result as $v){
				$arr[] = array(
					'id' => $v['id'],
					'name' => $v['name'],
					'enname' => $v['enname'],
					'desc' => $v['desc'],
					'access' => $v['access'],
					'status' => $v['status']
				);
			}
			json(0, '获取成功', $arr);
		}else{
			jsonError(-1, '获取数据失败');
		}
		break;
		
	case 'getAllLink' :
		$mod = $_GET['mod'] ?? '';
		$sql = 'SELECT * FROM `huli_friendlinks`';
		$result = $db->query($sql);
		if($result){
			$arr = $result->fetch_all(MYSQLI_ASSOC);
			if(!$arr){
				jsonError(-1, '暂无友情链接');
			}
			if($mod === 'rand'){
				shuffle($arr);
			}
			json(0, '获取成功', $arr);
		}else{
			jsonError(-1, '获取失败');
		}
		break;
		
	case 'getOneLink' :
		$id = intval($_REQUEST['id']);
		if(!$id){
			jsonError(-1, '缺少参数');
		}
		$sql = 'SELECT * FROM `huli_friendlinks` WHERE `id`='.$id;
		$result = $db->query($sql);
		if($result){
			$data = $result->fetch_assoc();
			if(!$data){
				jsonError(-1, '暂无友链');
			}
			json(0, '获取成功', $data);
		}else{
			jsonError(-1, '获取失败');
		}
		break;
		
	case 'getAllPost' :
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$sql = 'SELECT * FROM `huli_post` order by 1 desc';
		$result = $db->query($sql);
		if($result){
			$arr = $result->fetch_all(MYSQLI_ASSOC);
			if(!$arr){
				jsonError(-1, '暂无公告');
			}
			json(0, '获取成功', $arr);
		}else{
			jsonError(-1, '获取失败');
		}
		break;
		
	case 'getOnePost' :
		$id = intval($_REQUEST['id']);
		if(!$id){
			jsonError(-1, '缺少参数');
		}
		$sql = 'SELECT * FROM `huli_post` WHERE `id`='.$id;
		$result = $db->query($sql);
		if($result){
			$data = $result->fetch_assoc();
			if(!$data){
				jsonError(-1, '暂无公告');
			}
			json(0, '获取成功', $data);
		}else{
			jsonError(-1, '获取失败');
		}
		break;
		
	case 'getAllFeedback' :
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$sql = 'SELECT * FROM `huli_feedback` order by 1 desc';
		$result = $db->query($sql);
		if($result){
			$arr = $result->fetch_all(MYSQLI_ASSOC);
			if(!$arr){
				jsonError(-1, '暂无反馈信息');
			}
			json(0, '获取成功', $arr);
		}else{
			jsonError(-1, '获取失败');
		}
		break;
		
	case 'getOneFeedback' :
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$id = intval($_REQUEST['id']);
		if(!$id){
			jsonError(-1, '缺少参数');
		}
		$sql = 'SELECT * FROM `huli_feedback` WHERE `id`='.$id;
		$result = $db->query($sql);
		if($result){
			$data = $result->fetch_assoc();
			if(!$data){
				jsonError(-1, '暂无该反馈信息');
			}
			json(0, '获取成功', $data);
		}else{
			jsonError(-1, '获取数据失败');
		}
		break;
		
	case 'getAdminInfo' :
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		
		$sql = array(
			'api' => 'SELECT count(1) FROM `huli_api`',
			'access' => 'SELECT count(1) FROM `huli_access`',
			'spider' => 'SELECT count(1) FROM `huli_spider`',
			'link' => 'SELECT count(1) FROM `huli_friendlinks`',
			'post' => 'SELECT count(1) FROM `huli_post`',
			'feedback' => 'SELECT count(1) FROM `huli_feedback`',
		);

		$timestamp = array(
			strtotime('today')-4*86400,	
			strtotime('today')-3*86400,
			strtotime('today')-2*86400,
			strtotime('today')-86400,
			strtotime('today'),
			strtotime('today')+86400
		);
		$access_data = array();
		$access_time = array();
		for ($i=0;$i<5;$i++) {
			$access_sql = "SELECT count(1) FROM `huli_access` WHERE `time` between '{$timestamp[$i]}' and '{$timestamp[($i+1)]}';";
			$access_data[] = dbCount($access_sql);
		}
		for ($i=0;$i<5; $i++) { 
			$access_time[] = date('d', $timestamp[$i]);
		}
		$access = array(
			'access_data' => $access_data,
			'access_time' => $access_time
		);

		$spider_data = array();
		$spider_time = array();
		for ($i=0;$i<5;$i++) {
			$spider_sql = "SELECT count(1) FROM `huli_spider` WHERE `time` between '{$timestamp[$i]}' and '{$timestamp[($i+1)]}';";
			$spider_data[] = dbCount($spider_sql);
		}
		for ($i=0;$i<5; $i++) { 
			$spider_time[] = date('d', $timestamp[$i]);
		}
		$spider = array(
			'spider_data' => $spider_data,
			'spider_time' => $spider_time
		);

		$data = array();
		foreach($sql as $key => $val){
			$data[$key] = dbCount($val);
		}
		json(0, '获取成功！', array_merge($data, $access, $spider));
		break;
		
	case 'getWebSetting' :
		$sql = 'SELECT title,subtitle,description,keywords,favicon,url,icp,copyright,theme,accent,post_id,set_time,close_site,cc_protect,fire_wall,end_script,sparkle_enabled FROM `huli_config`';
		$result = $db->query($sql);
		if($result){
			$data = $result->fetch_assoc();
			$post_id = intval($data['post_id']);
			$post['post'] = dbQueryOne("SELECT * FROM `huli_post` WHERE `id`='{$post_id}';");
			json(0, '获取成功！', array_merge($data,$post));
		}else{
			jsonError(-1, '获取数据失败！');
		}
		break;

	case 'getPayConfig' :
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$sql = 'SELECT vxqrcode,aliqrcode,afdian,pay_desc FROM `huli_config`';
		$result = $db->query($sql);
		if($result){
			$data = $result->fetch_assoc();
			if(!$data){
				$data = array('vxqrcode' => '', 'aliqrcode' => '', 'afdian' => '', 'pay_desc' => '');
			}
			if(empty($data['afdian'])){
				$data['afdian'] = '';
			}
			json(0, '获取成功！', $data);
		}else{
			jsonError(-1, '获取数据失败！');
		}
		break;
	
	case 'getSmtpConfig' :
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$sql = 'SELECT smtp_host,smtp_username,smtp_password,smtp_port,smtp_secure FROM `huli_config`';
		$result = $db->query($sql);
		if($result){
			$data = $result->fetch_assoc();
			// SMTP密码脱敏，仅返回前2位和后2位
			if(!empty($data['smtp_password']) && strlen($data['smtp_password']) > 4){
				$len = strlen($data['smtp_password']);
				$data['smtp_password'] = substr($data['smtp_password'], 0, 2) . str_repeat('*', $len - 4) . substr($data['smtp_password'], -2);
			}
			json(0, '获取成功！', $data);
		}else{
			jsonError(-1, '获取数据失败！');
		}
		break;
		
	case 'getUserInfo' : 
		$data = dbQueryOne("SELECT username,email,qq,vxqrcode,aliqrcode,afdian,pay_desc FROM `huli_config`");
		if(!$data){
			$data = dbQueryOne("SELECT username,email,qq,vxqrcode,aliqrcode,afdian FROM `huli_config`");
		}
		if($data){
			if(empty($data['pay_desc'])){
				$data['pay_desc'] = '';
			}
			if(empty($data['afdian'])){
				$data['afdian'] = '';
			}
			$qq = intval($data['qq'] ?? 0);
			$data['qqhead'] = $qq ? 'https://q2.qlogo.cn/headimg_dl?dst_uin=' . $qq . '&spec=640' : '';
			$data['href'] = $qq ? 'mqqapi://card/show_pslcard?src_type=internal&source=sharecard&version=1&uin=' . $qq : '';
			// 非管理员访问时，对敏感信息脱敏
			if(!isAdmin()){
				$data['email'] = maskEmail($data['email'] ?? '');
				// QQ 号仅保留后两位，前面用 * 代替
				$qqStr = (string)$data['qq'];
				if(strlen($qqStr) > 2){
					$data['qq'] = str_repeat('*', strlen($qqStr) - 2) . substr($qqStr, -2);
				}
			}
			json(0, '获取成功！', $data);
		}else{
			json(0, '获取成功！', array(
				'username' => '',
				'email' => '',
				'qq' => '',
				'qqhead' => '',
				'href' => '',
				'vxqrcode' => '',
				'aliqrcode' => '',
				'afdian' => '',
				'pay_desc' => ''
			));
		}
		break;
		
	case 'getAccessInfo':
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$num = intval($_REQUEST['num'] ?? '25');
		$result = $db->query("SELECT * FROM `huli_access` order by 1 desc limit ".$num);
		if(!$result){
			jsonError(-1, '数据获取失败！');
		} 
		$data = array();
		$rows = $result->fetch_all(MYSQLI_ASSOC);
		foreach($rows as $val){
			$protocol = strtolower((string)$val['protocol']);
			if (strpos($protocol, 'https') !== false) {
				$protocol = 'https';
			} else if (in_array($protocol, array('http/1.0', 'http/1.1', 'http/2', 'http/3'), true)) {
				$protocol = requestScheme();
			} else if ($protocol === 'http') {
				$protocol = 'http';
			} else {
				$protocol = requestScheme();
			}
			$data[] = [
				'id' => $val['id'],
				'ip' => $val['ip'],
				'host' => $val['host'],
				'protocol' => $protocol,
				'method' => $val['method'],
				'user_agent' => $val['user_agent'],
				'time' => date('Y-m-d H:i:s', $val['time'])
			];
		}
		json(0, '获取成功', $data);
		break;
	
	case 'getIpAddress':
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$ip = trim($_REQUEST['ip'] ?? '');
		if(!filter_var($ip, FILTER_VALIDATE_IP)){
			jsonError(-1, '参数错误');
		}else{
			$data = curl('https://api.oioweb.cn/api/ipaddress.php?host='.urlencode($ip), 'GET', 0, 0);
			$data = json_decode($data, true);
			if(is_array($data) && isset($data['disp']) && $data['disp'] != ''){
				json(0, '获取成功', $data['disp']);
			}else{
				jsonError(-1, '获取失败');
			}
		}
		break;
		
	case 'exitLogin':
		startSessionSafe();
		if(isset($_SESSION['login']) && $_SESSION['login'] == 'admin'){
			unset($_SESSION['login']);
			jsonError(0, '退出登录成功');
		}else{
			jsonError(-1, '用户未登录');
		}
		break;
		
	case 'sendTestEmail':
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$to = trim($_REQUEST['to'] ?? '');
		if($to && checkEmail($to)){
			die(sendMail($to, '一封测试邮件', '你收到了这封邮件，表示你的邮件服务器已设置成功。'));
		}else{
			jsonError(-1, '缺少参数或邮箱格式不正确！');
		}
		break;
		
	case 'getApiAccessList':
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$sql = 'SELECT name,access FROM `huli_api` order by access desc limit 5';
		$result = $db->query($sql);
		if($result){
			$data = $result->fetch_all(MYSQLI_ASSOC);
			json(0, '获取成功！', $data);
		}else{
			jsonError(-1, '获取数据失败！');
		}
		break;
	
	case 'getAllLoginLog' :
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$sql = 'SELECT * FROM `huli_login_log` order by 1 desc';
		$result = $db->query($sql);
		if($result){
			$arr = $result->fetch_all(MYSQLI_ASSOC);
		if(!$arr){
			jsonError(-1, '暂无登录信息');
		}
		$data = array();
		foreach($arr as $val){
				$data[] = [
					'id' => $val['id'],
					'ip' => $val['ip'],
					'address' => $val['address'],
					'time' => date('Y-m-d H:i:s', $val['time'])
				];
			}
			json(0, '获取成功', $data);
		}else{
			jsonError(-1, '获取失败');
		}
		break;

	case 'getDbTables' :
		if(!isAdmin()){
			jsonError(-1, '未登录到后台');
		}
		$result = $db->query("SHOW TABLE STATUS");
		if(!$result){
			jsonError(-1, '获取数据库表信息失败');
		}
		$tables = $result->fetch_all(MYSQLI_ASSOC);
		$data = array();
		$totalDataSize = 0;
		$totalIndexSize = 0;
		$totalRows = 0;
		$healthIssues = array();
		$expectedTables = array('huli_access','huli_api','huli_config','huli_feedback','huli_friendlinks','huli_login_log','huli_post','huli_spider');
		$foundTables = array();
		foreach($tables as $t){
			$tname = $t['Name'];
			$foundTables[] = $tname;
			$row_count = dbCount("SELECT COUNT(*) FROM `".str_replace('`', '``', $tname)."`");
			$data_length = intval($t['Data_length'] ?? 0);
			$index_length = intval($t['Index_length'] ?? 0);
			$totalDataSize += $data_length;
			$totalIndexSize += $index_length;
			$totalRows += $row_count;
			// 检查表健康
			if(($t['Engine'] ?? '') === ''){
				$healthIssues[] = '表 '.$tname.' 引擎信息异常';
			}
			if($row_count > 100000){
				$healthIssues[] = '表 '.$tname.' 数据量过大（'.$row_count.' 行），建议清理';
			}
			$columns_result = $db->query("SHOW COLUMNS FROM `".str_replace('`', '``', $tname)."`");
			$columns = array();
			if($columns_result){
				$cols = $columns_result->fetch_all(MYSQLI_ASSOC);
				foreach($cols as $col){
					$columns[] = array(
						'field' => $col['Field'],
						'type' => $col['Type'],
						'null' => $col['Null'],
						'key' => $col['Key'],
						'default' => $col['Default'],
						'extra' => $col['Extra']
					);
				}
			}
			$data[] = array(
				'name' => $tname,
				'engine' => $t['Engine'] ?? '',
				'rows' => intval($t['Rows'] ?? 0),
				'actual_rows' => $row_count,
				'data_length' => formatBytes($data_length),
				'index_length' => formatBytes($index_length),
				'auto_increment' => $t['Auto_increment'] ?? '',
				'collation' => $t['Collation'] ?? '',
				'comment' => $t['Comment'] ?? '',
				'create_time' => $t['Create_time'] ?? '',
				'update_time' => $t['Update_time'] ?? '',
				'columns' => $columns
			);
		}
		// 检查缺失的表
		foreach($expectedTables as $et){
			if(!in_array($et, $foundTables, true)){
				$healthIssues[] = '缺少必要的表：'.$et;
			}
		}
		$health = array(
			'status' => empty($healthIssues) ? 'healthy' : 'warning',
			'score' => empty($healthIssues) ? 100 : max(0, 100 - count($healthIssues) * 15),
			'issues' => $healthIssues,
			'total_tables' => count($tables),
			'total_rows' => $totalRows,
			'total_data_size' => formatBytes($totalDataSize),
			'total_index_size' => formatBytes($totalIndexSize),
			'total_size' => formatBytes($totalDataSize + $totalIndexSize)
		);
		json(0, '获取成功', array('tables' => $data, 'health' => $health));
		break;
}
