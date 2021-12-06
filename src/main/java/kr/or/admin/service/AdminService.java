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
		
		//6일전 ~ 오늘 날짜 리스트/가입수/탈퇴수
		List<String> dateList = new ArrayList<String>();
		List<Integer> joinList = new ArrayList<Integer>();
		List<Integer> outList = new ArrayList<Integer>();
				
		for(int i=5;i>=0;i--) {
		  	Calendar cal = Calendar.getInstance();
		    cal.setTime(new Date());
		    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		   	cal.add(Calendar.DATE, -i);
		   	String date =  df.format(cal.getTime());
		    int join = dao.todayJoinMember(date);
		    joinList.add(join);
		    int out = dao.todayOutMember(date);
		    outList.add(out);
		    date =  "\""+df.format(cal.getTime())+"\"";
		    dateList.add(date);
		    
		}
		
		HashMap<String, Object> date = new HashMap<String, Object>();
		date.put("dateList", dateList);
		
		TotalData td = new TotalData(todayTotalMember, todayJoinMember, todayOutMember, todayTotalContent, dateList, joinList, outList);
		return td;
	}
}
