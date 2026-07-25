<?php
$timestamp = time();
$ip = clientIp();

$cacheDir = __DIR__ . '/../../Core/Cache';
if (!is_dir($cacheDir)) {
	@mkdir($cacheDir, 0755, true);
}
$ccFile = $cacheDir . '/cc_protect.json';

$ccData = array();
if (file_exists($ccFile)) {
	$content = @file_get_contents($ccFile);
	if ($content !== false && $content !== '') {
		$decoded = json_decode($content, true);
		if (is_array($decoded)) {
			$ccData = $decoded;
		}
	}
}

if (isset($ccData[$ip])) {
	$entry = $ccData[$ip];

	// 检查是否被封禁
	if (isset($entry['lock_until']) && $entry['lock_until'] >= $timestamp) {
		header('HTTP/1.0 444');
		exit;
	}

	// 清理过期记录
	if (isset($entry['lock_until']) && $timestamp > $entry['lock_until']) {
		unset($ccData[$ip]);
	}
}

if (!isset($ccData[$ip])) {
	$ccData[$ip] = array(
		'first_time' => $timestamp,
		'count' => 1
	);
} else {
	$entry = $ccData[$ip];
	if (($timestamp - $entry['first_time']) < 30) {
		$entry['count']++;
		if ($entry['count'] >= 10) {
			$entry['lock_until'] = $timestamp + 60;
			$ccData[$ip] = $entry;
			@file_put_contents($ccFile, json_encode($ccData, JSON_PRETTY_PRINT), LOCK_EX);
			header('HTTP/1.0 444');
			exit;
		}
	} else {
		$entry['first_time'] = $timestamp;
		$entry['count'] = 1;
	}
	$ccData[$ip] = $entry;
}

@file_put_contents($ccFile, json_encode($ccData, JSON_PRETTY_PRINT), LOCK_EX);
