package org.sisger.controllers;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.sisger.daos.CategoriaDAO;
import org.sisger.daos.Fatura_GastosDAO;
import org.sisger.daos.GastaoDAO;
import org.sisger.daos.MetodoDAO;
import org.sisger.daos.system.SituacaoDAO;
import org.sisger.models.Categoria;
import org.sisger.models.Fatura_Gastos;
import org.sisger.models.Gasto;
import org.sisger.models.Metodo;
import org.sisger.models.Usuario;
import org.sisger.models.system.Situacao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Transactional
@RequestMapping("/form/")
public class FormsController {

	@Autowired
	private GastaoDAO gastoDAO;
	@Autowired
	private CategoriaDAO categoriaDAO;
	@Autowired
	private Fatura_GastosDAO fatura_GastosDAO;
	@Autowired
	private MetodoDAO metodoDAO;
	@Autowired	
	private SituacaoDAO situacaoDAO;

	@RequestMapping(value = "salvarGasto", method = RequestMethod.POST)
	public ModelAndView salvarGasto(Gasto gasto, RedirectAttributes redirectAttributes, HttpSession sessao) {

		if (gasto == null) {
			// Teste basico, mas a validação dos campos será via html/javascript
			redirectAttributes.addFlashAttribute("msg", "<div class=\"alert alert-info\">Formulario em branco</div>");
			return new ModelAndView("redirect:/formgasto");

		}

		Usuario user = (Usuario) sessao.getAttribute("usuario");
		gasto.setUsuario(user);
		gastoDAO.inserGasto(gasto);
		redirectAttributes.addFlashAttribute("msg",
				"<div class=\"alert alert-info\">Dados enviados com sucesso!</div>");
		return new ModelAndView("redirect:/form/formgasto");
	}

	@RequestMapping(value = "formgasto", method = RequestMethod.GET)
	public ModelAndView formGasto(RedirectAttributes redirectAttributes, HttpSession sessao) {

		if (sessao.getAttribute("usuario") == null) {
			redirectAttributes.addFlashAttribute("erro", "<div class=\"alert alert-warning\">"
					+ "<strong>Acesso não autorizado!</strong> " + "Você precisa logar-se para acessa o sistema .</div>"

			);
			return new ModelAndView("redirect:/");
		}

		ModelAndView modelAndView = new ModelAndView("form/formGasto");
		modelAndView.addObject("categoria", categoriaDAO.listarCategorias());
		modelAndView.addObject("fat", fatura_GastosDAO.listarFaturasAbertas());

		return modelAndView;

	}
	
	@RequestMapping(value="formfatura",method=RequestMethod.GET)
	public ModelAndView formFatura(RedirectAttributes redirectAttributes,HttpSession sessao) {
		
		if (sessao.getAttribute("usuario") == null) {
			redirectAttributes.addFlashAttribute("erro", "<div class=\"alert alert-warning\">"
					+ "<strong>Acesso não autorizado!</strong> " + "Você precisa logar-se para acessa o sistema .</div>"

			);
			return new ModelAndView("redirect:/");
		}
		ModelAndView modelAndView = new ModelAndView("form/formFatura");
		modelAndView.addObject("met", metodoDAO.listarMetdosAtivos());
		modelAndView.addObject("sit", situacaoDAO.listar());
		return modelAndView;
	}
  
	
	@RequestMapping(value="salvarFatura",method=RequestMethod.POST)
	public ModelAndView salvarFatura(Fatura_Gastos fatura,HttpSession sessao, RedirectAttributes redirectAttributes) {
		
		if (fatura == null) {
			// Teste basico, mas a validação dos campos será via html/javascript
			redirectAttributes.addFlashAttribute("msg", "<div class=\"alert alert-info\">Formulario em branco</div>");
			return new ModelAndView("redirect:formfatura");

		}
		
		 fatura.setResponsavel((Usuario)sessao.getAttribute("usuario"));
		 fatura_GastosDAO.criarFaturaGasto(fatura);
		 redirectAttributes.addFlashAttribute("msg", "<div class=\"alert alert-info w3-col -s6\">Dados enviados com sucesso!</div>");
			return new ModelAndView("redirect:formfatura");
	}
	
	 @RequestMapping(value="formsituacao",method=RequestMethod.GET)
	public ModelAndView formSituacao(RedirectAttributes redirectAttributes,HttpSession sessao){
		 if(sessao.getAttribute("usuario")==null) {
				redirectAttributes.addFlashAttribute("erro", "<div class=\"alert alert-warning\">"
						+ "<strong>Acesso não autorizado!</strong> " + "Você precisa logar-se para acessa o sistema .</div>"

				);
				return new ModelAndView("redirect:/");
				} 
		   return new ModelAndView("form/formSituacao");
	 }
	
	
	
	 @RequestMapping( value="salvarSituacao",method=RequestMethod.POST)
	public ModelAndView criarSituacao(Situacao sit,RedirectAttributes redirectAttributes, HttpSession sessao) {
		
		
		situacaoDAO.inserir(sit);
			redirectAttributes.addFlashAttribute("msg", "<div class=\"alert alert-info w3-col-6\"> Dados enviado com sucesso!"
					+ "</div>");
			return new ModelAndView("redirect:formsituacao");
	}
	 
	
	 
	 @RequestMapping(value="formcategoria", method=RequestMethod.GET)
	 public ModelAndView formCategoria(HttpSession sessao,RedirectAttributes redirectAttributes) {
		 
		 if(sessao.getAttribute("usuario")==null) {
				redirectAttributes.addFlashAttribute("erro", "<div class=\"alert alert-warning\">"
						+ "<strong>Acesso não autorizado!</strong> " + "Você precisa logar-se para acessa o sistema .</div>"

				);
				return new ModelAndView("redirect:/");
				} 
		   return new ModelAndView("form/formCategoria");
	 }
	 
	 @RequestMapping(value="salvarcategoria",method=RequestMethod.POST)
	 public ModelAndView criarCategoria(Categoria cat,RedirectAttributes redirectAttributes,HttpSession sessao) {
		 
		 categoriaDAO.CriarCategoria(cat);
		 redirectAttributes.addFlashAttribute("msg", "<div class=\"alert alert-info w3-col-6\"> Dados enviado com sucesso!"
		 		+ "</div>");
		 return new ModelAndView("redirect:formcategoria");
		 
	 }
	 
	 @RequestMapping(value="formmetodo", method=RequestMethod.GET)
	 public ModelAndView  formMetodo(RedirectAttributes redirectAttributes,HttpSession sessao) {
		 
		 
		 if(sessao.getAttribute("usuario")==null) {
			 redirectAttributes.addFlashAttribute("erro", "<div class=\"alert alert-warning\">"
						+ "<strong>Acesso não autorizado!</strong> " + "Você precisa logar-se para acessa o sistema .</div>");
			 return new ModelAndView("redirect:/");
			 
		 }
		 return new ModelAndView("form/formMetodo");
		 
	 }
	 
	 @RequestMapping(value="salvarmetodo", method=RequestMethod.POST)
	 public ModelAndView salvarMetodo(Metodo metodo,RedirectAttributes redirectAttributes) {
		 
		 metodoDAO.criarMetdo(metodo);
		 redirectAttributes.addFlashAttribute("msg", "<div class=\"alert alert-info w3-col-6\"> Dados enviado com sucesso!"
			 		+ "</div>");
			 return new ModelAndView("redirect:formmetodo");
		 
	 }
	 
}
