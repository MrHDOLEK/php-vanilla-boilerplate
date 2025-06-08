<?php

declare(strict_types=1);

require __DIR__ . "/../vendor/autoload.php";

use Vanilla\Hello;

$hello = new Hello();
echo $hello->say() . "\n";
