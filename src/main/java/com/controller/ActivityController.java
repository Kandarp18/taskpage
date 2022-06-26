package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.ActivityBean;
import com.dao.ActivityDao;

@Controller
public class ActivityController {
	@Autowired
	ActivityDao activitydao;
    @GetMapping("/addactivity")
    public String addActivity(Model model) {
    	
    	model.addAttribute("activity",activitydao.getAllActivity());
    	return "AddActivity";
    }
    @PostMapping("/saveactivity")
    public String saveActivity(ActivityBean activity,Model model) {
    	boolean p=false;
    	ActivityBean dbActivity=activitydao.getActivityByName(activity.getActivityName());
		if(dbActivity!=null) {
		if((activity.getActivityName()).equalsIgnoreCase(dbActivity.getActivityName())==true){
			p=true;
		
		}
		}
		if(p==true) {
			
			model.addAttribute("error","This Sport Activity Name Already Exists!");
			model.addAttribute("activity", activitydao.getAllActivity());
			
		}else {
			
			
			activitydao.insertActivity(activity);
			model.addAttribute("success","Sport Activity Added Successfully!");
			model.addAttribute("activity",activitydao.getAllActivity());
	    	
		}
		return "ListActivity";

    }
    @GetMapping("/listactivity")
    public String listAcitvity(Model model) {
    	model.addAttribute("activity",activitydao.getAllActivity());
    	return "ListActivity";
    }
    @GetMapping("/deleteactivity/{activityId}")
    public String deleteActivity(@PathVariable("activityId") int activityId) {
    	activitydao.deleteActivity(activityId);
    	return "redirect:/listactivity";
    }
    @GetMapping("/editactivity")
    public String editActivity(@RequestParam("activityId") int activityId, Model model) {
    	model.addAttribute("a",activitydao.getActivityById(activityId) );
    	return "EditActivity";
    }
    @PostMapping("/updateactivity")
    public String updateActivity(ActivityBean activity,Model model) {
    	boolean p=false;
    	ActivityBean dbActivity=activitydao.getActivityByName(activity.getActivityName());
		if(dbActivity!=null) {
		if((activity.getActivityName()).equalsIgnoreCase(dbActivity.getActivityName())==true){
			p=true;
		
		}
		}
		if(p==true) {
			
			model.addAttribute("error","This Sport Activity Name Already Exists!");
			model.addAttribute("activity", activitydao.getAllActivity());
			
		}else {
			
			
			activitydao.updateRole(activity);
			model.addAttribute("success","Sport Activity Edited Successfully!");
			model.addAttribute("activity",activitydao.getAllActivity());
	    	
		}
		return "ListActivity";
    }
    
}
