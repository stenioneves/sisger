package org.sisger.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/***
 * Classe de gerenciamento da view e controle 
 * @author stenio
 *
 */

@Controller

public class Principal {
    
	@RequestMapping("principal")
	public ModelAndView principal(){
		ModelAndView modelAndView = new ModelAndView("principal");
		
		return modelAndView;
	}
}
