package org.sisger.daos;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import org.sisger.models.Usuario;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAO {

	@PersistenceContext
	private EntityManager manager;

	/***
	 * Receber um objeto do tipo usuario somente com e-mail e senha e faz consulta
	 * no BD para localizar esse usuario
	 * 
	 * @param user
	 * @return usuario
	 */
	public Usuario consutarUsuario(Usuario user) throws NoResultException {

		return manager.createQuery("from Usuario u where u.email=:email", Usuario.class)
				.setParameter("email", user.getEmail()).getSingleResult();

	}

	public void criarUsuario(Usuario use) {
		manager.persist(use);
	}
}
