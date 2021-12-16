package kr.or.share.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.vo.GosuNoticePage;
import kr.or.share.model.dao.ShareDao;
import kr.or.share.model.vo.Share;
import kr.or.share.model.vo.ShareBoardPage;

@Service
public class ShareService {
	@Autowired
	private ShareDao dao;
	
	@Transactional
	public int insertShareBoard(Share s) {
		int result = 0;
		result += dao.insertBoard(s);
		result += dao.plusPoints(s);
		return result;
	}
	
	public ShareBoardPage shareBoardList(int reqPage, int type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end - numPerPage +1;
		
		map.put("start", start);
		map.put("end",end);
		map.put("type", type);
		
		ArrayList<Share> list = dao.shareBoardList(map);
		
		int totalCount = dao.shareTotalCount();
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li class=\"page-item\">";
			pageNavi += "<a class=\"page-link\" href='/shareList.do?reqPage="+(pageNo-1)+"&type="+type+"'>&laquo;</a></li>";
		}
		
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"page-item active\">";
				pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>";
			pageNavi += "&raquo;</a></li>";
		}
		pageNavi += "</ul>";
		
		ShareBoardPage sbp = new ShareBoardPage(list, start, pageNavi);
		return sbp;
	}
	
	//검색하는거 구현중!
	public ShareBoardPage shareBoardList(int reqPage, int type, int category, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end - numPerPage +1;
		
		map.put("start", start);
		map.put("end",end);
		map.put("type", type);
		map.put("search", search);
		
		ArrayList<Share> list = null;
		
		if(category == 1) {
			list = dao.searchId(map);			
		}else {
			list = dao.searchTitle(map);	
		}
		
		int totalCount = dao.shareTotalCount();
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li class=\"page-item\">";
			pageNavi += "<a class=\"page-link\" href='/shareList.do?reqPage="+(pageNo-1)+"&type="+type+"'>&laquo;</a></li>";
		}
		
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"page-item active\">";
				pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/shareList.do?reqPage="+pageNo+"&type="+type+"'>";
			pageNavi += "&raquo;</a></li>";
		}
		pageNavi += "</ul>";
		
		ShareBoardPage sbp = new ShareBoardPage(list, start, pageNavi);
		return sbp;
	}
}
