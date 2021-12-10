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
	private int totalCount;
	private ArrayList<Report> report5List;
	private List<String> report5ListMember;
	private ArrayList<Member> allblockedList;
	public TotalMember(ArrayList<Member> allMemberList, int start, String pageNavi, List<Integer> totalCountList) {
		super();
		this.allMemberList = allMemberList;
		this.start = start;
		this.pageNavi = pageNavi;
		this.totalCountList = totalCountList;
	}
	public TotalMember(int start, String pageNavi, ArrayList<Report> allReportList, List<String> memberId,
			int totalCount, ArrayList<Report> report5List, List<String> report5ListMember) {
		super();
		this.start = start;
		this.pageNavi = pageNavi;
		this.allReportList = allReportList;
		this.memberId = memberId;
		this.totalCount = totalCount;
		this.report5List = report5List;
		this.report5ListMember = report5ListMember;
	}
	public TotalMember(String pageNavi, ArrayList<Member> allblockedList, int start, int totalCount) {
		super();
		this.pageNavi = pageNavi;
		this.allblockedList = allblockedList;
		this.start = start;
		this.totalCount = totalCount;
	}
	
	
	
	
	
	
	
	
	
	
	
}
