package com.persistent.unitTest;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.persistent.dao.UsuarioDao;
import com.persistent.model.Usuario;

class UsuarioDaoTest {

	@Test
	void testValidate() throws Exception {
		UsuarioDao usr = new UsuarioDao();
		boolean resultado = usr.validate("adUser", "R0ot$pass");
		assertTrue(resultado);
	}

	@Test
	void testallUsers() throws Exception {
		UsuarioDao usr = new UsuarioDao();
		List<Usuario> listResultado = usr.allUsers();
		assertNotNull(listResultado);
	}

	@Test
	void testinsertUser() throws Exception {
		Usuario s = new Usuario(3, "Henry Alexis", "Zelidon Crespin", "adUser", "R0ot$pass", "aaa23@gmail.com");
		UsuarioDao usr = new UsuarioDao();
		usr.insertUser(s);
		//assertEquals(0,usr.insertUser(s));
		
	}
}
