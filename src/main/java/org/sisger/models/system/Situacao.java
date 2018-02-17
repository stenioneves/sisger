package org.sisger.models.system;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/***
 * classe do sistema para apoio de listagem da situação que irá virar tb de apoio.
 * @author stenio
 *
 */
@Entity
@Table(name="tb_apoio_situacao")
public class Situacao {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    private int idSituacao;
    @Column(name="nomeSituacao",length=20)
	private String nome;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getIdSituacao() {
		return idSituacao;
	}

	public void setIdSituacao(int idSituacao) {
		this.idSituacao = idSituacao;
	}

	
	
}
