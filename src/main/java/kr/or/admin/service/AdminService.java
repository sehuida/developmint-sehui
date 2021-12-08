package kr.or.admin.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.dao.AdminDao;
import kr.or.admin.vo.TotalData;
import kr.or.admin.vo.TotalMember;
import kr.or.comment.vo.Report;
import kr.or.contest.vo.Contest;
import kr.or.member.model.vo.Member;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao dao;

	public TotalData totaldata(String sToday) {
		int todayTotalMember = dao.todayTotalMember();
		int todayJoinMember = dao.todayJoinMember(sToday);
		int todayOutMember = dao.todayOutMember(sToday);
		int todayTotalContent = dao.todayTotalContent();
		
		//6일전 ~ 오늘 날짜 리스트/가입수/탈퇴수 List
		List<String> dateList = new ArrayList<String>();
		List<Integer> joinList = new ArrayList<Integer>();
		List<Integer> outList = new ArrayList<Integer>();
		
		//날짜별로 List에 넣기
		for(int i=5;i>=0;i--) {
			//오늘날짜 불러오기
		  	Calendar cal = Calendar.getInstance();
		    cal.setTime(new Date());
		    //String으로 포맷
		    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		    //오늘날짜에서 i만큼 빼주기
		   	cal.add(Calendar.DATE, -i);
		   	String date =  df.format(cal.getTime());
		   	//해당날짜 가입 회원 구하고 리스트에 넣기
		    int join = dao.todayJoinMember(date);
		    joinList.add(join);
		    //해당날짜 탈퇴 회원 구하고 리스트에 넣기
		    int out = dao.todayOutMember(date);
		    outList.add(out);
		    //해당날짜 "yyyy-mm-dd" 형태로 포맷 후 리스트에 넣기
		    date =  "\""+df.format(cal.getTime())+"\"";
		    dateList.add(date);
		}
		
		//등급별 회원 수 List
		List<Integer> gradeList = new ArrayList<Integer>();
		gradeList = dao.gradeList();
		
		//카테고리별 게시글 List
		List<Integer> cateList = new ArrayList<Integer>();
		cateList = dao.cateList();
		
		HashMap<String, Object> date = new HashMap<String, Object>();
		date.put("dateList", dateList);
		
		TotalData td = new TotalData(todayTotalMember, todayJoinMember, todayOutMember, todayTotalContent, dateList, joinList, outList, gradeList, cateList);
		return td;
	}

	public TotalMember totalMember(int reqPage, int type, String list) {
		//한페이지에 보여줄 회원 수
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("list", list);
		ArrayList<Member> allMemberList = dao.allMemberList(map);		
		
		//페이지 네비게이션 제작
		int totalCount = dao.allMemberCount(map);
		
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination' style='justify-content: center;'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allMemberList.do?reqPage="+(pageNo-1)+"&type="+type+"&list="+list+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/allMemberList.do?reqPage="+pageNo+"&type="+type+"&list="+list+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allMemberList.do?reqPage="+pageNo+"&type="+type+"&list="+list+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allMemberList.do?reqPage="+pageNo+"&type="+type+"&list="+list+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";	
		
		List<Integer> totalCountList = dao.totalCountList();
		
		TotalMember tm = new TotalMember(allMemberList, start, pageNavi, totalCountList);
		
		return tm;
	}

	public boolean chkChangeLevel(String memberId, String level) {
		StringTokenizer st1 = new StringTokenizer(memberId,"/");
		StringTokenizer st2 = new StringTokenizer(level,"/");
		boolean result = true;
		while(st1.hasMoreTokens()) {
			String id = st1.nextToken();
			String grade = st2.nextToken();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("grade", grade);
			int result1 = dao.chkChangeLevel(map);
			if(result1 == 0) {
				result = false;
				break;
			}
		}
		return result;
	}

	public TotalMember totalReposrtList(int reqPage) {
		//한페이지에 보여줄 신고회원
		int numPerPage = 6;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Report> allReportList = dao.allReportList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.reportCount();
		
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination' style='justify-content: center;'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/reportMember.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/reportMember.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/reportMember.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/reportMember.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";		
		
		List<String> memberId = dao.memberIdList();
		TotalMember tm = new TotalMember(start, pageNavi, allReportList, memberId);
		
		return tm;		
		
	}
}














