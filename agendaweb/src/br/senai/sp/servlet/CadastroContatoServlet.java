package br.senai.sp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.ContatoDAO;
import br.senai.sp.model.Contato;
import br.senai.sp.model.Tipo;
import br.senai.sp.model.Usuario;


@WebServlet("/CadastroContatoServlet")
public class CadastroContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CadastroContatoServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario();
		usuario = (Usuario) request.getSession().getAttribute("usuario");
		
		Contato contato = new Contato();
		contato.setNome(request.getParameter("txt_nome"));
		contato.setEmail(request.getParameter("txt_email"));
		contato.setData_nascimento(request.getParameter("txt_datanascimento"));
		contato.setTelefone(request.getParameter("txt_telefone"));
		contato.setEndereco(request.getParameter("txt_endereco"));
		contato.setTipo(Tipo.valueOf(request.getParameter("combo_tipo")));
		contato.setUsuario(usuario);
		
		ContatoDAO dao = new ContatoDAO(contato);
		if(dao.cadastrar()) {
			response.sendRedirect("contatos.jsp");
		} else {
			response.sendRedirect("cadastro_contato.jsp");
		}
	}

}
