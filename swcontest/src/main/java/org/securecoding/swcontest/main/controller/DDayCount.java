package org.securecoding.swcontest.main.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.securecoding.swcontest.main.service.MainService;
import org.securecoding.swcontest.main.vo.BannerVo;

public class DDayCount  {
	
	@Resource(name="mainService")
	private MainService service;
	
	public List<BannerVo> getDDay() {
		
		List<BannerVo> list = null;
		list = service.selectBannerAll();
		countDay(list);
		return list;
	}
	
	public List<BannerVo> getAllDay() {
		List<BannerVo> list = service.selectBannerAll();
		return list;
	}
	
	public List<BannerVo> countDay(List<BannerVo> list) {
		Date today = new Date();
		Date dDay = null;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < list.size(); i++) {
			try {
				dDay = transFormat.parse(list.get(i).getBann_date());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Calendar todayCalendar = Calendar.getInstance ( );
			todayCalendar.setTime (today);
			Calendar ddayCalendar = Calendar.getInstance();
			ddayCalendar.setTime(dDay);
			long todayMilli = todayCalendar.getTimeInMillis();
			long ddayMilli = ddayCalendar.getTimeInMillis();
			int count = (int)((dDay.getTime() - today.getTime())/1000/60/60/24) + 1;
			if(count >= 0) {
				list.get(i).setBann_date(count + "");
			} else {
				list.get(i).setBann_date("-1");
			}
		}
		return list;
	}
	
}
