<%@page import="br.senai.sp.model.Contato"%>
<%@page import="br.senai.sp.model.Tipo"%>
<%@page import="br.senai.sp.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    
	    Usuario usuario = new Usuario();
			//session é uma variável nativa, é usada para manipular a sessão
			//O tipo está em parenteses pois identifica um casting
			usuario = ( Usuario ) session.getAttribute("usuario");
			
			//Primeiro modo de obter um atributo por despachante
			//Contato contato = (Contato) session.getAttribute("contato");
			
			//Segundo modo de obter um atributo por despachante
			Contato contato = (Contato) request.getAttribute("contato");
			
			if(usuario == null){
				//Envia o usuário para a tela de login caso seja nulo, ou seja, não autenticado
				response.sendRedirect("login.html");
			} else {
	    	//Renderiza o HTML
		%>
	
			<!DOCTYPE html>
			<html>
			<head>
			<meta charset="UTF-8">
			<title>Agenda Web - Exibir Contato</title>
			<link rel="stylesheet" href="css/bootstrap.css">
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
						
						<!-- Coluna da Direita -->
						<div class="col-md-9">
							<div class="card">
								<div class="card-header bg-success text-white">Meus Contatos</div>
								<div class="card-body">
								
									<div class="alert alert-primary">
										<h5>Visualizando Contato</h5>
									</div>
								
									<form id="formulario_cadastro_contato" action="CadastroContatoServlet" method="post">
										<div class="form-row">
											<div class="form-group col-md-8">
												<label for="txt_nome">Nome:</label>
												<input id="txt_nome" class="form-control" type="text" name="txt_nome" value="<%= contato.getNome() %>"/>
											</div>
											<div class="form-group col-md-4">
												<label for="txt_datanascimento">Data de Nascimento:</label>
												<input id="txt_datanascimento" class="form-control" type="date" name="txt_datanascimento" value="<%= contato.getData_nascimento() %>"/>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="txt_email">Email:</label>
												<input id="txt_email" class="form-control" type="email" name="txt_email" value="<%= contato.getEmail() %>"/>
											</div>
											<div class="form-group col-md-3">
												<label for="txt_telefone">Telefone:</label>
												<input id="txt_telefone" class="form-control" type="text" name="txt_telefone" value="<%= contato.getTelefone() %>"/>
											</div>
											<div class="form-group col-md-3">
												<label>Tipo de Contato:</label>
												<select name="combo_tipo" class="form-control">
													<option <%= contato.getTipo().toString().equals("AMIGO") ? "selected" : "" %> value="<%= Tipo.AMIGO %>">AMIGO</option>
													<option <%= contato.getTipo().toString().equals("FAMILIA") ? "selected" : "" %> value="<%= Tipo.FAMILIA %>">FAMILIA</option>
													<option <%= contato.getTipo().toString().equals("PROFISSIONAL") ? "selected" : "" %> value="<%= Tipo.PROFISSIONAL %>">PROFISSIONAL</option>
												</select>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-12">
												<label for="txt_endereco">Endereço:</label>
												<input id="txt_endereco" class="form-control" type="text" name="txt_endereco" value="<%= contato.getEndereco() %>"/>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-12 text-right mt-3">
												<a class="btn btn-primary" href="contatos.jsp">Voltar aos contatos</a>
											</div>
										</div>
									</form>
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
				<!-- JS files -->
				<script type="text/javascript" src="js/valida_contato.js"></script>
			</body>
			</html>

<%
		}
%>