package kr.or.admin.vo;

import java.util.ArrayList;
import java.util.List;

import kr.or.comment.vo.Report;
import kr.or.member.model.vo.Member;
import lombok.Data;

@Data
public class TotalMember {
	private ArrayList<Member> allMemberList;
	private int start;
	private String pageNavi;
	private List<Integer> totalCountList;
	private ArrayList<Report> allReportList;
	private List<String> memberId;
	public TotalMember(ArrayList<Member> allMemberList, int start, String pageNavi, List<Integer> totalCountList) {
		super();
		this.allMemberList = allMemberList;
		this.start = start;
		this.pageNavi = pageNavi;
		this.totalCountList = totalCountList;
	}
	public TotalMember(int start, String pageNavi, ArrayList<Report> allReportList, List<String> memberId) {
		super();
		this.start = start;
		this.pageNavi = pageNavi;
		this.allReportList = allReportList;
		this.memberId = memberId;
	}
	
	
	
	
	
	
	
	
}
