package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.arth.bean.RoleBean;
import com.bean.ActivityBean;



@Repository
public class ActivityDao {
	@Autowired
	JdbcTemplate stmt;
	public void insertActivity(ActivityBean activity) {
		stmt.update("insert into activity (activityname,amount) values (?,?)",activity.getActivityName(),activity.getAmount());
	}
	public List<ActivityBean> getAllActivity() {
		List<ActivityBean> activity = stmt.query("select * from activity", new BeanPropertyRowMapper<ActivityBean>(ActivityBean.class));
		return activity;
	}
	public ActivityBean getActivityByName(String activityName) {
		ActivityBean dbActivity = null;

		try {
			dbActivity = stmt.queryForObject("select * from activity where lower(activityname) = lower(?) ",
					new BeanPropertyRowMapper<ActivityBean>(ActivityBean.class), new Object[] { activityName });
		}catch(Exception e) {
			
		}
		return dbActivity;
	}
	public void deleteActivity(int activityId) {
		stmt.update("delete from activity where activityid = ?", activityId);
	}
	public ActivityBean getActivityById(int activityId) {

		ActivityBean activity = stmt.queryForObject("select * from activity where activityid = ? ",
				new BeanPropertyRowMapper<ActivityBean>(ActivityBean.class), new Object[] { activityId });

		return activity;
	}

	public void updateRole(ActivityBean activity) {
		stmt.update("update activity set activityname = ?,amount = ? where activityid = ? ", activity.getActivityName(),activity.getAmount(),activity.getActivityId());
	}
}
