<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $codigo = $_POST['codigo'];

    // Añadimos un punto y coma al final del código si no lo tiene
    $codigo = trim($codigo);
    if (substr($codigo, -1) !== ';') {
        $codigo .= ';';
    }

    $filename = 'HacerArchivo.txt';
    
    // Guardamos el código en un archivo temporal para analizar
    file_put_contents($filename, $codigo);

    // Ejecutamos el analizador FLEX generado
    $output = [];
    $return_var = 0;
    exec('test.exe < ' . $filename, $output, $return_var);

    if ($return_var === 0) {
        $resultado = implode("\n", $output);
        header("Location: index.php?resultado=" . urlencode($resultado));
    } else {
        echo "Hubo un error al ejecutar el analizador.";
    }
}

