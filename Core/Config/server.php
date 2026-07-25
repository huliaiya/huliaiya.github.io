<?php
if(!defined('__ROOT_DIR__')){exit('Access Denied');}

function maskIp($ip) {
	$parts = explode('.', (string)$ip);
	if (count($parts) === 4) {
		return $parts[0] . '.' . $parts[1] . '.x.x';
	}
	return 'x.x.x.x';
}

function maskPath($path) {
	$path = (string)$path;
	if ($path === '' || $path === '未知') {
		return '未知';
	}
	$segments = explode('/', trim($path, '/'));
	if (count($segments) <= 2) {
		return str_repeat('/*', count($segments)) . '/';
	}
	return '/' . $segments[0] . '/*/' . $segments[count($segments)-1];
}

return array(
	'php_version' => PHP_VERSION,
	'php_sapi' => php_sapi_name(),
	'php_uname' => php_uname(),
	'server_software' => $_SERVER['SERVER_SOFTWARE'] ?? '未知',
	'server_name' => $_SERVER['SERVER_NAME'] ?? '未知',
	'server_addr' => maskIp($_SERVER['SERVER_ADDR'] ?? ''),
	'server_port' => $_SERVER['SERVER_PORT'] ?? '未知',
	'document_root' => maskPath($_SERVER['DOCUMENT_ROOT'] ?? ''),
	'upload_max_filesize' => ini_get('upload_max_filesize') ?: '不允许上传附件',
	'post_max_size' => ini_get('post_max_size') ?: '未知',
	'max_execution_time' => ini_get('max_execution_time') . '秒',
	'memory_limit' => ini_get('memory_limit') ?: '无',
	'max_input_vars' => ini_get('max_input_vars') ?: '未知',
	'file_uploads' => ini_get('file_uploads') ? '开启' : '关闭',
	'loaded_extensions' => implode(', ', array_slice(get_loaded_extensions(), 0, 30))
);