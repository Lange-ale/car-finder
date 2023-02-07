<?php

require_once 'vendor/autoload.php';
require_once 'conf/config.php';

use League\Plates\Engine;
use Model\CarsRepository;

$template = new Engine('templates','tpl');

$cars = [];
$parts_of_plates = [];
$color = $_POST['color'] ?? '';
$brand = $_POST['brand'] ?? '';
$model = $_POST['model'] ?? '';

$i = 0;
while (isset($_POST['part'.$i])){
    if (!isset($_POST['delete_part'.$i]))
        $parts_of_plates['part'.$i] = $_POST['part'.$i];
    $i++;
}

if (isset($_POST['add_part']))
    $parts_of_plates['part'.$i] = '';

else if (isset($_POST['search'])){
    $cars = CarsRepository::searchCars($parts_of_plates, $color, $brand, $model);
}

$colors = CarsRepository::listAllColors();
$brands = isset($_POST['brand']) ? [0=>[0=> $_POST['brand']]] : CarsRepository::listAllBrands();
$add_model = isset($_POST['add_model']);
$models = [];
if ($add_model)
    $models = CarsRepository::listModels($_POST['brand']);

$cars = $cars != [] ? $cars : CarsRepository::searchCars($parts_of_plates, $color, $brand, $model);


echo $template->render('index', [
    'cars' => $cars,
    'post' => $_POST,
    'parts_of_plates' => $parts_of_plates,
    'colors' => $colors,
    'brands' => $brands,
    'add_model' => $add_model,
    'models' => $models
]);