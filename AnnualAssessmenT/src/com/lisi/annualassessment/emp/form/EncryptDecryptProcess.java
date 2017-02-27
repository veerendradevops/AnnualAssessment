package com.lisi.annualassessment.emp.form;

public class EncryptDecryptProcess {
	
	public static void main(String args[]) {
		double inputValue = 10000; 
		String encryptValue=String.valueOf(inputValue);
		String encryptTechnique = encryptTechnique(encryptValue);
		System.out.println("Final Encrypt for given input value:::"+inputValue+":::" + encryptTechnique);

		//~***?*
		String decryptTechnique = decryptTechnique(encryptTechnique);
		System.out.println("Final decrypt for encrypt value value:::" + encryptTechnique+":::"+decryptTechnique);
	}

	public static String encryptTechnique(String encryptValue) {
		
		          
	/*BigDecimal bigDecimal=new BigDecimal(value);
		System.out.println("BigDecmial::::"+bigDecimal);*/

		if(String.valueOf(encryptValue).equalsIgnoreCase("null")){
			
			encryptValue="0.00";
		}
		
		System.out.println(String.valueOf(encryptValue));
		System.out.println("encrypt data " + encryptValue);
		
		if(encryptValue.trim().isEmpty()){
			
			encryptValue="0.0";
		}
		
		
		String encriptData = "";
		int length = 0;
		String str = String.valueOf(encryptValue.trim());

		for (int j = 0; j < str.length(); j++) {
			
			char c = str.charAt(j);
			
			if (c == '.') {
				length = j;
			//	System.out.println("length before decimal::"+length);
			}
		}

		for (int i = 0; i < str.length(); i++) {

			char c = str.charAt(i);
		//	System.out.println(c);
			if (i == 0 && length>=2) {
				char first = str.charAt(i);

				encriptData = firstIndex(first);
			//	System.out.println("After geting first hash:::" + encriptData);
			} else if (i == length - 1) {
				char first = str.charAt(i);
				String beforeDecimal = beforeDecimal(first);
			//	System.out.println("After geting beforeDecimal:::" + beforeDecimal);
				encriptData = encriptData.concat(beforeDecimal);
			}

			else if (c == '0') {

				encriptData = encriptData + "*";
			} else if (c == '1') {
				encriptData = encriptData + "a";
			} else if (c == '2') {
				encriptData = encriptData + "~";
			} else if (c == '3') {
				encriptData = encriptData + "b";
			} else if (c == '4') {
				encriptData = encriptData + "^";
			} else if (c == '5') {
				encriptData = encriptData + "c";
			} else if (c == '6') {
				encriptData = encriptData + "@";
			} else if (c == '7') {
				encriptData = encriptData + "d";
			} else if (c == '8') {
				encriptData = encriptData + "$";
			} else if (c == '9') {
				encriptData = encriptData + "e";
			}
		}
	//	System.out.println(encriptData);
		return encriptData;

	}

	public static String firstIndex(char value) {
//System.out.println("I am getting first index ::"+value);
		String returnValue = "";
		if (value == '1') {
			returnValue = returnValue + "~";

		} else if (value == '2') {
			returnValue = returnValue + "b";

		} else if (value == '3') {
			returnValue = returnValue + "^";

		} else if (value == '4') {
			returnValue = returnValue + "c";

		} else if (value == '5') {

			returnValue = returnValue + "@";

		} else if (value == '6') {
			returnValue = returnValue + "d";

		} else if (value == '7') {
			returnValue = returnValue + "$";

		} else if (value == '8') {
			returnValue = returnValue + "e";
		} else if (value == '9') {
			returnValue = returnValue + "*";

		}
		return returnValue;
	}

	public static String beforeDecimal(char value) {

		String returnValue = "";
		String beforeDecimalValue = value + ".";
		if (String.valueOf(beforeDecimalValue).equals("0.")) {
			returnValue = returnValue + "?";
		} else if (String.valueOf(beforeDecimalValue).equals("1.")) {
			returnValue = returnValue + "f";
		} else if (String.valueOf(beforeDecimalValue).equals("2.")) {
			returnValue = returnValue + "!";
		} else if (String.valueOf(beforeDecimalValue).equals("3.")) {
			returnValue = returnValue + "g";
		} else if (String.valueOf(beforeDecimalValue).equals("4.")) {
			returnValue = returnValue + "&";
		} else if (String.valueOf(beforeDecimalValue).equals("5.")) {
			returnValue = returnValue + "h";
		} else if (String.valueOf(beforeDecimalValue).equals("6.")) {
			returnValue = returnValue + "#";
		} else if (String.valueOf(beforeDecimalValue).equals("7.")) {
			returnValue = returnValue + "i";
		} else if (String.valueOf(beforeDecimalValue).equals("8.")) {
			returnValue = returnValue + "%";
		} else if (String.valueOf(beforeDecimalValue).equals("9.")) {
			returnValue = returnValue + "j";
		}

		return returnValue;

	}

	public static String decryptTechnique(String decryptIPValue) {

		
		String decryptValue = "";

		for (int index = 0; index < decryptIPValue.length(); index++) {

			char charValue = decryptIPValue.charAt(index);
        
        	
			 if (index == 0 ) {
				 
				 if(charValue == '?' || charValue == 'f' || charValue == '!' || charValue == 'g' || charValue == '&' ||

					charValue == 'h' || charValue == '#' || charValue == 'i' || charValue == '%' || charValue == 'j'){
					 String beforedecimal = beforeDecimalDecrypt(charValue);
					//	System.out.println("before decimal decrypt value:::" + beforedecimal); 
						decryptValue = decryptValue.concat(beforedecimal);
				 }
				 else{
				char firstCharValue = decryptIPValue.charAt(index);
				decryptValue = firstDecrypt(firstCharValue);
			//	System.out.println("first decrypt value:::" + decryptValue);
				 }
			}

			else if (charValue == '?' || charValue == 'f' || charValue == '!' || charValue == 'g' || charValue == '&' ||

					charValue == 'h' || charValue == '#' || charValue == 'i' || charValue == '%' || charValue == 'j') {
				String beforedecimal = beforeDecimalDecrypt(charValue);
			//	System.out.println("before decimal decrypt value:::" + beforedecimal);
				decryptValue = decryptValue.concat(beforedecimal);
			} else if (charValue == '*') {
				decryptValue = decryptValue.concat("0");
			} else if (charValue == 'a') {
				decryptValue = decryptValue.concat("1");
			} else if (charValue == '~') {
				decryptValue = decryptValue.concat("2");
			} else if (charValue == 'b') {
				decryptValue = decryptValue.concat("3");
			} else if (charValue == '^') {
				decryptValue = decryptValue.concat("4");
			} else if (charValue == 'c') {
				decryptValue = decryptValue.concat("5");
			} else if (charValue == '@') {

				decryptValue = decryptValue.concat("6");

			} else if (charValue == 'd') {
				decryptValue = decryptValue.concat("7");
			} else if (charValue == '$') {
				decryptValue = decryptValue.concat("8");
			} else if (charValue == 'e') {
				decryptValue = decryptValue.concat("9");
			}
        
		}
		
		
		return decryptValue;
	
	}
	public static String firstDecrypt(char firstIndex) {
		String firstDecryptVaue = "";

		if (firstIndex == '~') {
			firstDecryptVaue = firstDecryptVaue + "1";

		} else if (firstIndex == 'b') {
			firstDecryptVaue = firstDecryptVaue + "2";
		} else if (firstIndex == '^') {
			firstDecryptVaue = firstDecryptVaue + "3";
		} else if (firstIndex == 'c') {
			firstDecryptVaue = firstDecryptVaue + "4";
		} else if (firstIndex == '@') {
			firstDecryptVaue = firstDecryptVaue + "5";
		} else if (firstIndex == 'd') {
			firstDecryptVaue = firstDecryptVaue + "6";
		} else if (firstIndex == '$') {
			firstDecryptVaue = firstDecryptVaue + "7";
		} else if (firstIndex == 'e') {
			firstDecryptVaue = firstDecryptVaue + "8";
		} else if (firstIndex == '*') {
			firstDecryptVaue = firstDecryptVaue + "9";
		}
		return firstDecryptVaue;

	}

	private static String beforeDecimalDecrypt(char charValue) {

		String beforeDecimal = "";
		if (charValue == '?') {
			beforeDecimal = beforeDecimal.concat("0.");

		} else if (charValue == 'f') {
			beforeDecimal = beforeDecimal.concat("1.");
		} else if (charValue == '!') {
			beforeDecimal = beforeDecimal.concat("2.");
		} else if (charValue == 'g') {
			beforeDecimal = beforeDecimal.concat("3.");
		} else if (charValue == '&') {
			beforeDecimal = beforeDecimal.concat("4.");
		} else if (charValue == 'h') {
			beforeDecimal = beforeDecimal.concat("5.");
		} else if (charValue == '#') {
			beforeDecimal = beforeDecimal.concat("6.");
		} else if (charValue == 'i') {
			beforeDecimal = beforeDecimal.concat("7.");
		} else if (charValue == '%') {
			beforeDecimal = beforeDecimal.concat("8.");
		} else if (charValue == 'j') {
			beforeDecimal = beforeDecimal.concat("9.");
		}

		return beforeDecimal;
		
	}
}
