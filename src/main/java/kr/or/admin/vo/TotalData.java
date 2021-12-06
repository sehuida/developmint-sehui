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
	private List<Integer> gradeList;
	private List<Integer> cateList;
	
	public TotalData(int todayTotalMember, int todayJoinMember, int todayOutMember, int todayTotalContent,
			List<String> dateList, List<Integer> joinList, List<Integer> outList, List<Integer> gradeList,
			List<Integer> cateList) {
		super();
		this.todayTotalMember = todayTotalMember;
		this.todayJoinMember = todayJoinMember;
		this.todayOutMember = todayOutMember;
		this.todayTotalContent = todayTotalContent;
		this.dateList = dateList;
		this.joinList = joinList;
		this.outList = outList;
		this.gradeList = gradeList;
		this.cateList = cateList;
	}
	
	
}
