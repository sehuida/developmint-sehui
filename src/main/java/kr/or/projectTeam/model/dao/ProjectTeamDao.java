package kr.or.projectTeam.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.projectTeam.model.vo.DevelopLanguage;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.ProjectTeamNoticeComment;
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
		int insertLangValue = 1;
		map.put("insertLangValue", insertLangValue);
		int result = 0;
		int tempResult = sqlSession.insert("projectTeam.writeRecruitTeam", map);
		if(tempResult > 0) {
			map.replace("insertLangValue", 2);
			result = sqlSession.insert("projectTeam.writeRecruitTeam", map);
		}
		return result;
	}

	public int updateReadCount(int projectNo) {
		return sqlSession.update("projectTeam.updateReadCount", projectNo);
	}

	public ProjectTeam selectOneNotice(Map<String, Object> map) {
		return sqlSession.selectOne("projectTeam.selectOneNotice", map);
	}

	public ArrayList<ProjectTeamNoticeComment> selectCommentList(int projectNo) {
		List<ProjectTeamNoticeComment> list = sqlSession.selectList("projectTeam.selectCommentList", projectNo);
		return (ArrayList<ProjectTeamNoticeComment>) list;
	}

	

	

	
	
	
}
