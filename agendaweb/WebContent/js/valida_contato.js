let botao = document.querySelector("#btn_cadastro_contato");

botao.addEventListener("click", function(){
	// **** FAZER UMA REFERÊNCIA AO FORM
	let formulario = document.querySelector("#formulario_cadastro_contato");
	
	// **** CRIAR UM OBJETO USUARIO
	let contato = {
			nome: formulario.querySelector("#txt_nome").value,
			email: formulario.querySelector("#txt_email").value,
			telefone: formulario.querySelector("#txt_telefone").value,
			data_nascimento: formulario.querySelector("#txt_datanascimento").value,
			endereco: formulario.querySelector("#txt_endereco").value
	}
	
	// **** CRIAR VETOR QUE RECEBERÁ AS MENSAGENS DE ERRO DA FUNÇÃO
	let erros = validaContato(contato);
	
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

function validaContato(contato){
	// **** VETOR QUE RECEBERÁ A LISTA DE ERROS 
	let erros = [];
	
	// **** VERIFICAÇÃO DOS CAMPOS
	if(contato.nome.length < 5){
		erros.push("O nome deve conter no mínimo 5 caracteres.");
		document.querySelector("#txt_nome").style.borderColor = "red";
	} else{
		document.querySelector("#txt_nome").style.borderColor = "green";
	}
	
	if(contato.email.length < 5){
		erros.push("O email deve conter no mínimo 5 caracteres.");
		document.querySelector("#txt_email").style.borderColor = "red";
	} else{
		document.querySelector("#txt_email").style.borderColor = "green";
	}
	
	if(contato.telefone.length < 11){
		erros.push("O telefone deve conter no mínimo 11 caracteres, inclua o DDD.");
		document.querySelector("#txt_telefone").style.borderColor = "red";
	} else{
		document.querySelector("#txt_telefone").style.borderColor = "green";
	}
	
	if(contato.data_nascimento == ""){
		erros.push("Por gentileza, defina uma data de nascimento.");
		document.querySelector("#txt_datanascimento").style.borderColor = "red";
	} else{
		document.querySelector("#txt_datanascimento").style.borderColor = "green";
	}
	
	if(contato.endereco.length < 8){
		erros.push("O endereço deve conter no mínimo 8 caracteres.");
		document.querySelector("#txt_endereco").style.borderColor = "red";
	} else{
		document.querySelector("#txt_endereco").style.borderColor = "green";
	}
	
	return erros;
	
}