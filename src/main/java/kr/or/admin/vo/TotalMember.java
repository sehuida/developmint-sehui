package kr.or.admin.vo;

import java.util.ArrayList;

import kr.or.member.model.vo.Member;
import lombok.Data;

@Data
public class TotalMember {
	private ArrayList<Member> allMemberList;
	private int start;
	private String pageNavi;
}
