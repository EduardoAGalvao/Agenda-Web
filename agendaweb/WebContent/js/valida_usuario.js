let botao = document.querySelector("#bt_criar_usuario");

botao.addEventListener("click", function(){
	// **** FAZER UMA REFERÊNCIA AO FORM
	let formulario = document.querySelector("#formulario_cadastro");
	
	// **** CRIAR UM OBJETO USUARIO
	let usuario = {
			nome: formulario.querySelector("#nome").value,
			email: formulario.querySelector("#email").value,
			senha: formulario.querySelector("#senha").value,
			conf_senha: formulario.querySelector("#conf_senha").value
	}
	
	// **** CRIAR VETOR QUE RECEBERÁ AS MENSAGENS DE ERRO DA FUNÇÃO
	let erros = validaUsuario(usuario);
	
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

function validaUsuario(usuario){
	// **** VETOR QUE RECEBERÁ A LISTA DE ERROS 
	let erros = [];
	
	// **** VERIFICAÇÃO DOS CAMPOS
	if(usuario.nome.length < 5){
		erros.push("O nome deve conter no mínimo 5 caracteres.");
		document.querySelector("#nome").style.borderColor = "red";
	} else{
		document.querySelector("#nome").style.borderColor = "green";
	}
	
	if(usuario.email.length < 5){
		erros.push("O email deve conter no mínimo 5 caracteres.");
		document.querySelector("#email").style.borderColor = "red";
	} else{
		document.querySelector("#email").style.borderColor = "green";
	}
	
	if(usuario.senha.length < 8){
		erros.push("A senha deve conter no mínimo 8 caracteres.");
		document.querySelector("#senha").style.borderColor = "red";
	} else{
		document.querySelector("#senha").style.borderColor = "green";
	}
	
	if(usuario.conf_senha.length < 8){
		erros.push("A confirmação da senha deve conter no mínimo 8 caracteres.");
		document.querySelector("#conf_senha").style.borderColor = "red";
	} else{
		document.querySelector("#conf_senha").style.borderColor = "green";
	}
	
	if(usuario.senha != usuario.conf_senha){
		erros.push("A senha não confere, por gentileza digite senhas iguais.")
		document.querySelector("#senha").style.borderColor = "red";
		document.querySelector("#conf_senha").style.borderColor = "red";
	} else{
		document.querySelector("#senha").style.borderColor = "green";
		document.querySelector("#conf_senha").style.borderColor = "green";
	}
	
	return erros;
	
}