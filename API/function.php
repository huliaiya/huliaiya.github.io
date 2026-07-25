<?php

require_once __DIR__ . '/../Include/Common.php';

function addAccess()
{
	require __DIR__ . '/../Core/Database/connect.php';

	$host = dbEscape($_SERVER["HTTP_HOST"] . $_SERVER["SCRIPT_NAME"] . '?' . $_SERVER['QUERY_STRING']);
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


function addApiAccess($id)
{
	require __DIR__ . '/../Core/Database/connect.php';
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
