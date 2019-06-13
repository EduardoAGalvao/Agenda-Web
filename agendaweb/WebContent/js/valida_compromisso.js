let botao = document.querySelector("#btn_cadastro_compromisso");

botao.addEventListener("click", function(){
	// **** FAZER UMA REFERÊNCIA AO FORM
	let formulario = document.querySelector("#formulario_cadastro_compromisso");
	
	// **** CRIAR UM OBJETO USUARIO
	let compromisso = {
			descricao: formulario.querySelector("#txt_descricao").value,
			local: formulario.querySelector("#txt_local").value,
			data: formulario.querySelector("#txt_dataconclusao").value,
			horario: formulario.querySelector("#txt_horario").value
	}
	
	// **** CRIAR VETOR QUE RECEBERÁ AS MENSAGENS DE ERRO DA FUNÇÃO
	let erros = validaCompromisso(compromisso);
	
	// **** CRIAR UMA REFERÊNCIA PARA O ELEMENTO <ul> QUE EXIBIRÁ A LISTA DE ERROS
	let ul = document.querySelector("#lista_erros");
	ul.textContent = "";
	
	if(erros.length > 0){
		//Impede o comportamento usual de um evento
		event.preventDefault();
		
		let divErro = document.querySelector("#alerta_erro");
		divErro.classList.add("alert", "alert-warning");
		
		for(let i=0; i < erros.length; i++){
			
			let li = document.createElement("li");
			li.textContent = erros[i];
			ul.appendChild(li);
		}
	}
});

function validaCompromisso(compromisso){
	// **** VETOR QUE RECEBERÁ A LISTA DE ERROS 
	let erros = [];
	
	// **** VERIFICAÇÃO DOS CAMPOS
	if(compromisso.descricao.length < 1){
		erros.push("Um compromisso deve ter uma descrição.");
		document.querySelector("#txt_descricao").style.borderColor = "red";
	} else{
		document.querySelector("#txt_descricao").style.borderColor = "green";
	}
	
	if(compromisso.local.length < 5){
		erros.push("O local deve conter no mínimo 5 caracteres.");
		document.querySelector("#txt_local").style.borderColor = "red";
	} else{
		document.querySelector("#txt_local").style.borderColor = "green";
	}
	
	if(compromisso.data == ""){
		erros.push("Por gentileza, defina uma data de conclusão.");
		document.querySelector("#txt_dataconclusao").style.borderColor = "red";
	} else{
		document.querySelector("#txt_dataconclusao").style.borderColor = "green";
	}
	
	if(compromisso.horario == ""){
		erros.push("Por gentileza, defina um horário de conclusão.");
		document.querySelector("#txt_horario").style.borderColor = "red";
	} else{
		document.querySelector("#txt_horario").style.borderColor = "green";
	}
	
	return erros;
	
}