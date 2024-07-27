package br.com.zitrus.controllers;

import br.com.zitrus.models.Paciente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/cadastro")
public class CadastroServlet extends HttpServlet {

    private static final  String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final  String DB_URL = "jdbc:mysql://localhost:3306/zitrusdb";
    private static final  String DB_USER = "sa";
    private static final  String DB_PASSWORD = "admin";


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome =  request.getParameter("nome");
        String idade = request.getParameter("idade");
        String sexo =  request.getParameter("sexo");
        String procedimento = request.getParameter("procedimento");

        Paciente paciente = new Paciente(nome, idade, sexo, procedimento);
        boolean sucesso = salvarPaciente(paciente);

        String mensagem = sucesso ? "Cadastro realizado com sucesso!!!" : "Erro ao cadastrar, tente novamente";
        request.setAttribute("mensagem", mensagem);

        request.getRequestDispatcher("/cadastro-procedimento.jsp").forward(request, response);
    }

    public boolean salvarPaciente(Paciente paciente){
        try {
            Class.forName(JDBC_DRIVER);
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "INSERT INTO paciente (nome, idade, sexo, procedimento) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, paciente.getNome());
                statement.setString(2, paciente.getIdade());
                statement.setString(3, paciente.getSexo());
                statement.setString(4, paciente.getProcedimento());
                int rows = statement.executeUpdate();
                return rows > 0;
            }
        }
             catch (Exception e){
                 e.printStackTrace();
                 return false;
             }
        } catch (ClassNotFoundException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
}
