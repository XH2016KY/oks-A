package com.oks.utils;

import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * DES加密工具
 * @author happyeveryday
 *
 */
public class DESUutil {
	
	private static Key key;
	
	// 设置密钥
	private static String KEY_STR = "myKey";
	private static String CHARSETNAME = "UTF-8";
	private static String ALGORITHM = "DES";
	
	static {
		try {
			KeyGenerator generator = KeyGenerator.getInstance(ALGORITHM);
			SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
			secureRandom.setSeed(KEY_STR.getBytes());
			generator.init(secureRandom);
			key = generator.generateKey();
			generator = null;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("restriction")
	public static String getEncryptString(String str) {
		BASE64Encoder base64encoder = new BASE64Encoder();
		try {
			byte[] bytes = str.getBytes(CHARSETNAME);
			Cipher cipher = Cipher.getInstance(ALGORITHM);
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byte[] doFinal = cipher.doFinal(bytes);
			return base64encoder.encode(doFinal);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}


	public static String getDecryptString(String str) {
		@SuppressWarnings("restriction")
		BASE64Decoder base64decoder = new BASE64Decoder();
		try {
			@SuppressWarnings("restriction")
			byte[] bytes = base64decoder.decodeBuffer(str);
			Cipher cipher = Cipher.getInstance(ALGORITHM);
			cipher.init(Cipher.DECRYPT_MODE, key);
			byte[] doFinal = cipher.doFinal(bytes);
			return new String(doFinal, CHARSETNAME);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
	public static void main(String[] args) {
		/*System.out.println(getEncryptString("root"));
		System.out.println(getEncryptString("230230"));
		System.out.println(getEncryptString("wxd7f6c5b8899fba83"));
		System.out.println(getEncryptString("665ae80dba31fc91ab6191e7da4d676d"));*/
		
		System.out.println(getEncryptString("jdbc:mysql://127.0.0.1:3306/session?useUnicode=true&characterEncoding=UTF-8&useSSL=false"));
		System.err.println(getDecryptString("YyO8qqFM8tiRK14voVamiw"+"=="));
		System.err.println(getDecryptString("xW6OiZLo8/kYFd+0f9nXNXXZg17CJWnfzCoMg8OHNheVgFVjD9KJKsNfA3gR9TiRFSQZJ52gM2PV\r\n" + 
				"PnmwI8p1dKaO9rq1yKpyGgp1fP9p5H43yKSWqN+HNB8kB9Ww/4zb"));
	}

}
