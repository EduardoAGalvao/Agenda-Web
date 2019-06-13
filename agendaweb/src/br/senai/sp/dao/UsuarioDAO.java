package br.senai.sp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.senai.sp.model.Usuario;

public class UsuarioDAO {
	
	private Usuario usuario;
	
	public UsuarioDAO(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public UsuarioDAO() {}
	
	// ** método para gravar um novo usuário
	public void cadastrar() {
		String sql = "INSERT INTO tbl_usuario "
				+ "(nome, senha, email) "
				+ "VALUES(?, AES_ENCRYPT(?, 'CHAVE'), ?)";
		
		try {
			PreparedStatement stm = Conexao.abrirConexao().prepareStatement(sql);
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getSenha());
			stm.setString(3, usuario.getEmail());
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Usuario autenticar(String email, String senha){
		
		Usuario usuarioAutenticado = null;
		
		String sql = "SELECT * FROM tbl_usuario "
				+ "WHERE "
				+ "email = ? "
				+ "AND CAST(AES_DECRYPT(senha, 'CHAVE') AS CHAR) "
				+ "= ?";
				
		ResultSet rs = null;
		
		try {
			PreparedStatement stm = Conexao.abrirConexao().prepareStatement(sql);
			stm.setString(1, email);
			stm.setString(2, senha);
			rs = stm.executeQuery();
			
			if(rs.next()) {
				usuarioAutenticado = new Usuario();
				usuarioAutenticado.setNome(rs.getString("nome"));
				usuarioAutenticado.setEmail(rs.getString("email"));
				usuarioAutenticado.setId(rs.getInt("id"));
			} else {
				System.out.println("TEM ALGUMA COISA ERRADA AÍ MERMÃO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return usuarioAutenticado;
	}
	
}
