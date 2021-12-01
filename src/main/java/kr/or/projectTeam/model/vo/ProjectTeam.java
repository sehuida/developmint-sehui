package kr.or.projectTeam.model.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProjectTeam {
	private int projectNo;
	private int projectWriterMemberNo;
	private Timestamp rStartDate;
	private Timestamp rEndDate;
	private int viewCount;
	private String rTitle;
	private String rContent;
	private String projectName;
	private String projectGoal;
	private String projectReader;
	private int projectStatus;
	private Timestamp pStartDate;
	private Timestamp pEndDate;
	private String writerImgPath;
	private String readerImgPath;
	private int commentCount;
	private int dibCount;
}
