package com.daoimpl;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.model.User;

@Repository
@Service
public class UserDaoImpl implements UserDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	public UserDaoImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;
	}
	public void insertUser(User user) {
		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(user);
			session.getTransaction().commit();
		}catch(Exception exception) {
			session.getTransaction().rollback();
		}
	}
	
	public User findUserByEmail(String email)
	{
		Session session = sessionFactory.openSession();
		User u = null;
		try
		{
		session.beginTransaction();
		u = session.get(User.class, email);
		session.getTransaction().commit();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
		}
		return u;
}
}
