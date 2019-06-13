package br.senai.sp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;
import br.senai.sp.model.Compromisso;

@WebServlet("/ExibirCompromissoServlet")
public class ExibirCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ExibirCompromissoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String operacao = request.getParameter("op");
		String destino;

		CompromissoDAO dao = new CompromissoDAO();

		Compromisso compromisso = dao.getCompromisso(id);

		if(operacao.equals("atualizar")) {
			destino = "atualizar_compromisso.jsp";
		} else if(operacao.equals("excluir")){
			destino = "excluir_compromisso.jsp";
		} else {
			destino = "exibir_compromisso.jsp";
		}
		
		request.setAttribute("compromisso", compromisso);;
		RequestDispatcher despachar = request.getRequestDispatcher(destino);
		despachar.forward(request, response);
	}

}
