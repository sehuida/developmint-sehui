package kr.or.share.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ShareController {
	
	@RequestMapping(value="/shareList.do")
	public String shareList() {
		return "share/shareList";
	}
	@RequestMapping(value="/shareWriteFrm.do")
	public String shareWriteFrm() {
		return "share/shareWriteFrm";
	}
	@ResponseBody
	@RequestMapping(value="/boardSummerImage.do")
	public String boardSummer(MultipartFile file, HttpServletRequest request) {
		
		String saveRoot = request.getSession().getServletContext().getRealPath("/resources/upload/share/");
		String originalFileName = file.getOriginalFilename(); 	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
		try {
			FileOutputStream fos = new FileOutputStream(new File(saveRoot + savedFileName));
			// 업로드 속도증가를 위한 보조스트림
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// 파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/resources/upload/share/" + savedFileName;		
	}
}
