package kr.or.contest.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Contest {
	private int contestNo;
	private String contestHost;
	private String memberId;
	private int contestType;
	private int contestQualify;
	private Date contestDate;
	private Date contestDeadline;
	private int contestPrize;
	private String phone;
	private String email;
	private String contestTitle;
	private String contestContent;
	private String contestImg;
	private int contestStatus;
	private int contestCount;	
}
