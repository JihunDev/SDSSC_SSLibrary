package com.test.messagelog;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.MessageLog;
import com.frame.Biz;

public class Register {

	public static void main(String[] args) {
		ApplicationContext factory = 
	            new ClassPathXmlApplicationContext("spring.xml");
	      Biz biz = (Biz)factory.getBean("messagelogbiz");
	      
	    MessageLog log = new MessageLog("id01", 1, "id02", "���������ּ���");
		
		try {
			biz.register(log);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
