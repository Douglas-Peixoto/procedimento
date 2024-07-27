package br.com.zitrus.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoBanco {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/zitrusdb"; // Substitua "seubancodedados" pelo nome do seu banco de dados
        String user = "sa"; // Substitua pelo seu usuário MySQL
        String password = "admin"; // Substitua pela sua senha MySQL

        try {
            // Carregar o driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Estabelecer a conexão
            Connection connection = DriverManager.getConnection(url, user, password);

            // Utilizar a conexão
            System.out.println("Conexão estabelecida com sucesso!");

            // Fechar a conexão
            connection.close();
        } catch (ClassNotFoundException e) {
            System.err.println("Driver não encontrado.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Erro ao conectar ao banco de dados.");
            e.printStackTrace();
        }
    }
}
