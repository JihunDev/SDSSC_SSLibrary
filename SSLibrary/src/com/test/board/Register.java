package com.test.board;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Board;
import com.frame.Biz;

public class Register {

	public static void main(String[] args) {
		ApplicationContext factory = 
	            new ClassPathXmlApplicationContext("spring.xml");
	      Biz biz = (Biz)factory.getBean("boardbiz");
	   
	    Board log = new Board("id04", "�ȳ��Ͻ���", "����", "�����Խ���", "a.jpg"); 
		
		try {
			biz.register(log);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
