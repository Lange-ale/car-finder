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
var_dump($_POST);
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
            <select name="color"> <option></option>
                <?php foreach($colors as $color): ?>
                <option> <?= $color[0] ?> </option>
                <?php endforeach; ?>
            </select> </div>
            <div style="margin-top: 5px">
                Brand
                <select name="brand" <?= $add_model ? 'disabled' : ''?> >
                    <?php if ($add_model): ?>
                        <option> <?= $brands[0][0] ?> </option>
                    <?php else: ?>
                        <option></option>
                        <?php foreach ($brands as $brand): ?>
                            <option> <?= $brand[0] ?> </option>
                        <?php endforeach; ?>
                    <?php endif;?>
                </select>
            </div>
            <div style="margin-top: 5px">
                <?php if (!$add_model): ?>
                    <input type="submit" name="add_model" value="Add model">
                <?php else: ?>
                    Model
                    <select name="model">
                        <option></option>
                        <?php foreach ($models as $model): ?>
                            <option> <?= $model[0] ?> </option>
                        <?php endforeach; ?>
                    </select>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <div class="text-center">
        <input type="submit" name="search" value="search">
    </div>
</form>


<ul>
    <?php foreach ($cars as $car):?>
    <li> <?=$car['targa']?> <?=$car['marca']?> <?=$car['modello']?> <?=$car['colore']?>
        <?=$car['nome_proprietario']?> <?=$car['cognome_proprietario']?> <?=$car['codice_fiscale']?> </li>
    <?php endforeach;?>
</ul>


