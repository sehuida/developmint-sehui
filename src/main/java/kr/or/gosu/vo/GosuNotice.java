package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuNotice {
	private int gnoticeNo;
	private String writeId;
	private String gnoticeTitle;
	private String gnoticeContent;
	private String gnoticePhoto;
	private String gnoticeDate;
	private String writeImg;
}
