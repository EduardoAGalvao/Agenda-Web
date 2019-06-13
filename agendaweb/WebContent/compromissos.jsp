<%@page import="br.senai.sp.dao.CompromissoDAO"%>
<%@page import="br.senai.sp.model.Compromisso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.senai.sp.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    
    Usuario usuario = new Usuario();
		//session é uma variável nativa, é usada para manipular a sessão
		//O tipo está em parenteses pois identifica um casting
		usuario = ( Usuario ) session.getAttribute("usuario");
		
		// **** RETORNA UMA ARRAYLIST COM OS CONTATOS
		ArrayList<Compromisso> compromissos = new ArrayList<Compromisso>();
		CompromissoDAO dao = new CompromissoDAO();
		compromissos = dao.getCompromissos(usuario.getId());
		
		if(usuario == null){
			response.sendRedirect("login.html");
		} else {
    	//Renderiza o HTML
	%>
	
			<!DOCTYPE html>
			<html>
			<head>
			<meta charset="UTF-8">
			<title>Agenda Web - Meus Compromissos</title>
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/style.css">
			</head>
			<body>
				<nav class="navbar navbar-dark bg-info">
					<div class="container-fluid">
						<div class="navbar-header">
							<img src="img/cloud48.png"/>
							<a class="navbar-brand" href="index.jsp"><h3>Agenda Web 1.0</h3></a>
						</div>
					</div>
				</nav>
				
				<div class="container mb-5">
					<div class="row mt-3">
						<div class="col-md-3">
							<div class="card">
								<div class="card-header bg-success text-white">Usuário</div>
								<div class="card-body text-center">
									<img src="img/user64.png"/>
									<p><%= usuario.getNome() %></p>
									<p><%= usuario.getEmail() %></p>
								</div>
								<div class="card-footer text-center">
									<a href="FinalizarSessaoServlet">Sair do Sistema</a>
								</div>
							</div>
							<div class="card mt-3">
								<div class="card-header bg-success text-white">Menu</div>
								<div class="list-group">
			    				<a href="index.jsp" class="list-group-item list-group-item-action"><img src="img/home20.png" class="mr-2"/>Home</a>
			    				<a href="contatos.jsp" class="list-group-item list-group-item-action"><img src="img/contatos20.png" class="mr-2"/>Meus Contatos</a>
			    				<a href="compromissos.jsp" class="list-group-item list-group-item-action"><img src="img/compromissos20.png" class="mr-2"/>Meus Compromissos</a>
			  				</div>
								<div class="card-footer"></div>
							</div>
						</div>
						<div class="col-md-9">
							<div class="card">
								<div class="card-header bg-success text-white">
									<div class="row">
										<div class="col-md-6">Meus Compromissos</div>
										<div class="col-md-6 text-right"><a class="btn btn-dark" href="cadastro_compromisso.jsp">Novo Compromisso</a></div>
									</div>
								</div>
								<div class="card-body">
									
									<!-- Tabela para exibir a lista de contatos -->
									<table class="table table-hover">
										<thead class="thead-dark">
											<tr>
												<th>ID</th>
												<th>COMPROMISSO</th>
												<th>DATA</th>
												<th>STATUS</th>
												<th></th>
												<th></th>
											</tr>
										</thead>
										
										<% for(Compromisso compromisso: compromissos){ %>
											<tr>
												<!-- String.format() fornece máscaras, %04d indica um dígito de 4 números -->
												<td><%= String.format("%04d", compromisso.getId()) %></td>
												<td><a href="ExibirCompromissoServlet?id=<%=compromisso.getId()%>&op=exibir"><%= compromisso.getDescricao() %></a></td>
												<td><input id="txt_exibir_data"type="date" value="<%= compromisso.getData() %>" readonly/></td>
												<td><%= compromisso.isConcluido() == true ? "CONCLUÍDO" : "PENDENTE" %></td>
												<td>
													<a href="ExibirCompromissoServlet?id=<%=compromisso.getId()%>&op=atualizar"><img src="img/update_contact.png"></a>
												</td>
												<td>
													<a href="ExibirCompromissoServlet?id=<%=compromisso.getId()%>&op=excluir"><img src="img/delete_contact.png"></a>
												</td>
											</tr>
										<%} %>
									</table>
									
								</div>
								<div class="card-footer"></div>
							</div>
						</div>
					</div>
				</div>
				
				<footer>
					<hr>
					<p class="text-center">Desenvolvido por Eduardo A Galvão | SENAI 2019<br>
					Contato: eduardo.aug.galvao@gmail.com.br </p>
				</footer>
				
			</body>
			</html>

<%
		}
%>