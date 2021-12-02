package kr.or.contest.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ContestList {
	private ArrayList<Contest> newContest;
	private ArrayList<Contest> hotContest;
}
