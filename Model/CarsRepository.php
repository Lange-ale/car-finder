<?php

namespace Model;
use Util\Connection;

class CarsRepository{
    private static function listAllDistinct(array $name_columns): array{
        $pdo = Connection::getInstance();
        $sql = 'SELECT DISTINCT ' . implode('', $name_columns) . ' FROM veicolo';
        $stmt = $pdo->query($sql);
        return $stmt->fetchAll();
    }

    public static function listAllCars(): array{
        return CarsRepository::listAllDistinct(['*']);
    }

    public static function listAllColors(): array{
        return CarsRepository::listAllDistinct(['colore']);
    }

    public static function listAllBrands(): array
    {
        return CarsRepository::listAllDistinct(['marca']);
    }

    public static function listAllModels(): array
    {
        return CarsRepository::listAllDistinct(['modello']);
    }

    public static function listModels($brand): array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT DISTINCT modello FROM veicolo where marca = :brand';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['brand' => $brand]);
        return $stmt->fetchAll();
    }
}