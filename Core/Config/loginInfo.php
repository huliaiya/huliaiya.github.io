<?php
if(!defined('__ROOT_DIR__')){exit('Access Denied');}
if (!isset($db)) {
	return array();
}
return dbQueryOne("SELECT username FROM `huli_config`");
