package kr.or.gosu.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gosu.service.GosuService;
import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class GosuController {

	@Autowired
	private GosuService service;

	@RequestMapping(value = "/gosuMain.do")
	public String gosuMain() {
		return "gosu/gosuMain";
	}

	@RequestMapping(value = "/gosuList.do")
	public String gosuList() {
		return "gosu/gosuList";
	}

	@RequestMapping(value = "/gosuContent.do")
	public String gosuContent() {
		return "gosu/gosuContent";
	}

	@RequestMapping(value = "/gosuWriteFrm.do")
	public String gosuWriteFrm() {
		return "gosu/gosuWriteFrm";
	}

	@RequestMapping(value = "/gosuWrite.do")
	public String gosuWrite(Gosu g, MultipartFile[] photoFilepath, MultipartFile[] gprojectFilepath,
			GosuProject[] gProject, HttpServletRequest request, Model model) {

		ArrayList<GosuPhoto> photoList = new ArrayList<GosuPhoto>();
		ArrayList<GosuProject> projectList = new ArrayList<GosuProject>();
		
		if (photoFilepath[0].isEmpty()) {
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/gosu/gosuPhoto/");
			for (MultipartFile file : photoFilepath) {
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.indexOf("."));
				String extention = filename.substring(filename.indexOf("."));
				String filepath = null;
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention;// test.txt
					} else {
						filepath = onlyFilename + "_" + count + extention;// test_2.txt,test_3.txt
					}
					File checkFile = new File(savePath + filepath); // java.io.File
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				GosuPhoto gphoto = new GosuPhoto();
				gphoto.setPhotoFilepath(filepath);

				photoList.add(gphoto);
				
			}
		}
		if (gprojectFilepath[0].isEmpty()) {
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/gosu/gosuProjects/");
			for (MultipartFile file : gprojectFilepath) {
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.indexOf("."));
				String extention = filename.substring(filename.indexOf("."));
				String filepath = null;
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention;
					} else {
						filepath = onlyFilename + "_" + count + extention;
					}
					File checkFile = new File(savePath + filepath);
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				GosuProject gproject = new GosuProject();
				gproject.setGprojectFilepath(filepath);

				projectList.add(gproject);
				
			}
		}
		int result = service.insertGosu(g,photoList,projectList,gProject);
		if(result == -1 || result !=projectList.size()) {
			model.addAttribute("msg", "등록 실패");
		}else {
			model.addAttribute("msg", "등록 성공");			
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}

	@ResponseBody
	@RequestMapping(value = "/gProjectAjax.do", produces = "application/json;charset=utf-8")
	public String gProjectAjax(MultipartHttpServletRequest req, HttpSession session, HttpServletRequest request) {
		//Iterator<String> itr =  req.getFileNames();
		//MultipartFile files = req.getFile(itr.next());
		// 파일이 여러개일경우 위와같이 사용 할 수 있다
		// 단일 파일일 경우 html의 name에 설정된 이름으로 파일을 가져올 수 있다.

		String path = request.getSession().getServletContext().getRealPath("/resources/upload/gosuProject/");

		MultipartFile file = req.getFile("gprojectFilepath");
		String filename = file.getOriginalFilename();

		String onlyFilename = filename.substring(0, filename.indexOf("."));// test
		String extention = filename.substring(filename.indexOf("."));// .txt
		String filepath = null;
		int count = 0;
		while (true) {
			if (count == 0) {
				filepath = onlyFilename + extention;// test.txt
			} else {
				filepath = onlyFilename + "_" + count + extention;// test_2.txt,test_3.txt
			}
			File checkFile = new File(path + filepath); // java.io.File
			if (!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {

			System.out.println(path + filepath);
		
			FileOutputStream fos = new FileOutputStream(new File(path + filepath));
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
		System.out.println(file.getOriginalFilename());

		return file.getOriginalFilename();
	}

	@RequestMapping(value = "/gosuSituation.do")
	public String gosuSituation() {
		return "gosu/gosuSituation";
	}

	@RequestMapping(value = "/gosuFeedback.do")
	public String gosuFeedback() {
		return "gosu/gosuFeedback";
	}

	@RequestMapping(value = "/gosuTalk.do")
	public String gosuTalk() {
		return "gosu/gosuTalk";
	}

	@RequestMapping(value = "/gosuNoticeList.do")
	public String gosuNotice() {
		return "gosu/gosuNoticeList";
	}

	@RequestMapping(value = "/gosuNoticeWriteFrm.do")
	public String gosuNoticeWriteFrm() {
		return "gosu/gosuNoticeWriteFrm";
	}

	@RequestMapping(value = "/gosuNoticeContent.do")
	public String gosuNoticeContent() {
		return "gosu/gosuNoticeContent";
	}

	@RequestMapping(value = "/gosuRequest.do")
	public String gosuRequest() {
		return "gosu/gosuRequest";
	}

	@RequestMapping(value = "/gosuRequestList.do")
	public String gosuRequestList() {
		return "gosu/gosuRequestList";
	}

	@RequestMapping(value = "/gosuRequestContent.do")
	public String gosuRequestContent() {
		return "gosu/gosuRequestContent";
	}

	@RequestMapping(value = "/gosuRequestCostList.do")
	public String gosuRequestCostList() {
		return "gosu/gosuRequestCostList";
	}

	@RequestMapping(value = "/gosuProject.do")
	public String gosuProject() {
		return "gosu/gosuProject";
	}
}
