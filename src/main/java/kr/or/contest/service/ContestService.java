package kr.or.contest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.contest.dao.ContestDao;

@Service
public class ContestService {

	@Autowired
	private ContestDao dao;
}
