package kr.or.projectTeam.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class projectTeamMainPageData {
	private ArrayList<ProjectTeam> list;
	private String pageNavi;
	private int start;
	private ArrayList<projectDevLanguage> pdLang;
}
