package org.sisger.daos;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.sisger.models.Metodo;
import org.springframework.stereotype.Repository;

@Repository
public class MetodoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void criarMetdo(Metodo met){
		manager.persist(met);
	}

}
