package kr.or.jobSearch.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.announce.vo.Announce;
import kr.or.jobSearch.dao.JobSearchDao;

@Service
public class JobSearchService {

	@Autowired
	private JobSearchDao dao;

	public ArrayList<Announce> selectAllAnnounce() {
		return dao.selectAllAnnounce();
	}
	
	
}
