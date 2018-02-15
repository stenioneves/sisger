package org.sisger.models;

import javax.persistence.Entity;

/***
 * Método é uma classe que guarda os métodos pagamentos  disponiveis pelo usuário, dinheiro, cartões de crédito e débitos
 * @author stenio
 *
 */
@Entity
public class Metodo {
	
	private int id;
	private String nome;
	private String tipo;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	

}
