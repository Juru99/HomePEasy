package homepeasy.method.createhtml;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CreateHTML {

	
	public void download(HttpServletResponse response, String presetName, String path) {

	  // Á÷Á¢ ÆÄÀÏ Á¤º¸¸¦ º¯¼ö¿¡ ÀúÀåÇØ ³ùÁö¸¸, ÀÌ ºÎºÐÀÌ db¿¡¼­ ÀÐ¾î¿Ô´Ù°í °¡Á¤ÇÑ´Ù.
	  String fileName = presetName + ".html";
	  String saveFileName = path; //"c:/tmp/connect.png"; // ¸ÆÀÏ °æ¿ì "/tmp/connect.png" ·Î ¼öÁ¤
	  String contentType = "text/html";
	  int fileLength = 11163030;

	  response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
	  response.setHeader("Content-Transfer-Encoding", "binary");
	  response.setHeader("Content-Type", contentType);
	  response.setHeader("Content-Length", "" + fileLength);
	  response.setHeader("Pragma", "no-cache;");
	  response.setHeader("Expires", "-1;");

	  try(
	    FileInputStream fis = new FileInputStream(saveFileName);
	    OutputStream out = response.getOutputStream();
	  ){
	    int readCount = 0;
	    byte[] buffer = new byte[1024];
	    while((readCount = fis.read(buffer)) != -1){
	    out.write(buffer,0,readCount);
	  }
	  }catch(Exception ex){
	    throw new RuntimeException("file Save Error");
	  }
	}
	
	
	public String CreateHTML(HttpSession session, String presetName, String siteName, String codes) {
		
		String user = (String)session.getAttribute("user");
		
		//Path path =  Paths.get("/mnt/HDD1/TomCat/apache-tomcat-9.0.62/webapps/ROOT/HomePEasy/src/main/webapp/user/" + userID);

		//File file = new File("/mnt/HDD1/TomCat/apache-tomcat-9.0.62/webapps/ROOT/HomePEasy/src/main/webapp/user/" + userID + "/" + presetName + ".html");
		
		// D:\\Files\\user\\test\\CodeSet.html·Î »ý±è ¼öÁ¤ ÇÊ¿ä
		Path path = Paths.get("user/" + user);
		File file = new File("user/" + user + "/" + presetName + ".html");
		
		path = Paths.get("D:/Files/ATest/save");
		file = new File("D:/Files/ATest/save/" + presetName + ".html");
		
		String filePath = "";
		
		filePath = "D:/Files/ATest/save/" + presetName + ".html";
		
		System.out.println(path);
		System.out.println(file);
		System.out.println(codes);
		System.out.println(System.getProperty("user.dir"));
		
		
		String htmlCode1 = "";
		String htmlCode2 = "";
		String htmlCode3 = "";
		
		htmlCode1 = "<!doctype html><html><head><title>" + siteName + "</title>";
		htmlCode2 = "<meta charset='utf-8'></head><body>";
		
		htmlCode3 = "</body></html>";
		
		String code = htmlCode1 + htmlCode2 + codes + htmlCode3;
		
		try {
			
			if(!file.exists()) 
			{
				Files.createDirectories(path);
			}
			
			FileOutputStream fos = new FileOutputStream(file);
			
			// 3. Writer ï¿½ï¿½ï¿½ï¿½
			
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			DataOutputStream dos = new DataOutputStream(bos);
			// 4. ï¿½ï¿½ï¿½Ï¿ï¿½ ï¿½ï¿½ï¿½ï¿½
			
			
			//bos.write(all.getBytes());
			dos.writeUTF(code);
			// 5. DataOutputStream close
			
			
			
			dos.close();

			
			
		} 
		catch (IOException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();	
		}
		
		
		
		return filePath;
		
		
	}
	
}
