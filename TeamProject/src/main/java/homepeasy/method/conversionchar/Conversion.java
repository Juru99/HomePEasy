package homepeasy.method.conversionchar;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import com.mysql.cj.Session;

public class Conversion {
	public String ChangeChar(String code)
	{
		String[] str = code.split("\"");
		String ChangeCharCode = "";
		
		int i = 0;
		
		
		
		for(i = 0; i < str.length - 1; i++)
		{
			
			ChangeCharCode += str[i] + "'";
			
		}
		
		ChangeCharCode += str[i];
		
		
		
		return ChangeCharCode;
	}
	
	public String ChangeChar2(String code)
	{
		String[] str = code.split("'");
		String ChangeCharCode = "";
		
		int i = 0;
		
		for(i = 0; i < str.length - 1; i++)
		{
			ChangeCharCode += str[i] + "\"";
		}
		
		ChangeCharCode += str[i];
		
		return ChangeCharCode;
	}
	
	public String RemoveChar(String code)
	{
		String RemoveCharCode = "";
		
		RemoveCharCode = code.replaceAll("\\r|\\n|\\t", "");
		
		//RemoveCharCode = RemoveCharCode.replaceAll(" ", "");
		
		
		
		return RemoveCharCode;
	}
	
	
	
	
}
