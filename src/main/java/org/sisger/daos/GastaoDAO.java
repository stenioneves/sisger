package org.sisger.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.sisger.models.Fatura_Gastos;
import org.sisger.models.Gasto;

public class GastaoDAO {
	
	
	@PersistenceContext
	private EntityManager manage;
	
	
	public void inserGasto(Gasto gasto){
		
		manage.persist(gasto);
	}
	
	public  List<Gasto> listarporFatura(Fatura_Gastos fatgasto){
		
		return manage.createQuery("form Gasto g where g.idGasto=:id",Gasto.class).setParameter("id",fatgasto.getCodfatura()).getResultList();
	}

}
