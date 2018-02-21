package org.sisger.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.sisger.models.Categoria;

public class CategoriaDAO {
	
	@PersistenceContext
	private EntityManager manage;
	
	public void CriarCategoria(Categoria cat){
		 manage.persist(cat);
	}
   
	public void excluir(Categoria cat){
		manage.remove(cat);
	}

	
	public List<Categoria> listarCategorias(){
		return manage.createQuery(" select distinct(c) from Categoria c",Categoria.class).getResultList();
	}
	
	public void alteraCategoria(Categoria cat){
		manage.merge(cat);
		
	}
}
