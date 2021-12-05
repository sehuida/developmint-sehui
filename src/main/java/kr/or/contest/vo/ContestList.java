package kr.or.contest.vo;

import java.util.ArrayList;

import kr.or.comment.vo.Comment;
import lombok.Data;

@Data
public class ContestList {
	private ArrayList<Contest> newContest;
	private ArrayList<Contest> hotContest;
	private ArrayList<Comment> commentList;
	private Contest contest;
	private ArrayList<Contest> contestList;
	private int start;
	private String pageNavi;
	
	public ContestList(ArrayList<Comment> commentList, Contest contest) {
		super();
		this.commentList = commentList;
		this.contest = contest;
	}

	public ContestList(ArrayList<Contest> newContest, ArrayList<Contest> hotContest) {
		super();
		this.newContest = newContest;
		this.hotContest = hotContest;
	}

	public ContestList(ArrayList<Contest> contestList, int start, String pageNavi) {
		super();
		this.contestList = contestList;
		this.start = start;
		this.pageNavi = pageNavi;
	}

	
	
}
