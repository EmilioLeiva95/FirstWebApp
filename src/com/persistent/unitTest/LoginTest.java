package com.persistent.unitTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.persistent.bean.Login;

class LoginTest {

	@Test
	void testValidateVoid() {
		Login l = new Login();
		boolean resultado = l.validateVoid("admin");
		assertTrue(resultado);
	}

	@Test
	void testValidatePass() {
		Login l = new Login();
		boolean resultado = l.validatePass("1HOLAMmsdd$");
		assertTrue(resultado);
	}
}
