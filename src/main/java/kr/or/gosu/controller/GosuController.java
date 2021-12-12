package kr.or.gosu.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.gosu.service.GosuService;
import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuFeedback;
import kr.or.gosu.vo.GosuNotice;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;
import kr.or.gosu.vo.GosuRequest;
import kr.or.gosu.vo.GosuRequestCost;
import kr.or.gosu.vo.GosuTalk;
import kr.or.member.model.vo.Member;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

@Controller
public class GosuController {

	@Autowired
	private GosuService service;

	@RequestMapping(value = "/gosuMain.do")
	public String gosuMain(Model model, @SessionAttribute(required = false) Member m) {

		ArrayList<Gosu> g = service.selectGosuList();
		ArrayList<GosuNotice> gNoticeList = service.selectGosuNoticeList2();
		ArrayList<Gosu> newGosu = service.selectNewGosuList();
		int gosuCount = service.selectGosuCount();
		if (m != null) {
			System.out.println("getId : " + m.getMemberId());
			ArrayList<GosuFeedback> gf = service.selectGosuFeedbackList(m.getMemberId());
			ArrayList<GosuFeedback> gf2 = service.selectGosuFeedbackList2(m.getMemberId());
			model.addAttribute("gosuTalkList", gf);
			model.addAttribute("gosuTalkList2", gf2);
		}
		model.addAttribute("gList", g);
		model.addAttribute("gNoticeList", gNoticeList);
		model.addAttribute("newGosuList", newGosu);
		model.addAttribute("gosuCount", gosuCount);

		return "gosu/gosuMain";
	}

	@RequestMapping(value = "/gosuList.do")
	public String gosuList(Model model) {
		ArrayList<Gosu> g = service.selectGosuList();
		model.addAttribute("gList", g);
		return "gosu/gosuList";
	}

	@RequestMapping(value = "/gosuContent.do")
	public String gosuContent(int gNo, Model model) {
		Gosu gosu = service.selectGosuOne(gNo);
		ArrayList<GosuProject> gprList = service.selectGosuProject(gNo);
		ArrayList<GosuPhoto> gptList = service.selectGosuPhoto(gNo);
		model.addAttribute("gosu", gosu);
		model.addAttribute("gprojectList", gprList);
		model.addAttribute("gphotoList", gptList);
		return "gosu/gosuContent";
	}

	@RequestMapping(value = "/gosuWriteFrm.do")
	public String gosuWriteFrm() {
		return "gosu/gosuWriteFrm";
	}

	@RequestMapping(value = "/gosuWrite.do")
	public String gosuWrite(Gosu g, MultipartFile[] photoFilepath, String[] gprojectContent, String[] gprojectTitle,
			String[] gprojectFilepath, HttpServletRequest request, Model model) {

		ArrayList<GosuPhoto> photoList = new ArrayList<GosuPhoto>();
		ArrayList<GosuProject> projectList = new ArrayList<GosuProject>();
		for (int i = 0; i < gprojectContent.length; i++) {
			GosuProject gp = new GosuProject();
			gp.setGprojectContent(gprojectContent[i]);
			gp.setGprojectTitle(gprojectTitle[i]);
			gp.setGprojectFilepath(gprojectFilepath[i]);
			projectList.add(gp);
		}
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
				gphoto.setPhotoFilepath("/resources/upload/gosu/gosuPhoto/" + filepath);

				photoList.add(gphoto);

			}
		}
		int result = service.insertGosu(g, photoList, projectList);
		if (result == -1 || result != projectList.size()) {
			model.addAttribute("msg", "등록 실패");
		} else {
			model.addAttribute("msg", "등록 성공");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}

	@ResponseBody
	@RequestMapping(value = "/gpAjax.do")
	public GosuProject gpAjax(int pNo) {
		GosuProject gpr = service.selectGProject(pNo);
		return gpr;
	}

	@ResponseBody
	@RequestMapping(value = "/gProjectAjax.do", produces = "application/json;charset=utf-8")
	public Object gProjectAjax(MultipartHttpServletRequest req, HttpSession session, HttpServletRequest request,
			String gprojectTitle, String gprojectContent) {
		// Iterator<String> itr = req.getFileNames();
		// MultipartFile files = req.getFile(itr.next());
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
		System.out.println("path : " + path);
		System.out.println("filepath : " + filepath);

		GosuProject g = new GosuProject();
		g.setGprojectContent(gprojectTitle);
		g.setGprojectTitle(gprojectContent);
		g.setGprojectFilepath("/resources/upload/gosuProject/" + filepath);
		Gson gson = new Gson();
		return gson.toJson(g);
	}

	@RequestMapping(value = "/gosuSituation.do")
	public String gosuSituation(@SessionAttribute Member m, Model model) {
		System.out.println("getId : " + m.getMemberId());
		ArrayList<GosuFeedback> gf = service.selectGosuFeedbackList(m.getMemberId());
		ArrayList<GosuFeedback> gf2 = service.selectGosuFeedbackList2(m.getMemberId());
		model.addAttribute("gosuTalkList", gf);
		model.addAttribute("gosuTalkList2", gf2);

		return "gosu/gosuSituation";
	}

	@RequestMapping(value = "/gosuFeedback.do")
	public String gosuFeedback(int ggNo, Model model) {
		Gosu gosu = service.selectGosuOne(ggNo);
		model.addAttribute("gosu", gosu);
		return "gosu/gosuFeedback";
	}

	@ResponseBody
	@RequestMapping(value = "/gosuFeedbackInsert.do")
	public int gosuFeedbackInsert(int ggsouNo, String gosuFeedbackTitle, String gosuFeedbackContent, String memberId,
			Model model) {
		GosuFeedback gf = new GosuFeedback();
		gf.setFeedbackContent(gosuFeedbackContent);
		gf.setMemberId(memberId);
		gf.setFeedbackTitle(gosuFeedbackTitle);
		gf.setGgosuNo(ggsouNo);
		int result = service.insertGosuFeedback(gf);

		return gf.getFeedbackNo();
	}

	@ResponseBody
	@RequestMapping(value = "/talkStopAjax.do")
	public int talkStopAjax(int feedbackNo, Model model) {
		int result = service.talkStop(feedbackNo);
		return result;
	}

	@RequestMapping(value = "/gosuTalk.do")
	public String gosuTalk(int fbNo, Model model) {
		GosuFeedback gf = service.selectFeedbackOne(fbNo);
		ArrayList<GosuTalk> gtList = service.selectGosuTalk(fbNo);
		model.addAttribute("gfOne", gf);
		model.addAttribute("gtList", gtList);
		return "gosu/gosuTalk";
	}

	@ResponseBody
	@RequestMapping(value = "/talkBtnAjax.do")
	public int gosuTalkInsert(MultipartHttpServletRequest req, HttpSession session, HttpServletRequest request,
			String talkContent, String writer, @RequestParam(required = false, defaultValue = "0") int feedbackNo,
			Model model) {
		System.out.println("talkContent : " + talkContent);
		System.out.println("writer : " + writer);
		System.out.println("feedbackNo : " + feedbackNo);
		GosuTalk gt = new GosuTalk();
		gt.setFeedbackNo(feedbackNo);
		gt.setTalkContent(talkContent);
		gt.setWriter(writer);
		MultipartFile files = req.getFile("talkFile");
		if (files == null) {

		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/gosu/gosuTalk/");
			String filename = files.getOriginalFilename();
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
				byte[] bytes = files.getBytes();
				bos.write(bytes);
				bos.close();
				gt.setFilepath("/resources/upload/gosu/gosuTalk/" + filepath);
				gt.setFilename(filename);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		int result = service.insertGosuTalk(gt);

		return result;
	}

	@RequestMapping(value = "/gosuNoticeList.do")
	public String gosuNoticeLsit(Model model) {
		ArrayList<GosuNotice> g = service.selectGosuNoticeList();
		model.addAttribute("gNoticeList", g);
		return "gosu/gosuNoticeList";
	}

	@RequestMapping(value = "/gosuNoticeWriteFrm.do")
	public String gosuNoticeWriteFrm() {
		return "gosu/gosuNoticeWriteFrm";
	}

	@RequestMapping(value = "/gosuNoticeWrite.do")
	public String gosuNoticeWrite(MultipartFile files, HttpServletRequest request, GosuNotice gNotice, Model model) {

		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/gosu/gosuNotice/");
		String filename = files.getOriginalFilename();
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
			byte[] bytes = files.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		gNotice.setGnoticePhoto("/resources/upload/gosu/gosuNotice/" + filepath);
		int result = service.insertGosuNotice(gNotice);

		if (result == -1) {
			model.addAttribute("msg", "등록 실패");
		} else {
			model.addAttribute("msg", "등록 성공");
		}
		model.addAttribute("loc", "/gosuNoticeList.do");
		return "common/msg";
	}

	@RequestMapping(value = "/gosuNoticeContent.do")
	public String gosuNoticeContent(int gnn, Model model) {
		GosuNotice gNotice = service.selectGosuNoticeOne(gnn);
		Gosu gosuWriteList = service.selectgosuWriteList(gNotice.getWriteId());
		model.addAttribute("gNotice", gNotice);
		model.addAttribute("gosuWriteList", gosuWriteList);

		return "gosu/gosuNoticeContent";
	}

	@RequestMapping(value = "/gosuRequest.do")
	public String gosuRequest() {
		return "gosu/gosuRequest";
	}

	@RequestMapping(value = "/gosuRequestdo.do")
	public String gosuRequestDo(GosuRequest gr,Model model) {
		int result = service.insertGosuRequest(gr);
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
				
		}
		return "gosu/gosuRequestCostList";
	}

	@RequestMapping(value = "/gosuRequestList.do")
	public String gosuRequestList(Model model) {
		ArrayList<GosuRequest> memberRequestList = service.selectMemberRequestList();
		model.addAttribute("memberRequestList",memberRequestList);
		return "gosu/gosuRequestList";
	}

	@RequestMapping(value = "/gosuRequestContent.do")
	public String gosuRequestContent(int mrn,@SessionAttribute(required = false) Member m,Model model) {
		GosuRequest gr = service.selectGosuRequestContent(mrn);
		
		GosuRequestCost grc = new GosuRequestCost();
		grc.setRequestNo(gr.getRequestNo());
		grc.setGosuNo(m.getMemberNo());
		GosuRequestCost grc2=service.selectRequestNoGosuNo(grc);
		model.addAttribute("grOne",gr);
		model.addAttribute("grcOne",grc2);
		return "gosu/gosuRequestContent";
	}
	
	@ResponseBody
	@RequestMapping(value = "/gosuRequestCostInsert.do")
	public int gosuRequestCostInsert(int requestNo,int gosuNo,int cost,String content,String memberId, Model model) {
		GosuRequestCost grc = new GosuRequestCost();
		grc.setCost(cost);
		grc.setCostContent(content);
		grc.setGosuNo(gosuNo);
		grc.setRequestNo(requestNo);
		grc.setMemberId(memberId);
		int result = service.gosuRequestCostInsert(grc);
		return result;
	}
	
	
	@RequestMapping(value = "/gosuRequestCostList.do")
	public String gosuRequestCostList(@SessionAttribute(required = false) Member m,Model model) {
		ArrayList<GosuRequestCost> memberRequestCostList = service.selectGosuRequestCostList(m.getMemberId());
		model.addAttribute("memberRequestCostList",memberRequestCostList);
		return "gosu/gosuRequestCostList";
	}

	@RequestMapping(value = "/gosuProject.do")
	public String gosuProject() {
		return "gosu/gosuProject";
	}
}
