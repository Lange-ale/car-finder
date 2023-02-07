<?php

namespace Model;
use Util\Connection;

class CarsRepository{
    public static function listAllDistinct(array $name_columns): array{
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

    public static function listAllBrands(): array{
        return CarsRepository::listAllDistinct(['marca']);
    }

    public static function listAllModels(): array{
        return CarsRepository::listAllDistinct(['modello']);
    }

    public static function listModels($brand): array{
        $pdo = Connection::getInstance();
        $sql = 'SELECT DISTINCT modello FROM veicolo where marca = :brand';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['brand' => $brand]);
        return $stmt->fetchAll();
    }

    public static function search($distinct, $columns, $plates_parts, $color, $brand, $model): array{
        $pdo = Connection::getInstance();
        $sql = 'SELECT ' . ($distinct ? 'DISTINCT ' : '') .
            implode(',', $columns) . ' FROM veicolo WHERE ';
        $params = [];
        $i = 0;
        foreach ($plates_parts as $part){
            $sql = $sql . 'targa LIKE :part'.$i.' AND ';
            $params['part'.$i] = '%'.$part.'%';
            $i++;
        }
        if ($color != ''){
            $sql = $sql . 'colore = :color AND ';
            $params['color'] = $color;
        }
        if ($brand != ''){
            $sql = $sql . 'marca = :brand AND ';
            $params['brand'] = $brand;
        }
        if ($model != ''){
            $sql = $sql . 'modello = :model AND ';
            $params['model'] = $model;
        }
        $sql = substr($sql, 0, -4);
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll();
    }

    public static function searchCars($plates_parts, $color, $brand, $model): array{
        $distinct = false;
        return CarsRepository::search($distinct,
            ['marca', 'modello', 'colore', 'targa', 'nome_proprietario', 'cognome_proprietario', 'codice_fiscale'],
            $plates_parts, $color, $brand, $model);
    }
}