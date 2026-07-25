<?php
header('Content-Type: application/json; charset=utf-8');

$method = $_SERVER['REQUEST_METHOD'] ?? 'GET';
$params = $method === 'POST' ? $_POST : $_GET;

$response = [
    'code' => 200,
    'message' => '新的世界新的开始',
    'method' => $method
];

echo json_encode($response, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
