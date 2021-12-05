package kr.or.gosu.vo;

import kr.or.contest.vo.Contest;
import kr.or.member.model.vo.Member;
import lombok.Data;

@Data
public class Gosu {
	private int ggsouNo;
	private int gsouNo;
	private String gosuTitle;
	private String gosuSelf;
	private String gosuExplain;
	private String gosuAct;
	private int gosuCost;
	private String gosuDate;
	
	
	public String getGosuExplainBr(){
		return gosuExplain.replaceAll("\r\n", "<br>");
	}

	public String getGosuActBr(){
		return gosuAct.replaceAll("\r\n", "<br>");
	}
}
