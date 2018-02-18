package org.sisger.controllers;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.sisger.daos.UsuarioDAO;
import org.sisger.daos.system.SituacaoDAO;
import org.sisger.models.Usuario;
import org.sisger.models.system.Situacao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/***
 * Classe de gerenciamento da views principais.
 * @author stenio
 *
 */
@Controller
@Transactional
public class HomeController {
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	
	@RequestMapping("/")// Tela de login
	public ModelAndView index(Usuario user){
		 ModelAndView andView =new ModelAndView("index");
		return andView ;
		
	}
	
	@RequestMapping(value="efetuarLogin",method=RequestMethod.POST)
	public ModelAndView autenticacao( Usuario user,RedirectAttributes redirectAttributes,HttpSession sessao){
		 try{
		Usuario us= usuarioDAO.consutarUsuario(user);
		if(user.getEmail().equals(us.getEmail())&& user.getSenha().equals(us.getSenha()))
		{
			sessao.setAttribute("usuario", us);
			
			return new ModelAndView("redirect:principal");
			
			
		}
		else
		{
			redirectAttributes.addFlashAttribute("erro"," <div class=\"alert alert-danger\"> Usuário ou senha inválidos :( </div>");
			return new ModelAndView("redirect:/");
		}
		 }catch(NoResultException e){
			 redirectAttributes.addFlashAttribute("erro"," <div class=\"alert alert-danger\">Usuário não encontrado no sistema </div>");
				return new ModelAndView("redirect:/");
		 }
	}

}
