package org.sisger.daos.system;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.sisger.models.system.Situacao;
import org.springframework.stereotype.Repository;

@Repository
public class SituacaoDAO {

	@PersistenceContext
	private EntityManager manage;

	public void inserir(Situacao sit) {

		manage.persist(sit);
	}

	public List<Situacao>listar(){
		return manage.createQuery("from Situacao",Situacao.class).getResultList();
	}
}
