package com.persistent.unitTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.persistent.bean.Functions;


class LoginTest {

	@Test
	void testValidateVoid() {
		Functions f=new Functions();
		boolean resultado = f.validateVoid("admin");
		assertTrue(resultado);
	}

	@Test
	void testValidatePass() {
		Functions f=new Functions();
		boolean resultado = f.validatePass("1HOLAMmsdd$");
		assertTrue(resultado);
	}
}
