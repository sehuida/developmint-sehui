package kr.or.projectTeam.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.projectTeam.model.dao.ProjectTeamDao;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.projectDevLanguage;
import kr.or.projectTeam.model.vo.projectTeamMainPageData;

@Service
public class ProjectTeamService {
	@Autowired
	private ProjectTeamDao dao;

	public projectTeamMainPageData selectAllrecruitProject(int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("start", end);
		ArrayList<ProjectTeam> list = dao.selectAllprojectList(map);
		ArrayList<projectDevLanguage> pdlList = dao.selectAllprojectLangList(map);
		
		int totalCount = dao.selectTotalCount();
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		return null;
	}

	// public ArrayList<ProjectTeam> selectAllrecruitProject() {
	//	ArrayList<ProjectTeam> list = dao.selectAllrecruitProject();
	//	return list;
//	}
	
	
}
