package br.senai.sp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	
	public static Connection abrirConexao() {
		Connection conexao = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexao = DriverManager.getConnection("jdbc:mysql://localhost/db_agenda_web?useTimeZone=true&serverTimezone=UTC&useSSL=false", "root", "");
			System.out.println("Conectou");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Não conectou :(");
		}
		
		return conexao;
	}
	
}
