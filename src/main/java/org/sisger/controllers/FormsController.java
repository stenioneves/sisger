package org.sisger.controllers;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.sisger.daos.CategoriaDAO;
import org.sisger.daos.Fatura_GastosDAO;
import org.sisger.daos.GastaoDAO;
import org.sisger.models.Gasto;
import org.sisger.models.Usuario;
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

	@RequestMapping(value = "salvarGasto", method = RequestMethod.POST)
	public ModelAndView savarGasto(Gasto gasto, RedirectAttributes redirectAttributes, HttpSession sessao) {

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

}
