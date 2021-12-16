package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuRequestReview {
	private int requestReviewNo;
	private int requestProjectSubNo;
	private String memberId;
	private String requestReviewContent;
	private String requestReviewDate;
	private int ggosuNo;
	

	public String getRequestReviewContentBr(){
		return requestReviewContent.replaceAll(",", "<br>");
	}
}