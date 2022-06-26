package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.ActivityBean;
import com.bean.UserBean;
import com.dao.ActivityDao;
import com.dao.UserDao;





@Controller
public class UserController {
  @Autowired
  	ActivityDao activitydao;
  @Autowired
	UserDao userdao;
	
	@GetMapping("/register")
	public String signUp(Model model) {
		List<ActivityBean> activity = activitydao.getAllActivity();
		model.addAttribute("activity", activity);
		return "SignUp";
	}
	@PostMapping("/saveuser")
	public String saveUser(UserBean student,Model model) {
		int registerId = (int) (Math.random() * 1000000);
		userdao.insertStudent(student);
		model.addAttribute("success","Congratulations!!!Your registration was successfully completed.");
	     System.out.println("Your Registration Id is "+registerId );
	     model.addAttribute("id",registerId);
	    model.addAttribute("student", userdao.getUserById());
	    model.addAttribute("activity", activitydao.getAllActivity());
		return "Register";
	}
}
