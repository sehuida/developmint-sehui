package kr.or.contest.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.contest.service.ContestService;
import kr.or.contest.vo.Contest;
import kr.or.contest.vo.ContestList;

@Controller
public class ContestController {

	@Autowired
	private ContestService service;
	
	//공모전 메인페이지 이동
	@RequestMapping(value="/contestMain.do")
	public String contestMain(Model model) {
		//공모전 최신리스트, 인기리스트 불러오기
		ContestList list = service.selectContestList();
		model.addAttribute("list",list);
		return "contest/contestMain";
	}
	
	
	//공모전 등록 페이지 이동
	@RequestMapping(value="/insertContestFrm.do")
	public String insertContestFrm() {
		return "contest/insertContestFrm";
	}
	
	
	//공모전 등록
	@RequestMapping(value="/insertContest.do")
	public String insertContest(Contest c, HttpServletRequest request, MultipartFile files, Model model) {

		//포스터 파일 저장 경로
		String savePath = request.getSession().getServletContext().getRealPath("/resources/img/contest/");
		//사용자가 올린 파일명
		String filename = files.getOriginalFilename();
		//올린 파일명에서 확장자 앞까지 자르기 
		String onlyFilename = filename.substring(0,filename.indexOf("."));
		//올린 파일명에서 확장자 부분 자르기
		String extention = filename.substring(filename.indexOf("."));
		
		//실제 업로드할 파일명
		String filepath = null;
		//중복 파일 뒤에 붙여줄 숫자
		int count = 0;
		//중복된 파일이 없을 때까지 반복(파일명 중복시 숫자 붙이는 코드)
		while(true) {
			if(count == 0) {
				filepath = onlyFilename+extention;
			}else {
				filepath = onlyFilename+"_"+count+extention;
			}
			//파일 경로안에 중복된 파일이 있는지 체크
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		
		//중복처리가 끝나면 파일 업로드
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
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
		
		//중복처리된 파일 이름 넣어주기
		c.setContestImg(filepath);
		
		int result = service.insertContest(c);
		
		if(result>0) {
			model.addAttribute("msg","관리자 승인 후 등록됩니다.");
		}else {
			model.addAttribute("msg", "등록실패");
		}

		model.addAttribute("msg","관리자 승인 후 등록됩니다.");
		model.addAttribute("loc","/contestMain.do");
		return "common/msg";
	}
	
	//공모전 상세페이지로 이동
	@RequestMapping(value="/contestView.do")
	public String contestView(int contestNo, Model model) {
		//공모전 정보 불러오면서 조회수 올려주기
		Contest con = service.contestView(contestNo);
		model.addAttribute("c",con);
		return "contest/contestView";
	}
}
