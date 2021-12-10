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

	public int selectTotalCount() {
		return sqlsession.selectOne("notice.totalCount");
	}

	public int fixPageCount() {
		return sqlsession.selectOne("notice.fixPageCount");
	}

	public Notice selectOneNotice(int noticeNo) {
		return sqlsession.selectOne("notice.selectOneNotice",noticeNo);
	}

	public int insertNotice(Notice n) {
		return sqlsession.insert("notice.insertNotice",n);
	}

	public ArrayList<Notice> noticeAroundList(int noticeNo) {
		List<Notice> nlist = sqlsession.selectList("notice.noticeAroundList",noticeNo);
		return (ArrayList<Notice>)nlist;
	}

	public int deleteNoticeNo(int noticeNo) {
		return sqlsession.delete("notice.deleteNoticeNo",noticeNo);
	}

	public int updateNoticeNo(Notice n) {
		return sqlsession.update("notice.updateNoticeNo",n);
	}

}
