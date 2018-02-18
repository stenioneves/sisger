package org.sisger.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.sisger.models.Categoria;

public class CategoriaDAO {
	
	@PersistenceContext
	private EntityManager manage;
	
	public void CriarCategoria(Categoria cat){
		 manage.persist(cat);
	}
	

}
