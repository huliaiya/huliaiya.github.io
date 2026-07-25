<?php
error_reporting(0);

$action = $_GET['action'] ?? '';

if (!file_exists(__CORE_DIR__.'/install.lock') && $action !== 'install') {
	// 未安装时直接显示免责声明页面，而不是简单的 alert
	include __TEMPLATE_DIR__.'/Install/start.html';
	exit;
}

if (!isset($config) || !is_array($config)) {
	$config = array();
}

if ($action !== 'admin' && $action !== 'install') {
	addAccess();
	is_spider();
}

if (($config['close_site'] ?? '0') === '1' && $action !== 'admin') {
	include __TEMPLATE_DIR__.'/Home/close.html';
	exit;
}

if (($config['cc_protect'] ?? '0') === '1' && $action !== 'admin') {
	include __INCLUDE_DIR__.'/Firewall/CCProtect.php';
}

if (($config['fire_wall'] ?? '0') === '1' && $action !== 'admin') {
	include __INCLUDE_DIR__.'/Firewall/DisSQL.php';
}


if ($action === 'doc') {

	include __DIR__.'/Doc.php';

} else if ($action === 'friendlinks') {

	include __DIR__.'/Friendlinks.php';

} else if ($action === 'about') {

	include __DIR__.'/About.php';

} else if ($action === 'install') {

	include __DIR__.'/Install.php';

} else if ($action === 'jump') {

	include __DIR__.'/Jump.php';

} else if ($action === '404') {

	include __DIR__.'/404.php';

} else if ($action === 'error') {

	include __DIR__.'/Error.php';

} else if ($action === 'admin') {

	include __DIR__.'/Admin.php';

} else {

	include __DIR__.'/Home.php';

}
