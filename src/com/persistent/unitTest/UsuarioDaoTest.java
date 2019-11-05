package com.persistent.unitTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.persistent.dao.UsuarioDao;

class UsuarioDaoTest {

	@Test
	void testValidate() throws Exception {
		UsuarioDao usr = new UsuarioDao();
		boolean resultado = usr.validate("admin", "admin");
		assertTrue(resultado);
	}

}
