<?php
@ini_set('display_errors', '0');
error_reporting(0);
require_once __DIR__.'/config.inc.php';
require_once __INCLUDE_DIR__.'/Common.php';

// 默认配置，防止模板中访问未定义键
$defaultConfig = array(
	'title' => 'HuLiAPI',
	'subtitle' => '',
	'description' => '',
	'keywords' => '',
	'favicon' => 'favicon.ico',
	'email' => '',
	'qq' => '',
	'url' => '',
	'icp' => '',
	'copyright' => '',
	'theme' => 'indigo',
	'accent' => 'blue',
	'qqqrcode' => '',
	'vxqrcode' => '',
	'aliqrcode' => '',
	'afdian' => '',
	'pay_desc' => '',
	'post_id' => '-1',
	'close_site' => '0',
	'cc_protect' => '0',
	'fire_wall' => '0',
	'end_script' => '',
	'sparkle_enabled' => '1'
);

if (file_exists(__CORE_DIR__.'/install.lock')) {
	if (file_exists(__CORE_DIR__.'/Database/connect.php')) {
		try {
			require_once __CORE_DIR__.'/Database/connect.php';
		} catch (Throwable $e) {
			// 数据库连接异常，使用默认配置
		}
		migrateConfigTable();
		$server = @include __CORE_DIR__.'/Config/server.php';
		$websetting = @include __CORE_DIR__.'/Config/webSet.php';
		$config = $defaultConfig;
		if (is_array($server)) {
			$config = array_merge($config, $server);
		}
		if (is_array($websetting)) {
			$config = array_merge($config, $websetting);
		}
	} else {
		$config = $defaultConfig;
	}
} else {
	$config = $defaultConfig;
}
