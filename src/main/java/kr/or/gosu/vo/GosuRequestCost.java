package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuRequestCost {
	private int costNo;
	private int gosuNo;
	private int requestNo;
	private String costContent;
	private int cost;
	private String costDate;
	private String gosuImg;
	private String gosuId;
	
	public String getCostContentBr(){
		return costContent.replaceAll("\r\n", "<br>");
	}
	
}
