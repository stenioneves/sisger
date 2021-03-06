package org.sisger.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.sisger.models.Fatura_Gastos;
import org.sisger.models.Gasto;
import org.springframework.stereotype.Repository;

@Repository
public class GastaoDAO {

	@PersistenceContext
	private EntityManager manage;

	public void inserGasto(Gasto gasto) {

		manage.persist(gasto);
	}

	public List<Gasto> listarporFatura(Fatura_Gastos fatgasto) {

		return manage.createQuery("from Gasto g where g.faturaAssociativa.codfatura=:id", Gasto.class)
				.setParameter("id", fatgasto.getCodfatura()).getResultList();
	}

	List<Gasto> listarGastos() {
		return manage.createQuery("select distinct(g) from Gasto g", Gasto.class).getResultList();
	}
	
	public Gasto consultaGasto(long id) {
		
		return manage.createQuery("from Gasto g where g.idGasto=:id",Gasto.class).setParameter("id", id)
				.getSingleResult();
		
		
	}
}
