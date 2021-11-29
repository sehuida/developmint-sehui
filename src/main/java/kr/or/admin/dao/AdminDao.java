package kr.or.admin.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
}
