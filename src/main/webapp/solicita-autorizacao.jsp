<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Solicitação de Autorização</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .table-container {
            max-width: 800px;
            margin: 50px auto;
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
            <img src="${pageContext.request.contextPath}/assets/images/zitrus_logo.png" alt="Logo" width="150"
                 height="100" class="d-inline-block align-text-top">
        </a>
    </div>
</nav>

<div class="container">
    <h1 class="text-center my-4">Solicitação de Autorização</h1>
    <div class="table-container">
        <form id="autorizacaoForm">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>PROCEDIMENTO</th>
                    <th>IDADE</th>
                    <th>SEXO</th>
                    <th>Selecionar</th>
                </tr>
                </thead>
                <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zitrusdb", "sa", "admin");
                        PreparedStatement stmt = conn.prepareStatement("SELECT procedimento, idade, sexo FROM paciente");
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                            String procedimento = rs.getString("procedimento");
                            String idade = rs.getString("idade");
                            String sexo = rs.getString("sexo");
                %>
                <tr>
                    <td><%= procedimento %></td>
                    <td><%= idade %></td>
                    <td><%= sexo %></td>
                    <td><input type="radio" name="autorizacao" value="<%= procedimento %>" data-idade="<%= idade %>" data-sexo="<%= sexo %>"></td>
                </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                </tbody>
            </table>

            <div class="text-center">
                <button type="button" class="btn btn-primary" onclick="solicitarProcedimento()">Solicitar Procedimento</button>
            </div>

            <div id="alertDanger" class="alert alert-danger" role="alert" style="display: none; margin-top: 1rem;">
                Procedimento não autorizado!!!
            </div>

            <div id="alertSuccess" class="alert alert-success" role="alert" style="display: none; margin-top: 1rem;">
                Procedimento autorizado com sucesso!!!
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    function solicitarProcedimento() {
        var selectedRadio = document.querySelector('input[name="autorizacao"]:checked');
        if (!selectedRadio) {
            document.getElementById('alertDanger').innerText = 'Por favor, selecione um procedimento.';
            document.getElementById('alertDanger').style.display = 'block';
            document.getElementById('alertSuccess').style.display = 'none';
            return;
        }

        var procedimento = selectedRadio.value;
        var idade = selectedRadio.getAttribute('data-idade');
        var sexo = selectedRadio.getAttribute('data-sexo');

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "solicitaAutorizacao", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var response = JSON.parse(xhr.responseText);
                var autorizado = response.autorizado;

                var alertSuccess = document.getElementById('alertSuccess');
                var alertDanger = document.getElementById('alertDanger');

                if (autorizado) {
                    alertSuccess.style.display = 'block';
                    alertSuccess.innerText = "Procedimento autorizado com sucesso!!!";
                    alertDanger.style.display = 'none';
                } else {
                    alertSuccess.style.display = 'none';
                    alertDanger.style.display = 'block';
                    alertDanger.innerText = "Procedimento não autorizado!!!";
                }
            }
        };

        var params = "procedimento=" + encodeURIComponent(procedimento) +
            "&idade=" + encodeURIComponent(idade) +
            "&sexo=" + encodeURIComponent(sexo);
        xhr.send(params);
    }
</script>
</body>
</html>
