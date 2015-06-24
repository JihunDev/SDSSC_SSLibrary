package com.test.book;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.Book;
import com.frame.Biz;

public class register {

	public static void main(String[] args) {
		ApplicationContext factory = 
				new ClassPathXmlApplicationContext("spring.xml");
		Biz biz = (Biz)factory.getBean("bookbiz");
		
		Book book = new Book("D","ȫ�浿��", "ȫ�浿","b.jpg","2��/7", 10, 9);
		
		try {
			biz.register(book);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
