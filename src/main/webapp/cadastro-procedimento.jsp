<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Procedimentos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            background-color: #f8f9fa;
        }
        .navbar-brand img {
            margin-right: 10px;
        }
    </style>
</head>
<body>

<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="${pageContext.request.contextPath}/assets/images/zitrus_logo.png" alt="Logo" width="150" height="100"
                 class="d-inline-block align-text-top">
        </a>
    </div>
</nav>

<div class="container">
    <h1 class="text-center my-4">Cadastro de Procedimentos</h1>

    <div class="form-container">
        <!-- Exibe a mensagem se existir -->
        <c:if test="${not empty mensagem}">
            <div class="alert alert-info">
                    ${mensagem}
            </div>
        </c:if>

    <form action="cadastro" method="post">

    <div class="form-container">
        <form>
            <div class="mb-3">
                <label for="nome" class="form-label">Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" placeholder="Digite seu nome..." required>
            </div>

            <div class="mb-3">
                <label for="idade" class="form-label">Idade:</label>
                <input type="number" class="form-control" id="idade" name="idade" placeholder="Digite sua idade..." required>
            </div>

            <div class="mb-3">
                <label for="selectSexo" class="form-label">Sexo:</label>
                <select class="form-select" id="selectSexo" name="sexo" required>
                    <option selected disabled>Selecione o Sexo:</option>
                    <option value="M">Masculino</option>
                    <option value="F">Feminino</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="selectProcedimento" class="form-label">Procedimento:</label>
                <select class="form-select" id="selectProcedimento" name="procedimento" required>
                    <option selected disabled>Selecione o Procedimento:</option>
                    <option value="1234">1234</option>
                    <option value="4567">4567</option>
                    <option value="6789">6789</option>
                </select>
            </div>
            <div style="margin-left: 8rem;">
                <button type="submit" class="btn btn-primary">Cadastrar</button>
                <button type="submit" class="btn btn-success" onclick="consultarProcedimentos()">Consultar Procedimentos</button></div>
        </form>
    </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>

    function consultarProcedimentos() {
        window.location.href = 'solicita-autorizacao.jsp';
    }

    document.getElementById('cadastroForm').addEventListener('submit', function (event) {
        event.preventDefault(); // Impede o envio do formulário

        // Obtém os valores dos campos do formulário
        const nome = document.getElementById('nome').value;
        const idade = document.getElementById('idade').value;
        const sexo = document.getElementById('selectSexo').value;
        const autorizacao = document.getElementById('selectProcedimento').value;

        // Cria uma nova linha na tabela com os dados do formulário
        const tabela = document.getElementById('cadastroTabela');
        const novaLinha = tabela.insertRow();
        novaLinha.insertCell(0).innerText = autorizacao;
        novaLinha.insertCell(1).innerText = idade;
        novaLinha.insertCell(2).innerText = sexo;

        // Limpa os campos do formulário
        document.getElementById('cadastroForm').reset();
    });
</script>
</body>
</html>
