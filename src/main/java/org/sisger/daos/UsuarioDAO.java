package org.sisger.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.sisger.models.Usuario;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	
	public Usuario consutarUsuario(Usuario user){
		
		return manager.createQuery("from Usuario u where u.email=:email"
				  ,Usuario.class).setParameter("email",user.getEmail())
				  .getSingleResult();
		
	}

}
