package kr.or.admin.vo;

import java.util.List;

import lombok.Data;

@Data
public class TotalData {
	private int todayTotalMember;
	private int todayJoinMember;
	private int todayOutMember;
	private int todayTotalContent;
	private List<String> dateList;
	private List<Integer> joinList;
	private List<Integer> outList;
	
	public TotalData(int todayTotalMember, int todayJoinMember, int todayOutMember, int todayTotalContent,
			List<String> dateList, List<Integer> joinList, List<Integer> outList) {
		super();
		this.todayTotalMember = todayTotalMember;
		this.todayJoinMember = todayJoinMember;
		this.todayOutMember = todayOutMember;
		this.todayTotalContent = todayTotalContent;
		this.dateList = dateList;
		this.joinList = joinList;
		this.outList = outList;
	}
	
	
	
	
}
