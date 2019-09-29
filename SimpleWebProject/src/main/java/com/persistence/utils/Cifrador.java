package com.persistence.utils;

import com.persistence.f3.app.distribuibles.abstraccion.comunes.util.jdbc.CommonsDBCPConnectionLoader;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;

import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;

public class Cifrador {
	private static byte[] SALT_BYTES = { (byte) 0xA9, (byte) 0x9B, (byte) 0xC8, (byte) 0x32, (byte) 0x56, (byte) 0x35, (byte) 0xE3, (byte) 0x03 };
	private static int ITERATION_COUNT = 19;

        private static final String CIFER_KEY = "A1B2C3D4";
        
        public static String encriptar(String str){
            return encriptar(CIFER_KEY, str);
        }
        
	/**
	 * Metodo que encripta una cadena utilizando una clave o 'passPhrase'
	 * 
	 * @param passPhrase
	 * @param str
	 * @return
	 */
	public static String encriptar(String passPhrase, String str) {
		Cipher ecipher = null;
		Cipher dcipher = null;
		try {
			// Crear la key
			KeySpec keySpec = new PBEKeySpec(passPhrase.toCharArray(), SALT_BYTES, ITERATION_COUNT);
			//PBEWithMD5AndDES
			SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES").generateSecret(keySpec);
			ecipher = Cipher.getInstance(key.getAlgorithm());
			dcipher = Cipher.getInstance(key.getAlgorithm());
			// Preparar los parametros para los ciphers
			AlgorithmParameterSpec paramSpec = new PBEParameterSpec(SALT_BYTES, ITERATION_COUNT);
			// Crear los ciphers
			ecipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);
			dcipher.init(Cipher.DECRYPT_MODE, key, paramSpec);
		} catch (javax.crypto.NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (java.security.NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (java.security.InvalidKeyException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		}
		try {
			// Encodear la cadena a bytes usando ISO-8859-1
			byte[] utf8 = str.getBytes("UTF8");
			// Encriptar
			byte[] enc = ecipher.doFinal(utf8);
			// Encodear bytes a base64 para obtener cadena
                        
			//return new sun.misc.BASE64Encoder().encode(enc);
            return org.apache.commons.codec.binary.Base64.encodeBase64String(enc);
		} catch (javax.crypto.BadPaddingException e) {
		} catch (IllegalBlockSizeException e) {
		} catch (UnsupportedEncodingException e) {
		}
		return null;
	}

        public static String desencriptar(String str){
            return desencriptar(CIFER_KEY, str);
        }
        
	/**
	 * Metodo que desencripta una cadena basandose en la clave o 'passPhrase'
	 * con la que se encripto
	 * 
	 * @param passPhrase
	 * @param str
	 * @return
	 */
	public static String desencriptar(String passPhrase, String str) {
		Cipher ecipher = null;
		Cipher dcipher = null;
		try {
			// Crear la key
			KeySpec keySpec = new PBEKeySpec(passPhrase.toCharArray(), SALT_BYTES, ITERATION_COUNT);
			SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES").generateSecret(keySpec);
			ecipher = Cipher.getInstance(key.getAlgorithm());
			dcipher = Cipher.getInstance(key.getAlgorithm());
			// Preparar los parametros para los ciphers
			AlgorithmParameterSpec paramSpec = new PBEParameterSpec(SALT_BYTES, ITERATION_COUNT);
			// Crear los ciphers
			ecipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);
			dcipher.init(Cipher.DECRYPT_MODE, key, paramSpec);
		} catch (javax.crypto.NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (java.security.NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (java.security.InvalidKeyException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		}
		try {
			// Decodear base64 y obtener bytes
                         
			//byte[] dec = new sun.misc.BASE64Decoder().decodeBuffer(str);
            byte[] dec = org.apache.commons.codec.binary.Base64.decodeBase64(str);
                        
			// Desencriptar
			byte[] utf8 = dcipher.doFinal(dec);
			// Decodear usando ISO-8859-1
			return new String(utf8, "UTF8");
		} catch (javax.crypto.BadPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (java.io.IOException e) {
			e.printStackTrace();
		}
		return null;
	} 

        
        public static void main(String[] args ){
            String libre = "algotracosa";
            String enc = Cifrador.encriptar(libre);
            
            String desencriptada = Cifrador.desencriptar(enc);
            
            System.out.println("Cadena libre: " + libre);
            System.out.println("Cadena encriptada: " + enc);
            System.out.println("Desencriptada: " + desencriptada);
            System.out.println("Equals: " + libre.equals(desencriptada));
        }
}