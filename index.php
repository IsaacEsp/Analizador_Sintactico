<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analizador Léxico</title>

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        textarea {
            width: 100%;
            height: 200px;
            margin-bottom: 20px;
        }

        button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        pre {
            background-color: #e1e1e1;
            padding: 10px;
            border-radius: 5px;
            overflow: auto;
        }
    </style>

</head>

<body>
    <div class="container">
        <h2>Analizador Léxico</h2>

        <form action="analizador.php" method="POST">
            <label for="codigo">Introduce el código a analizar:</label>
            <textarea name="codigo" id="codigo" required></textarea>
            <button type="submit">Analizar</button>
        </form>

        <?php
        if (isset($_GET['resultado'])) {
            echo "<h3>Resultado del Análisis Léxico:</h3>";
            echo "<pre>" . htmlspecialchars($_GET['resultado']) . "</pre>";
        }
        ?>

    </div>
</body>

</html>