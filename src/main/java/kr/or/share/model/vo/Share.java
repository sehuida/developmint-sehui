package kr.or.share.model.vo;

import lombok.Data;

@Data
public class Share {
	private int boardNo;
	private int memberNo;
	private String boardTitle;
	private String boardContent;
	private int boardType;
	private String regDate;
	private String filename;
	private String filepath;
	private int readCount;
}
