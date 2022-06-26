package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import com.bean.ActivityBean;



@Repository
public class ActivityDao {
	@Autowired
	JdbcTemplate stmt;
	public void insertActivity(ActivityBean activity) {
		stmt.update("insert into activity (activityname) values (?)",activity.getActivityName());
	}
	public List<ActivityBean> getAllActivity() {
		List<ActivityBean> activity = stmt.query("select * from activity", new BeanPropertyRowMapper<ActivityBean>(ActivityBean.class));
		return activity;
	}
}
