package kr.or.qna.vo;

import lombok.Data;

@Data
public class nonQna {
	private int nonQnaNo;
	private int category;
	private String email;
	private String qnaPw;
	private String qnaTitle;
	private String qnaContent;
	private String regDate;
	private String answer;
	private String answerDate;
}
