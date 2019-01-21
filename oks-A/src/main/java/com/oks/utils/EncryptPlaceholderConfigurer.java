package com.oks.utils;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

public class EncryptPlaceholderConfigurer extends PropertyPlaceholderConfigurer{
	
	// 需要加密的数组
	String[] encryptName = {"db.username","db.password"};

	@Override
	protected String convertProperty(String propertyName, String propertyValue) {
		if(isEncryptProp(propertyName)) {
			// 对已加密的字段进行解密
			String decryptValue = DESUutil.getDecryptString(propertyValue);
			return decryptValue;
		}else {
			return propertyValue;
		}
		
	}

	private boolean isEncryptProp(String propertyName) {
		// 若等于需要加密的field,则进行加密
		for(String encryptpropertyName:encryptName) {
			if(encryptpropertyName.equals(propertyName)) {
				return true;
			}
		}
		return false;
	}

}
