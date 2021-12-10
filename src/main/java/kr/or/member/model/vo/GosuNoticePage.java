package kr.or.member.model.vo;

import java.util.ArrayList;

import kr.or.gosu.vo.GosuNotice;
import lombok.Data;

@Data
public class GosuNoticePage {
	
	public GosuNoticePage(ArrayList<GosuNotice> list2, String pageNavi2, int start2) {
		// TODO Auto-generated constructor stub
	}
	private ArrayList<GosuNotice> list;
	private String pageNavi;
	private int start;
	
}
