package com.niit.test;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.dao.CategoryDao;

public class CategoryDaoTest {

	static CategoryDao categoryDao;
/*	@BeforeClass
	@Ignore
	public static void init() {
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.*");
		context.refresh();
		categoryDao = (CategoryDao) context.getBean("categoryDaoimpl");
		
	} 
	
	@Test
	public void check() {
		
		System.out.println("Dao "+categoryDao);
	}*/
}
