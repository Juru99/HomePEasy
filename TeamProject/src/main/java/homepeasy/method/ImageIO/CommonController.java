package homepeasy.method.ImageIO;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/yuhan")
public class CommonController {

	private static final String FILE_SERVER_PATH = "D:/Files";
	
	@RequestMapping("/TestProcess")
	public String upload(@RequestParam("uploadFile") MultipartFile file, Model mv, Model model) throws IllegalStateException, IOException {
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
			model.addAttribute("msg", "File uploaded successfully.");
		}else {
			model.addAttribute("msg", "Please select a valid mediaFile..");
		}
		
		return "yuhan/TestProcess";
	}
	
	
	
}
