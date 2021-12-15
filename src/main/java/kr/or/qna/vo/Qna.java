package kr.or.qna.vo;

import lombok.Data;

@Data
public class Qna {
	private int qnaNo;
	private String memberId;
	private int category;
	private String qnaTitle;
	private String qnaContent;
	private String regDate;
	private String fileanme;
	private String filepath;
	private String qnaAnswer;
	private String answerDate;
}
