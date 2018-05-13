package com.niit.test;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.dao.CartDao;

public class CartDaoTest {

	static CartDao cartDao;
	/*@Ignore
	@BeforeClass
	public static void init() {
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.*");
		context.refresh();
		cartDao = (CartDao) context.getBean("cartDaoImpl");
		
	} 
	
	@Test
	public void check() {
		
		System.out.println("Dao "+cartDao);
	}*/
}
