package org.sisger.controllers;

import javax.servlet.http.HttpSession;

import org.sisger.models.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/***
 * Classe de gerenciamento da view e controle 
 * @author stenio
 *
 */

@Controller

public class Principal {
    /**
     *  Recebe a sessão criada e Redirecionamento com mensagem para o usuário
     * @param session
     * @param redirectAttributes
     * @return modelAndView
     */
	@RequestMapping("principal")
	public ModelAndView principal(HttpSession session, RedirectAttributes redirectAttributes){
		ModelAndView modelAndView = new ModelAndView("principal");
		if(session.getAttribute("usuario")==null){
			  redirectAttributes.addFlashAttribute("erro", "<div class=\"alert alert-warning\">"
						+ "<strong>Acesso não autorizado!</strong> "
						+ "Você precisa logar-se para acessa o sistema .</div>"

		  
		  );
			return new ModelAndView("redirect:/");  
		
		}
		
		Usuario usuario =(Usuario) session.getAttribute("usuario");//pega a sessão criada na autenticação e passo para um objeto do tipo usuario.
		modelAndView.getModel().put("usuario",usuario); //Adiciono objeto usuário dentro da view.
		return modelAndView;
	}
	
	 @RequestMapping("sair")
	  public ModelAndView sair(HttpSession http,RedirectAttributes redirectAttributes, SessionStatus sessionStatus){
		   sessionStatus.setComplete();
		  http.removeAttribute("usuario");
		  redirectAttributes.addFlashAttribute("erro", "<div class=\"alert alert-success\">Você foi deslogado com sucesso!</div>"

	  
	  );
		return new ModelAndView("redirect:/");  
	  }
}
