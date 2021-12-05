package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuProject {
	private int gprojectNo;
	private int ggsouNo;
	private String gprojectTitle;
	private String gprojectContent;
	private String gprojectFilepath;
	public String getGprojectContentBr(){
		return gprojectContent.replaceAll("\r\n", "<br>");
	}
}
