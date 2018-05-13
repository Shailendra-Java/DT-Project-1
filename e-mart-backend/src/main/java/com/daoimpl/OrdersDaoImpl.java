package com.daoimpl;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.OrderDao;
import com.model.Orders;

@Repository
public class OrdersDaoImpl implements OrderDao
{

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	public OrdersDaoImpl(SessionFactory sessionFactory) {
		super();
		System.out.println("Order bean creation");
		this.sessionFactory = sessionFactory;
	}
	
	//@Transactional
	public void insertOrder(Orders order)
	{
		try {
			Session session =  sessionFactory.openSession();
			session.beginTransaction();
			session.persist(order);
			session.getTransaction().commit();
		}catch(Exception exception) {
			
		}
	}

}