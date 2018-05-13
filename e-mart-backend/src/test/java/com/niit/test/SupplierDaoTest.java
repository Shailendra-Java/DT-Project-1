package com.niit.test;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.dao.SupplierDao;

public class SupplierDaoTest {

	static SupplierDao supplierDao;
	/*@Ignore
	@BeforeClass
	public static void init() {
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.*");
		context.refresh();
		supplierDao = (SupplierDao) context.getBean("supplierDaoImpl");
		
	} 
	
	@Test
	public void check() {
		
		System.out.println("Dao "+supplierDao);
	}*/
}
