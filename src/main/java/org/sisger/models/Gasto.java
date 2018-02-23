package org.sisger.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

/***
 * Classe principal referente a lacamento de gastos no sistema.
 * 
 * @author stenio
 *
 */

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "gasto")
public class Gasto {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long idGasto;
	@Column(name = "nomeGasto", length = 30)
	private String nome;
	@Column(scale = 2)
	private Double valor;

	private Date dateGasto;
	@Lob
	private String descricao;
	@ManyToOne
	@JoinColumn(name = "id")
	private Categoria categoria;
	@ManyToOne
	@JoinColumn(name = "cod")
	private Usuario usuario;
	@ManyToOne
	@JoinColumn(name = "codfatura")
	private Fatura_Gastos faturaAssociativa;

	public long getIdGasto() {
		return idGasto;
	}

	public void setIdGasto(long idGasto) {
		this.idGasto = idGasto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Date getDateGasto() {
		return dateGasto;
	}

	public void setDateGasto(Date dateGasto) {
		this.dateGasto = dateGasto;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Fatura_Gastos getFaturaAssociativa() {
		return faturaAssociativa;
	}

	public void setFaturaAssociativa(Fatura_Gastos faturaAssociativa) {
		this.faturaAssociativa = faturaAssociativa;
	}

}
