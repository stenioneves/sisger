package org.sisger.models;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.sisger.models.system.Situacao;
import org.springframework.format.annotation.DateTimeFormat;

/***
 * Classe que com as informações de método de pagamento
 * 
 * @author stenio
 *
 */

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "fatura_gastos")
public class Fatura_Gastos {
 
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long codfatura;
	@ManyToOne
	@JoinColumn(name = "idMetodo")
	private Metodo metodotipo;
    @DateTimeFormat(pattern="MM/dd/yyyy")
    @Temporal(TemporalType.DATE)
	private Date criacao;
    @DateTimeFormat(pattern="MM/dd/yyyy")
    @Temporal(TemporalType.DATE)
	private Date fechamento;
	@ManyToOne
	@JoinColumn(name = "idSituacao")
	private Situacao situacao;
	@ManyToOne
	@JoinColumn(name = "cod")
	private Usuario responsavel;// reponsavel pela criação da fatura de gasto

	public Metodo getMetodotipo() {
		return metodotipo;
	}

	public void setMetodotipo(Metodo metodotipo) {
		this.metodotipo = metodotipo;
	}

	public Date getCriacao() {
		return criacao;
	}

	public void setCriacao(Date criacao) {
		this.criacao = criacao;
	}

	public Date getFechamento() {
		return fechamento;
	}

	public void setFechamento(Date fechamento) {
		this.fechamento = fechamento;
	}

	public Situacao getSituacao() {
		return situacao;
	}

	public void setSituacao(Situacao situacao) {
		this.situacao = situacao;
	}

	public Usuario getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(Usuario responsavel) {
		this.responsavel = responsavel;
	}

	public long getCodfatura() {
		return codfatura;
	}

	public void setCodfatura(long codfatura) {
		this.codfatura = codfatura;
	}

}
