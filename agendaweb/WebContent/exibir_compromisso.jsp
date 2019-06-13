<%@page import="br.senai.sp.model.Compromisso"%>
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
		Compromisso compromisso = (Compromisso) request.getAttribute("compromisso");
			
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
			<title>Agenda Web - Exibir Compromisso</title>
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
								<div class="card-header bg-success text-white">Meus Compromissos</div>
								<div class="card-body">
								
									<div class="alert alert-primary">
										<h5>Visualizando Compromisso</h5>
									</div>
								
									<form id="formulario_cadastro_contato">
										<div class="form-row">
											<div class="form-group col-md-12">
												<input id="txt_id" name="txt_id" value="<%= compromisso.getId() %>" type="hidden"/>
												<label for="txt_descricao">Descrição:</label>
												<input id="txt_descricao" class="form-control" type="text" name="txt_descricao" value="<%= compromisso.getDescricao() %>"/>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="txt_local">Local:</label>
												<input id="txt_local" class="form-control" type="text" name="txt_local" value="<%= compromisso.getLocal() %>"/>
											</div>
											<div class="form-group col-md-3">
												<label for="txt_horario">Horário:</label>
												<input id="txt_horario" class="form-control" type="time" name="txt_horario" value="<%= compromisso.getHorario() %>"/>
											</div>
											<div class="form-group col-md-3">
												<label for="txt_dataconclusao">Data de Conclusão:</label>
												<input id="txt_dataconclusao" class="form-control" type="date" name="txt_dataconclusao" value="<%= compromisso.getData() %>"/>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-12">
												<label for="txt_observacoes">Observações:</label>
												<textarea class="col-md-12" id="txt_observacoes" name="txt_observacoes"><%= compromisso.getObservacoes() %></textarea>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-3">
												<label for="txt_conclusao">Status: </label><br>
												Concluído <input type="checkbox" id="txt_conclusao" name="txt_conclusao" value="<%= compromisso.isConcluido() %>" <%= compromisso.isConcluido() == true ? "checked" : "" %>/>
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-12 text-right mt-3">
												<a class="btn btn-primary" href="compromissos.jsp">Voltar aos compromissos</a>
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