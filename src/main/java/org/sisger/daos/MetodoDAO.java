package org.sisger.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.sisger.models.Metodo;
import org.springframework.stereotype.Repository;

@Repository
public class MetodoDAO {

	@PersistenceContext
	private EntityManager manager;

	public void criarMetdo(Metodo met) {
		manager.persist(met);
	}
	
	public List<Metodo> listarMetdosAtivos(){
		return manager.createQuery("from Metodo m where m.ativo=:inf ",Metodo.class).setParameter("inf",true).getResultList();
		
	}
  
	public List<Metodo>ListarMetodos(){
		return manager.createQuery("from Metodo ",Metodo.class).getResultList();
	}
	
}
