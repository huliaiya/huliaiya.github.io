<?php
$result = dbQueryAll("SELECT * FROM `huli_friendlinks`;");

require_once __TEMPLATE_DIR__.'/Home/friendlinks.html';