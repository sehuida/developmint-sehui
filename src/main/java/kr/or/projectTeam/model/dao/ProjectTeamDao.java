package kr.or.projectTeam.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.projectTeam.model.vo.DevelopLanguage;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.projectDevLanguage;

@Repository
public class ProjectTeamDao {
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<ProjectTeam> selectAllrecruitProject() {
		List<ProjectTeam> list = sqlSession.selectList("projectTeam.projectList");
		return (ArrayList<ProjectTeam>) list;
	}

	public ArrayList<ProjectTeam> selectAllprojectList(Map<String, Object> map) {
		List<ProjectTeam> list = sqlSession.selectList("projectTeam.projectList", map);
		return (ArrayList<ProjectTeam>) list;
	}

	public ArrayList<projectDevLanguage> selectAllprojectLangList() {
		List<projectDevLanguage> list = sqlSession.selectList("projectTeam.projectLangList");
		return (ArrayList<projectDevLanguage>) list;
	}

	public int selectTotalCount() {
		int result = sqlSession.selectOne("projectTeam.projectDefaultCount");
		return result;
	}
	
	public int selectCheckTotalCount(Map<String, Object> map) {
		int result = sqlSession.selectOne("projectTeam.projectCheckCount", map);
		return result;
	}

	public ArrayList<ProjectTeam> selectAllCheckprojectList(Map<String, Object> map) {
		List<ProjectTeam> list = sqlSession.selectList("projectTeam.projectCheckList", map);
		return (ArrayList<ProjectTeam>) list;
	}
	
	public ArrayList<DevelopLanguage> selectAllDevelopLangList() {
		List<DevelopLanguage> list = sqlSession.selectList("projectTeam.developLangList");
		return (ArrayList<DevelopLanguage>) list;
	}

	public int writeRecruitTeam(Map<String, Object> map) {
		int rootChange = 1;
		int finalResult = 0;
		map.put("rootChange", rootChange);
		if(map.containsKey("flist")) {
		int firstResult = sqlSession.insert("projectTeam.writeRecruitTeam", map);
			if(firstResult > 0) {
				map.replace("rootChange", 2);
				finalResult = sqlSession.insert("projectTeam.writeRecruitTeam", map);
			}
		} else {
			finalResult = sqlSession.insert("projectTeam.writeRecruitTeam", map);
		}
		return finalResult;
	}

	

	
	
	
}
