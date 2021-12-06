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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.dao.AdminDao;
import kr.or.admin.vo.TotalData;

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
}
