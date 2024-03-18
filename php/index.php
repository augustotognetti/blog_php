<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog de notícias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <header class="container d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
        <span class="fs-4">Blog de notícias</span>
      </a>
    </header>
    <?php
    $conexao = mysqli_connect("127.0.0.1", "root", "");
    mysqli_select_db($conexao, "blog");
    mysqli_set_charset($conexao, "UTF8");

    $query = mysqli_query($conexao, 
    "SELECT titulo, subtitulo, caminho, corpo, data FROM noticia
    INNER JOIN conteudo ON conteudo.id = id_conteudo
    INNER JOIN data ON data.id = id_data
    INNER JOIN imagem ON imagem.id = id_imagem
    ORDER BY noticia.id desc
    LIMIT 0, 3");

    $linhas = array();

    while($linha = mysqli_fetch_array($query)){
        $linhas[] = $linha;
    }

    for($i = 0; $i < 3; $i++){
        if($i == 0){
            echo
            "<article class='container col-xxl-8 px-4 py-4 border'>" .
                "<div class='row flex-lg-row-reverse align-items-center g-5 py-3'>" .
                    "<div class='col-10 col-sm-8 col-lg-6'>" .
                        "<img src='images/" . $linhas[$i]["caminho"] . "' class='d-block mx-lg-auto img-fluid' width='700' height='500'>" .
                    "</div>" .
                    "<div class='col-lg-6'>" .
                        "<h1 class='display-6 fw-bold text-body-emphasis lh-1 mb-3'>" . $linhas[$i]["titulo"] .
                        "<h4 class='fw-bold text-body-emphasis lh-1 mb-3'>" . $linhas[$i]["subtitulo"] .
                        "<h5 class='fw-bold text-body-emphasis lh-1 mb-3'>" . $linhas[$i]["data"] .
                        "<p class='lead'>" . $linhas[$i]["corpo"] . "</p>" .
                    "</div>" .
                "</div>" .
            "</article>";
        }
        else{
            echo
            "<article class='container col-xxl-8 px-4 py-2'>" .
                "<div class='row flex-lg-row-reverse align-items-center g-5 py-3'>" .
                    "<div class='col-10 col-sm-8 col-lg-6'>" .
                        "<img src='images/" . $linhas[$i]["caminho"] . "' class='d-block mx-lg-auto img-fluid' width='450' height='250'>" .
                    "</div>" .
                    "<div class='col-lg-6'>" .
                        "<h3 class='fw-bold text-body-emphasis lh-1 mb-3'>" . $linhas[$i]["titulo"] .
                        "<h5 class='fw-bold text-body-emphasis lh-1 mb-3'>" . $linhas[$i]["subtitulo"] .
                        "<h6 class='fw-bold text-body-emphasis lh-1 mb-3'>" . $linhas[$i]["data"] .
                        "<p class='lead'>" . $linhas[$i]["corpo"] . "</p>" .
                    "</div>" .
                "</div>" .
            "</article>";
        }
    }
    ?>
</body>
</html>