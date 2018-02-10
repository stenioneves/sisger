package org.sisger.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/***
 * Classe de gerenciamento da views principais.
 * @author stenio
 *
 */
@Controller
public class HomeController {	
	
	@RequestMapping("/")// Tela de login
	public ModelAndView index(){
		 ModelAndView andView =new ModelAndView("index");
		return andView ;
		
	}
	

}
