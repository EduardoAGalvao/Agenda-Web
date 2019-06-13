package br.senai.sp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.ContatoDAO;
import br.senai.sp.model.Contato;

@WebServlet("/ExibirContatoServlet")
public class ExibirContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExibirContatoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String operacao = request.getParameter("op");
		String destino;
		
		ContatoDAO dao = new ContatoDAO();
		
		Contato contato = dao.getContato(id);
		
		if(operacao.equals("atualizar")) {
			destino = "atualizar_contato.jsp";
		} else if(operacao.equals("excluir")){
			destino = "excluir_contato.jsp";
		} else {
			destino = "exibir_contato.jsp";
		}
		
		//Primeiro método para despachar um atributo
		//request.getSession().setAttribute("contato", contato);
		//response.sendRedirect("exibir_contato.jsp");
		
		request.setAttribute("contato", contato);;
		RequestDispatcher despachar = request.getRequestDispatcher(destino);
		despachar.forward(request, response);
	}


}
