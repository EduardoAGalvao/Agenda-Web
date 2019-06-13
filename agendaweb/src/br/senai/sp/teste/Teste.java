package br.senai.sp.teste;

import java.sql.ResultSet;
import java.util.ArrayList;

import br.senai.sp.dao.Conexao;
import br.senai.sp.dao.ContatoDAO;
import br.senai.sp.dao.UsuarioDAO;
import br.senai.sp.model.Contato;
import br.senai.sp.model.Tipo;
import br.senai.sp.model.Usuario;

public class Teste {

	public static void main(String[] args) {
		
		//Testando conexão - sucesso em 13/05
		//Conexao.abrirConexao();
		
		//Teste de cadastro - sucesso em 13/05
		/*
		Usuario usuario = new Usuario();
		usuario.setNome("Alessandro");
		usuario.setEmail("alessandro@teste.com.br");
		usuario.setSenha("123");
		
		UsuarioDAO dao = new UsuarioDAO(usuario);
		dao.cadastrar();
		*/
		
		//Teste de autenticação - sucesso em 16/05
		//UsuarioDAO dao = new UsuarioDAO();
		//dao.autenticar("usuario@teste.com.br", "423");
		
		//Teste de cadastro da ContatoDAO
		/*
		Contato c = new Contato();
		c.setNome("Ronald McDonald");
		c.setEmail("ronald@mcdonald.com");
		c.setData_nascimento("1997-05-06");
		c.setTelefone("(11)4002-8922");
		c.setEndereco("Rua Teste da Teste, 666");
		c.setTipo(Tipo.PROFISSIONAL);
		
		ContatoDAO dao = new ContatoDAO(c);
		dao.cadastrar();
		*/
		
		/*
		//Teste de Exibição de contatos - Validado em 27/05
		ContatoDAO dao = new ContatoDAO();
		ArrayList<Contato> contatos = dao.getContatos();
		
		for(Contato c : contatos) {
			System.out.println(c.getNome() + " - " + c.getEmail());
		}
		*/
		
		/*
		//Teste de Exibição de contatos - Validado em 27/05
		ContatoDAO dao = new ContatoDAO();
		Contato contato = dao.getContato(7);
		System.out.println(contato.getNome()); //Retorna Andressa
		*/
		
		/*
		//Teste de Exclusão - Validado em 31/05
		ContatoDAO dao = new ContatoDAO();
		dao.excluir(4);
		*/
		
		/*
		//Teste de Edição - Validado em
		Contato c = new Contato();
		c.setNome("Ronaldo McDonald");
		c.setEmail("ronald@mcdonald.com");
		c.setData_nascimento("1997-05-06");
		c.setTelefone("(11)4002-8922");
		c.setEndereco("Rua Teste da Teste, 666");
		c.setTipo(Tipo.PROFISSIONAL);
		c.setId(2);
		
		ContatoDAO dao = new ContatoDAO(c);
		dao.atualizar();
		*/
	}

}
