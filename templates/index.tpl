<?php
/**
 * Questo commento serve solo a eliminare l'indicazione di errore
 * da parte di PHPStorm per le variabili
 * @var $cars,
 * @var $parts_of_plates,
 * @var $colors,
 * @var $brands,
 * @var $add_model,
 * @var $models
 */
?>

<?php $this->layout('home', ['titolo' => 'car finder']) ?>


<?php
//var_dump($cars);
//var_dump($_POST);
//var_dump($parts_of_plates);
//var_dump($colors);
//var_dump($brands);
//var_dump($add_model);
//var_dump($models);
?>

<h1>Find a car</h1>

<form action="index.php" method="post">
    <div class="columns">
        <div class="column col-6 col-sm-12 text-center text-large">
            Parts of the plate: <br>
            <?php $i=0; foreach ($parts_of_plates as $part):?>
                <input type="text" name="part<?=$i?>" value="<?=$part?>">
                <input type="submit" name="delete_part<?=$i?>" value="🗑" class="btn btn-error">
                <br>
            <?php $i++; endforeach;?>
            <input type="submit" name="add_part" value="add">
        </div>
        <div class="column col-6 col-sm-12 text-center text-large">
            <div> Color:
            <select name="color">
                <?php if (count($colors) != 1) echo "<option></option>"; ?>
                <?php foreach($colors as $color): ?>
                <option> <?= $color[0] ?> </option>
                <?php endforeach; ?>
                <?php if (count($colors) == 1) echo "<option></option>"; ?>
            </select> </div>
            <div style="margin-top: 5px">
                Brand
                <select name="brand">
                    <?php if ($add_model): ?>
                        <option> <?= $brands[0][0] ?> </option>
                    <?php else: ?>
                        <?php if (count($brands) != 1) echo "<option></option>"; ?>
                        <?php foreach ($brands as $brand): ?>
                            <option> <?= $brand[0] ?> </option>
                        <?php endforeach; ?>
                        <?php if (count($brands) == 1) echo "<option></option>"; ?>
                    <?php endif;?>
                </select>
            </div>
            <div style="margin-top: 5px">
                <?php if (!$add_model): ?>
                    <input type="submit" name="add_model" value="Add model">
                <?php else: ?>
                    Model
                    <select name="model">
                        <?php if (count($models) != 1) echo "<option></option>"; ?>
                        <?php foreach ($models as $model): ?>
                            <option> <?= $model[0] ?> </option>
                        <?php endforeach; ?>
                        <?php if (count($models) == 1) echo "<option></option>"; ?>
                    </select>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <div class="text-center">
        <input type="submit" name="search" value="search">
    </div>
</form>


<table style="border-collapse: collapse; width: 100%">
    <tr>
        <th>Plate</th>
        <th>Brand</th>
        <th>Model</th>
        <th>Color</th>
        <th>Owner name</th>
        <th>Owner surname</th>
        <th>Owner fiscal code</th>
    </tr>
    <?php foreach ($cars as $car):?>
    <!--<li> <?=$car['targa']?> <?=$car['marca']?> <?=$car['modello']?> <?=$car['colore']?>
        <?=$car['nome_proprietario']?> <?=$car['cognome_proprietario']?> <?=$car['codice_fiscale']?> </li>
    -->
    <tr>
        <td> <?=$car['targa']?> </td>
        <td> <?=$car['marca']?> </td>
        <td> <?=$car['modello']?> </td>
        <td> <?=$car['colore']?> </td>
        <td> <?=$car['nome_proprietario']?> </td>
        <td> <?=$car['cognome_proprietario']?> </td>
        <td> <?=$car['codice_fiscale']?> </td>
    <?php endforeach;?>
</table>


