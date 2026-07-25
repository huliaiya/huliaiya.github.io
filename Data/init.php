<?php
require '../Include/Common.php';

date_default_timezone_set("PRC");

error_reporting(0);

startSessionSafe();
loadDatabaseSafe(__DIR__ . '/../Core/Database/connect.php');
migrateConfigTable();
