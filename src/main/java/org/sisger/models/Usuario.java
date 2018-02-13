package org.sisger.models;

import javax.persistence.Entity;

/***
 * Classe do usuario do sistema
 * @author stenio
 *
 */
@Entity
public class Usuario {
	String nome;
	String email;
	String senha;
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
	
	
	

}
