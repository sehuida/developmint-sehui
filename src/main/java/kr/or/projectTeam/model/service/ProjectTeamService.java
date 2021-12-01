package kr.or.projectTeam.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.projectTeam.model.dao.ProjectTeamDao;
import kr.or.projectTeam.model.vo.ProjectTeam;

@Service
public class ProjectTeamService {
	@Autowired
	private ProjectTeamDao dao;

	public ArrayList<ProjectTeam> selectAllrecruitProject() {
		ArrayList<ProjectTeam> list = dao.selectAllrecruitProject();
		return list;
	}
}
