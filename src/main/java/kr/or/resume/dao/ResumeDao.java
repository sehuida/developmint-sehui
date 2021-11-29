package kr.or.resume.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
}
