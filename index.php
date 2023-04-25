<?php
// Definindo as credenciais de conexão com o banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "livros";

// Criando a conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificando se houve erros na conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Selecionando os dados dos autores da tabela 'autores'
$sql = "SELECT * FROM autores";

$result = $conn->query($sql);

// Verificando se há dados na tabela
if ($result->num_rows > 0) {
    // Imprimindo os dados dos autores em uma tabela
    echo "<table>";
    echo "<tr><th>PK_Autor</th><th>Nome</th><th>Sobrenome</th><th>Gênero</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["PK_Autor"]. "</td><td>" . $row["Nome"]. "</td><td>" . $row["Sobrenome"]. "</td><td>" . $row["Genero"]. "</td></tr>";
    }
    echo "</table>";
} else {
    echo "Não há autores cadastrados.";
}

// Fechando a conexão com o banco de dados
$conn->close();
?>