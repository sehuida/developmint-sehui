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
	
	
}
