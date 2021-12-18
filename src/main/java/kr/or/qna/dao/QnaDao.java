package kr.or.qna.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.qna.vo.Qna;
import kr.or.qna.vo.nonQna;

@Repository
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlsession;

	//--------------------비회원전용
	public int insertCountNonQna(nonQna nq) {
		return sqlsession.insert("qna.insertCounselNonQna",nq);
	}


	public int insertCounselQna(Qna q) {
		return sqlsession.insert("qna.insertCountQna",q);
	}


	public int insertFile(ProjectTeamFileVO ptfv) {
		return sqlsession.insert("qna.insertFile",ptfv);
	}


	public ArrayList<Qna> counselList() {
		List<Qna> list = sqlsession.selectList("qna.counselList");
		return (ArrayList<Qna>)list;
	}


	public ArrayList<nonQna> counselList2() {
		List<nonQna> list = sqlsession.selectList("qna.counselList2");
		return (ArrayList<nonQna>)list;
	}


	public int updateCounsel(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlsession.update("qna.updateCounsel",map);
	}

	
	
}
