package org.sisger.controllers.system;

import java.util.List;

import org.sisger.models.Fatura_Gastos;
import org.sisger.models.Gasto;

public class ListagemEstrura {
	
	private Fatura_Gastos gf;
	private List<Gasto>gastos_associados;
	public Fatura_Gastos getGf() {
		return gf;
	}
	public void setGf(Fatura_Gastos gf) {
		this.gf = gf;
	}
	public List<Gasto> getGastos_associados() {
		return gastos_associados;
	}
	public void setGastos_associados(List<Gasto> gastos_associados) {
		this.gastos_associados = gastos_associados;
	}
	 

}
