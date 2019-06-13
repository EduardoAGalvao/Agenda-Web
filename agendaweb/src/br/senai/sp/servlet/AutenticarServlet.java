package br.senai.sp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.senai.sp.dao.UsuarioDAO;
import br.senai.sp.model.Usuario;

@WebServlet("/AutenticarServlet")
public class AutenticarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AutenticarServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		UsuarioDAO dao = new UsuarioDAO();
		Usuario usuarioAutenticado = new Usuario();
		
		usuarioAutenticado = dao.autenticar(email, senha); 
		if( usuarioAutenticado != null) {
			request.getSession().setAttribute("usuario", usuarioAutenticado);
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("login.html");
		}
	}

}
