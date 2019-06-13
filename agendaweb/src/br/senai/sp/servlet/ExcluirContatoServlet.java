package br.senai.sp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.ContatoDAO;

@WebServlet("/ExcluirContatoServlet")
public class ExcluirContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluirContatoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("txt_id"));
		
		ContatoDAO dao = new ContatoDAO();
		
		if(dao.excluir(id)){
			response.sendRedirect("contatos.jsp");
		} 
	}

}
