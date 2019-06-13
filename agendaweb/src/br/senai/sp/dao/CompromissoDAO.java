package br.senai.sp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.senai.sp.model.Compromisso;
import br.senai.sp.model.Contato;
import br.senai.sp.model.Tipo;

public class CompromissoDAO {
	
	private Compromisso compromisso;

	public CompromissoDAO(Compromisso compromisso) {
		this.compromisso = compromisso;
	}
	
	public CompromissoDAO() {
		// TODO Auto-generated constructor stub
	}

	public boolean cadastrar() {
		
		String sql = "INSERT INTO tbl_compromissos ("
				+ "descricao, local, data, horario, observacoes, id_usuario, concluido) "
				+ "VALUES ( "
				+ "?, ?, ?, ?, ?, ?, ?);";
		
		PreparedStatement stm;
		
		try {
			stm = Conexao.abrirConexao().prepareStatement(sql);
			stm.setString(1, compromisso.getDescricao());
			stm.setString(2, compromisso.getLocal());
			stm.setString(3, compromisso.getData());
			stm.setString(4, compromisso.getHorario());
			stm.setString(5, compromisso.getObservacoes());
			stm.setInt(6, compromisso.getUsuario().getId());
			stm.setString(7, String.valueOf(compromisso.isConcluido()));
			stm.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	
	public ArrayList<Compromisso> getCompromissos(int id_usuario){
		String sql = "SELECT * FROM tbl_compromissos WHERE id_usuario = ? ORDER BY data";
		
		ArrayList<Compromisso> compromissos = new ArrayList<Compromisso>();
		ResultSet rs;
		PreparedStatement stm;
		
		try {
			stm = Conexao.abrirConexao().prepareStatement(sql);
			stm.setInt(1, id_usuario);
			rs = stm.executeQuery();
			
			while(rs.next()) {
				compromisso = new Compromisso();
				compromisso.setId(rs.getInt("id"));
				compromisso.setDescricao(rs.getString("descricao"));
				compromisso.setLocal(rs.getString("local"));
				compromisso.setData(rs.getString("data"));
				compromisso.setHorario(rs.getString("horario"));
				compromisso.setObservacoes(rs.getString("observacoes"));
				compromisso.setConcluido(rs.getBoolean("concluido"));
				compromissos.add(compromisso);
			}
			
			return compromissos;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public Compromisso getCompromisso(int id){
		
		String sql = "SELECT * FROM tbl_compromissos WHERE id = ?";
		
		ResultSet rs;
		
		PreparedStatement stm;
		
		try {
			stm = Conexao.abrirConexao().prepareStatement(sql);
			stm.setInt(1, id);
			rs = stm.executeQuery();
			
			if(rs.next()) {
				compromisso = new Compromisso();
				compromisso.setId(rs.getInt("id"));
				compromisso.setDescricao(rs.getString("descricao"));
				compromisso.setLocal(rs.getString("local"));
				compromisso.setData(rs.getString("data"));
				compromisso.setHorario(rs.getString("horario"));
				compromisso.setObservacoes(rs.getString("observacoes"));
				compromisso.setConcluido(rs.getBoolean("concluido"));
			}
			
			return compromisso;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public boolean excluir(int id) {
		String sql = "DELETE FROM tbl_compromissos WHERE id=?";
		
		PreparedStatement stm;
		
		try {
			stm = Conexao.abrirConexao().prepareStatement(sql);
			stm.setInt(1, id);
			stm.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public boolean atualizar() {
		String sql = "UPDATE tbl_compromissos SET descricao = ?, "
				+ "local = ?, data = ?, horario = ?, observacoes = ?, "
				+ "concluido = ? "
				+ "WHERE id = ?";
		
		PreparedStatement stm;
		
		try {
			stm = Conexao.abrirConexao().prepareStatement(sql);
			stm.setString(1, compromisso.getDescricao());
			stm.setString(2, compromisso.getLocal());
			stm.setString(3, compromisso.getData());
			stm.setString(4, compromisso.getHorario());
			stm.setString(5, compromisso.getObservacoes());
			stm.setString(6, String.valueOf(compromisso.isConcluido()));
			stm.setInt(7, compromisso.getId());
			stm.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	

}
