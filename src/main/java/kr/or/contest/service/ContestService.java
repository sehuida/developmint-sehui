package kr.or.contest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.contest.dao.ContestDao;
import kr.or.contest.vo.Contest;

@Service
public class ContestService {

	@Autowired
	private ContestDao dao;

	public int insertContest(Contest c) {
		return dao.insertContest(c);
	}
	
}
