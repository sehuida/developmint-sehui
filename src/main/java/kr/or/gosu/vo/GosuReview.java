package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuReview {
	private int reviewNo;
	private int ggosuNo;
	private String writer;
	private String reviewContent;
	private int reviewNum;
	private String reviewDate;
	private int reviewCount;
	private int reviewAvg;
	

	public String getReviewContentBr(){
		return reviewContent.replaceAll(",", "<br>");
	}
}