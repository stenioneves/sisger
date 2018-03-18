package org.sisger.controllers;

import org.sisger.controllers.system.*;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.sisger.daos.Fatura_GastosDAO;
import org.sisger.daos.GastaoDAO;
import org.sisger.daos.MetodoDAO;
import org.sisger.daos.system.SituacaoDAO;
import org.sisger.models.Fatura_Gastos;
import org.sisger.models.Metodo;
import org.sisger.models.system.Situacao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/***
 * Classe para controle da view de listagem e outras funções
 * 
 * @author stenio
 *
 */

@Controller
@RequestMapping("listagem/")
@Transactional
public class ListagensController {

	@Autowired
	private Fatura_GastosDAO faturagasto;
	@Autowired
	private GastaoDAO gastodao;

	@RequestMapping("credito")
	public ModelAndView listarCredito(RedirectAttributes redirectAttributes, HttpSession sessao) {
		if (sessao.getAttribute("usuario") == null) {
			redirectAttributes.addFlashAttribute("erro",
					"<div class=\" alert alert-danger\"> <strong>Acesso negado! </strong>"
							+ " Você não está logado!</div>");
			return new ModelAndView("redirect:/");

		}
		ModelAndView model = new ModelAndView("listagem/listarviewgeral");
		model.addObject("cons", listarFaturaGeral(
				faturagasto.listarFaturasPorMetodoSit(this.auxilioMetodoPag("credito"),this.auxilioSit("Pendente"))));
		model.addObject("modo", " Historico de credito pendente");
		return model;
	}

	@RequestMapping("todasfaturas")
	public ModelAndView listartodasFaturas(RedirectAttributes redirectAttributes, HttpSession sessao) {
		if (sessao.getAttribute("usuario") == null) {
			redirectAttributes.addFlashAttribute("erro",
					"<div class=\" alert alert-danger\"> <strong>Acesso negado! </strong>"
							+ " Você não está logado!</div>");
			return new ModelAndView("redirect:/");

		}
		ModelAndView model = new ModelAndView("listagem/listarviewgeral");
		model.addObject("cons", listarFaturaGeral(faturagasto.listarFaturasAbertas()));
		model.addObject("modo", "Todos os Historicos de Gastos pendente");
		return model;
	}

	/**
	 * uestMapping("teste") public ModelAndView teste( HttpSession sessao){ Metodo m
	 * =new Metodo(); m.setAtivo(true); //m.setIdMetodo(1); m.setNome("ourocard");
	 * m.setTipo("credito"); //metododao.criarMetdo(m); Situacao sit = new
	 * Situacao(); //sit.setIdSituacao(1); sit.setNome("Pendente");
	 * //siti.inserir(sit); Fatura_Gastos gf =new Fatura_Gastos();
	 * gf.setMetodotipo(m); gf.setSituacao(sit);
	 * gf.setResponsavel((Usuario)sessao.getAttribute("usuario"));
	 * //faturagasto.criarFaturaGasto(gf);
	 * 
	 * for ( Fatura_Gastos f:faturagasto.listarFaturaCreditoAberto(m, sit)) {
	 * System.out.println("Codigos faturas:"+f.getCodfatura()); } return new
	 * ModelAndView("ok");
	 * 
	 * }
	 **/
	
	@RequestMapping("dinheiro")
	public ModelAndView listarFaturaDinheiro(HttpSession sessao,RedirectAttributes redirectAttributes) {
		
		if (sessao.getAttribute("usuario") == null) {
			redirectAttributes.addFlashAttribute("erro",
					"<div class=\" alert alert-danger\"> <strong>Acesso negado! </strong>"
							+ " Você não está logado!</div>");
			return new ModelAndView("redirect:/");

		}
		ModelAndView model = new ModelAndView("listagem/listarviewgeral");
		model.addObject("cons", listarFaturaGeral(
				faturagasto.listarFaturasPorMetodoSit(this.auxilioMetodoPag("dinheiro"),this.auxilioSit("Pendente"))));
		model.addObject("modo", " Historico aberto para modilidade dinheiro");
		return model;
		
	}
	
	
	private Metodo auxilioMetodoPag(String argu) {

		Metodo m = new Metodo();
		m.setTipo(argu);
		return m;
	}

	private Situacao auxilioSit(String argu) {
		Situacao sit = new Situacao();
		sit.setNome(argu);
		return sit;
	}

	/***
	 * Metodo para listar faturas e gasto associados esse método foi resinscrito
	 * para aceitar chamade de qualquer parte dessa classe e usar a mesma view para
	 * listar.
	 * 
	 * @param faturasgasto
	 * @return listagemEstruraFaturas
	 */

	private List<ListagemEstrura> listarFaturaGeral(List<Fatura_Gastos> faturasgasto) {
		List<ListagemEstrura> listagemEstruraFaturas = new ArrayList<ListagemEstrura>();
		for (Fatura_Gastos fs : faturasgasto) {
			ListagemEstrura ls = new ListagemEstrura();
			ls.setGf(fs);
			ls.setGastos_associados(gastodao.listarporFatura(fs));
			ls.somar();
			listagemEstruraFaturas.add(ls);
		    

		}
		return listagemEstruraFaturas;
	}

}
