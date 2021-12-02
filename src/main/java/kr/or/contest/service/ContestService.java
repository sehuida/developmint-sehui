package kr.or.contest.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.contest.dao.ContestDao;
import kr.or.contest.vo.Contest;
import kr.or.contest.vo.ContestList;

@Service
public class ContestService {

	@Autowired
	private ContestDao dao;
	
	@Transactional
	public int insertContest(Contest c) {
		return dao.insertContest(c);
	}

	public ArrayList<Contest> contestAllList() {
		return dao.contestAllList();
	}

	public ContestList selectContestList() {
		ArrayList<Contest> newContest = dao.newContestList();
		ArrayList<Contest> hotContest = dao.hotContestList();
		ContestList list = new ContestList();
		list.setNewContest(newContest);
		list.setHotContest(hotContest);
		return list;
	}
	
}
