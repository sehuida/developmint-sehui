package kr.or.comment.vo;

import lombok.Data;

@Data
public class Comment {
	private int commentNo;
	private String memberId;
	private String commentContent;
	private String regDate;
	private int boardNo;
	private int boardType;
	private int commentType;
	private int commentRef;
}
