package kr.or.gosu.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.or.gosu.dao.GosuDao;
import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;

@Service
public class GosuService {
	private GosuDao dao;

	public int insertGosu(Gosu g, ArrayList<GosuPhoto> photoList, ArrayList<GosuProject> projectList,
			GosuProject[] gProject) {
		int gosuResult = dao.insertGosu(g); 
		int photoResult = 0;
		int projectResult = 0;
		
		if(gosuResult >0) {
			for(GosuPhoto gph : photoList) {
				gph.setGgsouNo(g.getGgsouNo());
				photoResult += dao.insertGPhoto(gph);
			}	
			for(GosuProject gpr : projectList) {
				gpr.setGgsouNo(g.getGgsouNo());
				projectResult  += dao.insertGProject(gpr);
			}
		}else {
			return -1;
		}
		return projectResult;
	}

	
}
