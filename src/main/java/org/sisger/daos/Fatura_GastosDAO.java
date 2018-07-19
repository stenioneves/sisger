package org.sisger.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.sisger.models.Fatura_Gastos;
import org.sisger.models.Metodo;
import org.sisger.models.system.Situacao;
import org.springframework.stereotype.Repository;

@Repository
public class Fatura_GastosDAO {

	@PersistenceContext
	private EntityManager manager;

	public void criarFaturaGasto(Fatura_Gastos fatura) {

		manager.persist(fatura);

	}

	public List<Fatura_Gastos> listarFaturasPorMetodoSit(Metodo metodo, Situacao sit) {

		return manager
				.createQuery("from Fatura_Gastos fg where fg.metodotipo.tipo=:tipo and fg.situacao.nome=:nome",
						Fatura_Gastos.class)
				.setParameter("tipo", metodo.getTipo()).setParameter("nome", sit.getNome()).getResultList();
	}

	public List<Fatura_Gastos> listarFaturasAbertas() {
		return manager.createQuery("from Fatura_Gastos fg where fg.situacao.nome=:sit", Fatura_Gastos.class)
				.setParameter("sit", "Pendente").getResultList();
	}
	
	public List<Fatura_Gastos>todosHistoricos(){
		 return manager.createQuery("from Fatura_Gastos ",Fatura_Gastos.class).getResultList();
	}
}
