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
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.dao.AdminDao;
import kr.or.admin.vo.TotalData;
import kr.or.admin.vo.TotalMember;
import kr.or.comment.vo.Report;
import kr.or.contest.vo.Contest;
import kr.or.contest.vo.ContestList;
import kr.or.member.model.vo.Member;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao dao;

	public TotalData totaldata(String sToday) {
		int todayTotalMember = dao.todayTotalMember();
		int todayJoinMember = dao.todayJoinMember(sToday);
		int todayOutMember = dao.todayOutMember(sToday);
		int todayTotalContent = dao.todayTotalContent(sToday);
		
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
		
		//어제 총 회원 / 어제 총 게시물 불러오기
		//오늘날짜 불러오기
	  	Calendar cal = Calendar.getInstance();
	    cal.setTime(new Date());
	    //String으로 포맷
	    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    //오늘날짜에서 i만큼 빼주기
	   	cal.add(Calendar.DATE, -1);
	   	String ydate =  df.format(cal.getTime());
	   	//해당날짜 가입 회원 구하고 리스트에 넣기
	    int yesterDayTotalMember = dao.yesterDayTotalMember(ydate);
	    int yesterDayTotalBoard = dao.yesterDayTotalBoard(ydate);
		
		//등급별 회원 수 List
		List<Integer> gradeList = new ArrayList<Integer>();
		gradeList = dao.gradeList();
		
		//카테고리별 게시글 List
		List<Integer> cateList = new ArrayList<Integer>();
		cateList = dao.cateList();
		
		HashMap<String, Object> date = new HashMap<String, Object>();
		date.put("dateList", dateList);
		
		TotalData td = new TotalData(todayTotalMember, todayJoinMember, todayOutMember, todayTotalContent, dateList, joinList, outList, gradeList, cateList, yesterDayTotalMember, yesterDayTotalBoard); 
		return td;
	}

	public TotalMember totalMember(int reqPage, int type, int list, String id) {
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
		map.put("id", id);
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allMemberList.do?reqPage="+(pageNo-1)+"&type="+type+"&list="+list+"&id="+id+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/allMemberList.do?reqPage="+pageNo+"&type="+type+"&list="+list+"&id="+id+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allMemberList.do?reqPage="+pageNo+"&type="+type+"&list="+list+"&id="+id+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/allMemberList.do?reqPage="+pageNo+"&type="+type+"&list="+list+"&id="+id+"'>";
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
		
		ArrayList<Report> report5List = dao.report5List();
		TotalMember tm = new TotalMember(start, pageNavi, allReportList, totalCount, report5List);

		
		return tm;		
		
	}

	public int memberReportCount(String id) {
		return dao.memberReportCount(id);
	}
	
	@Transactional
	public int canselReport(int reportNo) {
		return dao.canselReport(reportNo);
	}
	
	@Transactional
	public int reportInsert(int reportNo, String memberId) {
		int result = dao.reportInsert(reportNo);
		int rpCount = dao.memberReportCount(memberId);
		int result1 = 0;
		if(result>0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("rpCount", rpCount);
			map.put("memberId", memberId);
			result1 = dao.memberGradeChange1(map);
		}
		return result1;
	}
	
	@Transactional
	public int falseReport(int reportNo, String memberId) {
		int result = dao.falseReport(reportNo);
		int result1 = 0;
		if(result>0) {
			result1 = dao.memberGradeChange2(memberId);
		}
		return result1;
	}

	public TotalMember totalBlockedMemberList(int reqPage, String id) {
		//한페이지에 보여줄 차단회원
		int numPerPage = 6;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		ArrayList<Member> allblockedList = dao.allblockedList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.totalBlockedCount(map);
		
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/blockedMember.do?reqPage="+(pageNo-1)+"&id="+id+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/blockedMember.do?reqPage="+pageNo+"&id="+id+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/blockedMember.do?reqPage="+pageNo+"&id="+id+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/blockedMember.do?reqPage="+pageNo+"&id="+id+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";		
		
		
		List<String> blockedMemberId = dao.blockedMemberId(map);
		List<String> lastReport = new ArrayList<String>();
		for(int i=0;i<blockedMemberId.size();i++) {
			lastReport.addAll(dao.lastReportDate(blockedMemberId.get(i)));
		}
		
		
		
		TotalMember tm = new TotalMember(pageNavi, allblockedList, start, totalCount, lastReport);
		return tm;		
	}

	public ArrayList<Report> memberReportView(String id) {
		return dao.memberReportView(id);
	}

	public boolean cancelBlocked(String memberId) {
		StringTokenizer st1 = new StringTokenizer(memberId,"/");
		boolean result = true;
		int result1 = 0;
		int result2 = 0;
		while(st1.hasMoreTokens()) {
			String id = st1.nextToken();
			List<Integer> list = dao.concelReportNo(id);
			for(int i=0;i<list.size();i++) {
				int no = list.get(i);
				result1 = dao.cancelReportMember(no);
			}
			result2 = dao.changeType(id);
			if(result2 == 0) {
				result = false;
				break;
			}
		}
		return result;
	}

	public ContestList contestEnrollList(int reqPage) {
		//한페이지에 보여줄 공모전
		int numPerPage = 8;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		
		//한페이지에서 보여줄 게시물 목록 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Contest> contestList = dao.contestList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.totalContestCount();
		
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination pagination-lg' style='justify-content: center;'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/contestEnrollList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' style='background-color : #4ECDC4; border-color : #4ECDC4;' href='/contestEnrollList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/contestEnrollList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' style='background-color : #fff; border-color : #4ECDC4; color : #4ECDC4;' href='/contestEnrollList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";		
		
		ContestList cl = new ContestList(contestList, start, totalCount, pageNavi);
		return cl;
	}
}














