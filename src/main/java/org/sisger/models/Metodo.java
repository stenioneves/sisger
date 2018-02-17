package org.sisger.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/***
 * Método é uma classe que guarda os métodos pagamentos  disponiveis pelo usuário, dinheiro, cartões de crédito e débitos
 * @author stenio
 *
 */

@Entity
@Table(name="metodo_pagamento")
public class Metodo {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idMetodo;
	@Column(name="nomeTipo_pag",length=30)
	private String nome;
	@Column(length=20)
	private String tipo;
	@Column
	private boolean ativo;// Informação se o método pagemento é valido.
	
	public int getIdMetodo() {
		return idMetodo;
	}
	public void setIdMetodo(int id) {
		this.idMetodo = id;
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
	public boolean isAtivo() {
		return ativo;
	}
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	

}
