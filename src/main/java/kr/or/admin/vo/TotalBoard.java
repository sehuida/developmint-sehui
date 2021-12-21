package kr.or.admin.vo;

import java.util.ArrayList;

import kr.or.announce.vo.Announce;
import kr.or.contest.vo.Contest;
import kr.or.gosu.vo.GosuNotice;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.share.model.vo.Share;

public class TotalBoard {
	private String pageNavi;
	private int totalCount;
	private ArrayList<Share> shareList;
	private ArrayList<ProjectTeam> projectList;
	private ArrayList<Announce> announceList;
	private ArrayList<GosuNotice> gosuList;
	private ArrayList<Contest> contesetList;
	private String  bestMember;
}
