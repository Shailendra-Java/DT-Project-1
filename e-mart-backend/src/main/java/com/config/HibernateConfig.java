package com.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.daoimpl.CartDaoImpl;
import com.daoimpl.CategoryDaoImpl;
import com.daoimpl.OrdersDaoImpl;
import com.daoimpl.ProductsDaoImpl;
import com.daoimpl.SupplierDaoImpl;
import com.daoimpl.UserDaoImpl;
import com.model.Cart;
import com.model.Category;
import com.model.Orders;
import com.model.Products;
import com.model.Supplier;
import com.model.User;

@Configuration
@ComponentScan("com.*")
@EnableTransactionManagement
public class HibernateConfig {

	private final static String DATABASE_URL = "jdbc:h2:tcp://localhost/~/emart";
	private final static String DATABASE_DRIVER = "org.h2.Driver";
	private final static String DATABASE_DIALECT = "org.hibernate.dialect.H2Dialect";
	private final static String DATABASE_USERNAME = "sa";
	private final static String DATABASE_PASSWORD = "";
	
	@Autowired
	@Bean(name="dataSource")
	public DataSource getH2Data(){
		
		DriverManagerDataSource dsource = new DriverManagerDataSource();
		dsource.setDriverClassName(DATABASE_DRIVER);
		dsource.setUrl(DATABASE_URL);
		dsource.setUsername(DATABASE_USERNAME);
		dsource.setPassword(DATABASE_PASSWORD);
		System.out.println("H2 Connected"); 
		return dsource;
	}
	
	private Properties getHiber(){
		
		Properties properties = new Properties();
		properties.put("hibernate.dialect", DATABASE_DIALECT);
		properties.put("hibernate.hbm2ddl.auto", "update");
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.format_sql", "true");
		return properties;
	}
	
	@Autowired
	@Bean(name="sessionFactory")
	public SessionFactory getHiberSession(DataSource dataSource){
		
		LocalSessionFactoryBuilder localSessionFactoryBuilder = new LocalSessionFactoryBuilder(dataSource);
		localSessionFactoryBuilder.addProperties(getHiber());
		localSessionFactoryBuilder.addAnnotatedClass(User.class);
		localSessionFactoryBuilder.addAnnotatedClass(Supplier.class);
		localSessionFactoryBuilder.addAnnotatedClass(Category.class);
		localSessionFactoryBuilder.addAnnotatedClass(Products.class);
		localSessionFactoryBuilder.addAnnotatedClass(Cart.class);
		localSessionFactoryBuilder.addAnnotatedClass(Orders.class);
		System.out.println("---Tables created---");
		return localSessionFactoryBuilder.buildSessionFactory();
	}
	
	@Autowired
	@Bean(name="userDaoImpl")
	public UserDaoImpl getUserData(SessionFactory sessionFactory){
		
		return new UserDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name="CategoryrDaoImpl")
	public CategoryDaoImpl getCategoryData(SessionFactory sessionFactory){
		
		return new CategoryDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name="SupplierDaoImpl")
	public SupplierDaoImpl getSupplierData(SessionFactory sessionFactory){
		
		return new SupplierDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name="productDaoImpl")
	public ProductsDaoImpl getProductData(SessionFactory sessionFactory){
		
		return new ProductsDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name="CartDaoImpl")
	public CartDaoImpl saveCartDAO(SessionFactory sessionFactory){
		
		return new CartDaoImpl(sessionFactory);
	}

	@Autowired
	@Bean(name="ordersDaoImpl")
	public OrdersDaoImpl saveOrderrDAO(SessionFactory sessionFactory){
		
		return new OrdersDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name="transactionManager")
	public HibernateTransactionManager getTransaction(SessionFactory sessionFactory){
		
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}
}
