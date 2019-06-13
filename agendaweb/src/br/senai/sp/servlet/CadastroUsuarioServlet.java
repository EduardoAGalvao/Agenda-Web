package br.senai.sp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.UsuarioDAO;
import br.senai.sp.model.Usuario;

@WebServlet("/CadastroUsuarioServlet")
public class CadastroUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CadastroUsuarioServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//**Modo antigo de resposta
		/*
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("	<head>");
		out.println("		<title>");
		out.println("			Resposta");
		out.println("		</title>");
		out.println("<link rel=\"stylesheet\" href=\"css/bootstrap.css\">");
		out.println("	</head>");
		out.println("	<body>");
		out.println("		<h1>");
		out.println("			Dados do usuário: ");
		out.println("		</h1>");
		out.println("		<h3>" + request.getParameter("nome") +"</h3>");
		out.println("	</body>");
		out.println("</html>");
		*/
		
		// ** Modo Atual
		Usuario usuario = new Usuario();
		usuario.setNome(request.getParameter("nome"));
		usuario.setEmail(request.getParameter("email"));
		usuario.setSenha(request.getParameter("senha"));
		
		UsuarioDAO dao = new UsuarioDAO(usuario);
		dao.cadastrar();
		
		//Redirecionando para outra página HTML
		response.sendRedirect("sucesso.html");
	}

}
