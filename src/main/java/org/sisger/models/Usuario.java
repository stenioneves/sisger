package org.sisger.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/***
 * Classe do usuario do sistema
 * @author stenio
 *
 */
@Entity
@Table(name="usuario_sistema")
public class Usuario {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cod; //Criado para o controle do BD
	@Column(length=50)
	String nome;
	@Column(length=60)
	String email;
	@Column(length=12)
	String senha;
	@Column
	boolean permissao;
	
	
	
	
	
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public boolean isPermissao() {
		return permissao;
	}
	public void setPermissao(boolean permissao) {
		this.permissao = permissao;
	}
	public int getCod() {
		return cod;
	}
	public void setCod(int cod) {
		this.cod = cod;
	}
	
	
	

}
