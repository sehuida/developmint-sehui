package kr.or.projectTeam.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.projectTeam.model.dao.ProjectTeamDao;
import kr.or.projectTeam.model.vo.DevelopLanguage;
import kr.or.projectTeam.model.vo.ProjectEntry;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.ProjectTeamApplyPageData;
import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.projectTeam.model.vo.ProjectTeamNoticeComment;
import kr.or.projectTeam.model.vo.ProjectTeamNoticeViewData;
import kr.or.projectTeam.model.vo.UseDevelopLanguage;
import kr.or.projectTeam.model.vo.projectDevLanguage;
import kr.or.projectTeam.model.vo.projectTeamMainPageData;

@Service
public class ProjectTeamService {
	@Autowired
	private ProjectTeamDao dao;

	public projectTeamMainPageData selectAllrecruitProject(int reqPage) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<ProjectTeam> list = dao.selectAllprojectList(map);
		ArrayList<projectDevLanguage> pdLangList = dao.selectAllprojectLangList();
		ArrayList<DevelopLanguage> developLangList = dao.selectAllDevelopLangList();
		
		int totalCount = dao.selectTotalCount();
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainPage.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainPage.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainPage.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainPage.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ArrayList<String> langList = null; 
		projectTeamMainPageData ptmpd = new projectTeamMainPageData(list, pageNavi, start, pdLangList, developLangList, langList);
		return ptmpd;
	}

	public projectTeamMainPageData selectAllrecruitSelectProject(int reqPage, int viewValue, int checkValue) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("viewValue", viewValue);
		map.put("checkValue", checkValue);
		ArrayList<ProjectTeam> list = dao.selectAllCheckprojectList(map);
		ArrayList<projectDevLanguage> pdLangList = dao.selectAllprojectLangList();
		ArrayList<DevelopLanguage> developLangList = dao.selectAllDevelopLangList();
		
		int totalCount = dao.selectCheckTotalCount(map);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+(pageNo-1)+"&viewValue="+viewValue+"&checkValue="+checkValue+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ArrayList<String> langList = null; 
		projectTeamMainPageData ptmpd = new projectTeamMainPageData(list, pageNavi, start, pdLangList, developLangList, langList);
		return ptmpd;
	}

	public projectTeamMainPageData selectAllrecruitSelectProject(int reqPage, int viewValue, int checkValue,
			ArrayList<String> langList) {
		
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("viewValue", viewValue);
		map.put("checkValue", checkValue);
		map.put("langList", langList);
		ArrayList<ProjectTeam> list = dao.selectAllCheckprojectList(map);
		ArrayList<projectDevLanguage> pdLangList = dao.selectAllprojectLangList();
		ArrayList<DevelopLanguage> developLangList = dao.selectAllDevelopLangList();
		
		int totalCount = dao.selectCheckTotalCount(map);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			String pdNaviUrl1 = "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+(pageNo-1)+"&viewValue="+viewValue+"&checkValue="+checkValue+"";
			for(int i = 0; i < langList.size(); i++) {
				String addData = "&langValue="+langList.get(i);
				pdNaviUrl1 += addData;
			}
			pdNaviUrl1 += "'>";
			
			pageNavi += "<li class='page-item'>";
			pageNavi += pdNaviUrl1;
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				String pdNaviUrl2 = "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"";
				for(int j = 0; j < langList.size(); j++) {
					String addData = "&langValue="+langList.get(j);
					pdNaviUrl2 += addData;
				}
				pdNaviUrl2 += "'>";
				
				pageNavi += "<li class='page-item active'>";
				pageNavi += pdNaviUrl2;
				pageNavi += pageNo + "</a></li>";
			} else {
				String pdNaviUrl3 = "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"";
				for(int j = 0; j < langList.size(); j++) {
					String addData = "&langValue="+langList.get(j);
					pdNaviUrl3 += addData;
				}
				pdNaviUrl3 += "'>";
				
				pageNavi += "<li class='page-item'>";
				pageNavi += pdNaviUrl3;
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			String pdNaviUrl4 = "<a class = 'page-link' href='/recruitTeamMember_mainSelectPage.do?reqPage="+pageNo+"&viewValue="+viewValue+"&checkValue="+checkValue+"";
			for(int i = 0; i < langList.size(); i++) {
				String addData = "&langValue="+langList.get(i);
				pdNaviUrl4 += addData;
			}
			pdNaviUrl4 += "'>";
			
			pageNavi += "<li class='page-item'>";
			pageNavi += pdNaviUrl4;
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		projectTeamMainPageData ptmpd = new projectTeamMainPageData(list, pageNavi, start, pdLangList, developLangList, langList);
		return ptmpd;
	}


	public int writeRecruitTeam(ProjectTeam pt, int memberNo, ArrayList<String> langList) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("pt", pt);
		map.put("langList", langList);
		int result = dao.writeRecruitTeam(map);
		return result;
	}

	public ArrayList<DevelopLanguage> selectAllDevelopLang() {
			ArrayList<DevelopLanguage> dlList = dao.selectAllDevelopLangList();
		return dlList;
	}

	public ProjectTeamNoticeViewData selectOneNotice(int projectNo, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int result = dao.updateReadCount(projectNo);
		if(result <= 0) {
			return null;
		}
		ProjectTeam pt = dao.selectOneNotice(map);
		ArrayList<ProjectTeamNoticeComment> list = dao.selectCommentList(projectNo);
		ArrayList<projectDevLanguage> pdLangList = dao.selectAllprojectLangList();
		ProjectTeamNoticeViewData ptnvd = new ProjectTeamNoticeViewData(list, pt, pdLangList);
		return ptnvd;
		
	}

	public int updateRecruitTeam(ProjectTeam pt, int memberNo, ArrayList<String> langList, int projectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		map.put("pt", pt);
		map.put("langList", langList);
		int result = dao.updateRecruitTeam(map);
		return result;
	}

	public int deleteOneNotice(int projectNo) {
		int result = dao.deleteOneNotice(projectNo);
		return result;
	}

	public int updateStatus() {
		int result = dao.updateStatus();
		return result;
	}

	public int insertComment(String commentContent, int boardNo, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentContent", commentContent);
		map.put("boardNo", boardNo);
		map.put("memberId", memberId);
		int result = dao.insertComment(map);
		return result;
	}

	public int deleteComment(int commentNo) {
		int result = dao.deleteComment(commentNo);
		return result;
	}

	public int updateComment(int commentNo, String commentContent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentContent", commentContent);
		map.put("commentNo", commentNo);
		int result = dao.updateComment(map);
		return result;
	}

	public int reCommentInsert(String commentContent, int boardNo, String memberId, int commentNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentContent", commentContent);
		map.put("boardNo", boardNo);
		map.put("memberId", memberId);
		map.put("commentNo", commentNo);
		int result = dao.reCommentInsert(map);
		return result;
	}

	public int insertDibCount(int projectNo, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		int result = dao.insertDibCount(map);
		return result;
	}

	public int deleteDibCount(int projectNo, int memberNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		int result = dao.deleteDibCount(map);
		return result;
	}
	
	public int insertApplyProject(ProjectEntry pta, ArrayList<String> langList) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pta", pta);
		map.put("langList", langList);
		int result = dao.insertApplyProject(map);
		return result;
	}

	public ProjectTeamApplyPageData selectAllManageEntry(int reqPage, int viewValue, int projectNo) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("viewValue", viewValue);
		map.put("projectNo", projectNo);
		ArrayList<ProjectEntry> entryList = dao.selectAllManageEntry(map);
		ArrayList<UseDevelopLanguage> udLangList = dao.selectAllUseDevelopLangList(projectNo);
		ArrayList<DevelopLanguage> developLangList = dao.selectAllDevelopLangList();
		int entryNo = entryList.get(0).getEntryNo();
		
		int totalCount = dao.selectentryTotalCount(entryNo);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/manageEntry.do?reqPage="+(pageNo-1)+"&viewValue="+viewValue+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/manageEntry.do?reqPage="+pageNo+"&viewValue="+viewValue+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/manageEntry.do?reqPage="+pageNo+"&viewValue="+viewValue+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/manageEntry.do?reqPage="+pageNo+"&viewValue="+viewValue+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		ProjectTeamApplyPageData ptapd = new ProjectTeamApplyPageData(entryList, pageNavi, start, developLangList, udLangList);
		return ptapd;
	}

	
}
