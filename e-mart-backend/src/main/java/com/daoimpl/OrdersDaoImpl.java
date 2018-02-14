package com.daoimpl;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.OrderDao;
import com.model.Orders;

@Repository("OrderDaoImpl")
public class OrdersDaoImpl implements OrderDao
{

	@Autowired
	SessionFactory sessionFactory;
	
	public OrdersDaoImpl(SessionFactory sessionfactory)
	{
	 this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public void insertOrder(Orders order)
	{
		Session session =  sessionFactory.openSession();
		session.persist(order);
	}

}