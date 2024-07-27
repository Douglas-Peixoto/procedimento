package br.com.zitrus.controllers;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/solicitaAutorizacao")
public class SolicitaAutorizacaoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String procedimento = request.getParameter("procedimento");
        String idade = request.getParameter("idade");
        String sexo = request.getParameter("sexo");

        boolean autorizado = verificarAutorizacao(procedimento, idade, sexo);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{\"autorizado\":" + autorizado + "}");
        out.flush();
    }

    private boolean verificarAutorizacao(String procedimento, String idade, String sexo) {
        if (("1234".equals(procedimento) && "10".equals(idade) && "M".equals(sexo)) ||
                ("6789".equals(procedimento) && "10".equals(idade) && "F".equals(sexo))) {
            return false; // Não autorizado
        }
        return true; // Todas as outras combinações são autorizadas
    }
}
