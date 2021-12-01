package kr.or.projectTeam.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectTeamDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
}
