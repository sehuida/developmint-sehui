package kr.or.notice.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.notice.vo.Criteria;
import kr.or.notice.vo.Notice;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	public ArrayList<Notice> selectFin() {
		List<Notice> fixlist = sqlsession.selectList("notice.selectFin");
		return (ArrayList<Notice>)fixlist;
	}

	public ArrayList<Notice> selectNoticeList(Criteria cr) {
		List<Notice> list = sqlsession.selectList("notice.selectNoticeList",cr);
		return (ArrayList<Notice>)list;
	}
}
