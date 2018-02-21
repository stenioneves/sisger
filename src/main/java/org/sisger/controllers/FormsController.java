package org.sisger.controllers;

import javax.transaction.Transactional;

import org.sisger.daos.GastaoDAO;
import org.sisger.models.Gasto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Transactional
public class FormsController {
	
	@Autowired
	private GastaoDAO gastoDAO;
	
	@RequestMapping(value ="salvarGasto", method=RequestMethod.POST)
	public ModelAndView savarGasto(Gasto gasto,RedirectAttributes redirectAttributes){
	 	if(gasto==null){
	 		//Teste basico, mas a validação dos campos será via html/javascript
	 		redirectAttributes.addFlashAttribute("msg","<div class=\"alert alert-info\">Formulario em branco</div>" );
	 	    return new ModelAndView("redirect:/formgasto");
	 	
	 	}
		 
	 	gastoDAO.inserGasto(gasto);
	 	redirectAttributes.addFlashAttribute("msg","<div class=\"alert alert-info\">Dados enviados com sucesso!</div>" );
	 	return new ModelAndView("redirect:/formgasto");
	}
	
	public ModelAndView formGasto(){
		
	}
     
}
