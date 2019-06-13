package br.senai.sp.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;
import br.senai.sp.dao.ContatoDAO;
import br.senai.sp.model.Compromisso;
import br.senai.sp.model.Contato;
import br.senai.sp.model.Tipo;
import br.senai.sp.model.Usuario;

@WebServlet("/CadastroCompromissoServlet")
public class CadastroCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CadastroCompromissoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario();
		usuario = (Usuario) request.getSession().getAttribute("usuario");
		
		Compromisso compromisso = new Compromisso();
		compromisso.setDescricao((request.getParameter("txt_descricao")));
		compromisso.setLocal((request.getParameter("txt_local")));
		compromisso.setData((request.getParameter("txt_dataconclusao")));
		compromisso.setHorario((request.getParameter("txt_horario")));
		compromisso.setDescricao((request.getParameter("txt_descricao")));
		compromisso.setObservacoes(request.getParameter("txt_observacoes"));
		compromisso.setConcluido(request.getParameter("txt_conclusao") != null ? true : false);
		compromisso.setUsuario(usuario);
		
		
		CompromissoDAO dao = new CompromissoDAO(compromisso);
		if(dao.cadastrar()) {
			response.sendRedirect("compromissos.jsp");
		} else {
			response.sendRedirect("cadastro_compromisso.jsp");
		}
	
	}

}
