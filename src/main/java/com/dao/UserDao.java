package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.ActivityBean;
import com.bean.UserBean;

@Repository
public class UserDao {
	@Autowired
	JdbcTemplate stmt;
	public void insertStudent(UserBean student) {
		stmt.update("insert into student (studentname,dob,age,registerdate,activityid,amount) values (?,?,?,?,?,?)",student.getStudentName(),student.getDob(),student.getAge(),student.getRegisterDate(),student.getActivityId(),student.getAmount());
	}
	public List<UserBean> getAllStudent() {
		List<UserBean> users = stmt.query("select * from student", new BeanPropertyRowMapper<UserBean>(UserBean.class));
		return users;
	}
	
	public List<UserBean> getUserById() {

		List<UserBean> student = stmt.query("select u.*,a.activityName from student u,activity a where u.activityid = a.activityid  ", new BeanPropertyRowMapper<UserBean>(UserBean.class));

		return student;
	}
	public UserBean getStudentByName(String studentName,int activityId) {
		UserBean dbActivity = null;

		try {
			dbActivity = stmt.queryForObject("select * from student where lower(studentname) = lower(?) and activityid=? ",
					new BeanPropertyRowMapper<UserBean>(UserBean.class), new Object[] { studentName,activityId });
		}catch(Exception e) {
			
		}
		return dbActivity;
	}
}
