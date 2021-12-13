package kr.or.projectTeam.model.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.projectTeam.model.vo.DevelopLanguage;
import kr.or.projectTeam.model.vo.ProjectEntry;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.projectTeam.model.vo.ProjectTeamNoticeComment;
import kr.or.projectTeam.model.vo.UseDevelopLanguage;
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

	public int updateRecruitTeam(Map<String, Object> map) {
		int result = 0;
		int tempResult = sqlSession.update("projectTeam.updateRecruitTeam", map);
		if(tempResult > 0) {
			int tempResult2 = sqlSession.delete("projectTeam.deleteLangList", map);
			if(tempResult2 > 0) {
				int insertLangValue = 2;
				map.put("insertLangValue", insertLangValue);
				result = sqlSession.insert("projectTeam.writeRecruitTeam", map);
			}
		}
		return result;
	}

	public int deleteOneNotice(int projectNo) {
		return sqlSession.delete("projectTeam.deleteOneNotice", projectNo);
	}

	public int updateStatus() {
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date();
		String today = sdFormat.format(nowDate);
		return sqlSession.update("projectTeam.updateStatus", today);
	}

	public int insertComment(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertComment", map);
	}

	public int deleteComment(int commentNo) {
		return sqlSession.delete("projectTeam.deleteComment", commentNo);
	}

	public int updateComment(Map<String, Object> map) {
		return sqlSession.update("projectTeam.updateComment", map);
	}

	public int reCommentInsert(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.reCommentInsert", map);
	}

	public int insertDibCount(Map<String, Object> map) {
		return sqlSession.insert("projectTeam.insertDibCount", map);
	}

	public int deleteDibCount(Map<String, Object> map) {
		return sqlSession.delete("projectTeam.deleteDibCount", map);
	}

	public int insertApplyProject(Map<String, Object> map) {
		int insertLangValue = 1;
		map.put("insertLangValue", insertLangValue);
		int result = 0;
		int tempResult = sqlSession.insert("projectTeam.insertApplyProject", map);
		if(tempResult > 0) {
			map.replace("insertLangValue", 2);
			result = sqlSession.insert("projectTeam.insertApplyProject", map);
		}
		return result;
	}

	public ArrayList<ProjectEntry> selectAllManageEntry(Map<String, Object> map) {
		List<ProjectEntry> list = sqlSession.selectList("projectTeam.selectAllManageEntry", map);
		return (ArrayList<ProjectEntry>) list;
	}

	public ArrayList<UseDevelopLanguage> selectAllUseDevelopLangList(int projectNo) {
		List<UseDevelopLanguage> list = sqlSession.selectList("projectTeam.selectAllUseDevelopLangList");
		return (ArrayList<UseDevelopLanguage>) list;
	}

	public int selectentryTotalCount(int entryNo) {
		return sqlSession.selectOne("projectTeam.selectentryTotalCount");
	}

	public int selectMember(Map<String, Object> map) {
		return sqlSession.update("projectTeam.selectMember", map);
	}

	public ArrayList<ProjectEntry> selectFinalMember(int projectNo) {
		List<ProjectEntry> finalList = sqlSession.selectList("projectTeam.selectAllFinalEntry", projectNo);
		return (ArrayList<ProjectEntry>) finalList;
	}

	public int closeRecruitTeam(Map<String, Object> map) {
		int result = 0;
		int updateResult1 = sqlSession.update("projectTeam.updateFinalRecruitTeam", map);
		if(updateResult1 > 0) {
			int updateResult2 = sqlSession.update("projectTeam.updateFinalRecruitTeam2", map);
			if(updateResult2 > 0) {
				result = sqlSession.insert("projectTeam.insertFinalTeamMember", map);
			}
		}
		return result;
	}

	

	

	
	
	
}
