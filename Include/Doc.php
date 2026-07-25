<?php

$id=intval($_REQUEST["id"]);

if(!$id){
	include __DIR__.'/404.php';
	exit;
}else{
	addApiAccess($id);
	$result = dbQueryOne("SELECT name,`desc`,status FROM `huli_api` WHERE `id`='{$id}';");
	if(!$result){
		include __DIR__.'/404.php';
		exit;
	}
	$status = $result['status'];
	if($status == '0'){
		include __DIR__.'/error.php';
		exit;
	}
}


include __TEMPLATE_DIR__.'/Home/doc.html';