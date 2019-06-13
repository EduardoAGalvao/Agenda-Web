package br.senai.sp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;
import br.senai.sp.model.Compromisso;

@WebServlet("/AtualizarCompromissoServlet")
public class AtualizarCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AtualizarCompromissoServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Compromisso compromisso = new Compromisso();
		compromisso.setId(Integer.parseInt(request.getParameter("txt_id")));
		compromisso.setDescricao((request.getParameter("txt_descricao")));
		compromisso.setLocal((request.getParameter("txt_local")));
		compromisso.setData((request.getParameter("txt_dataconclusao")));
		compromisso.setHorario((request.getParameter("txt_horario")));
		compromisso.setObservacoes((request.getParameter("txt_observacoes")));
		compromisso.setDescricao((request.getParameter("txt_descricao")));
		compromisso.setConcluido(request.getParameter("txt_conclusao") != null ? true : false);
		
		CompromissoDAO dao = new CompromissoDAO(compromisso);
		
		if(dao.atualizar()){
			response.sendRedirect("compromissos.jsp");
		}
	}

}
