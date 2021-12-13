package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuRequestProject {
	private int requestProjectNo;
	private int memberNo;
	private String requestProjectContent;
	private String requestProjectDate;
	private String filepath;
	private String filename;
	private int requestProjectSubNo;
	private String writerId;
	private String writerImg;
}
