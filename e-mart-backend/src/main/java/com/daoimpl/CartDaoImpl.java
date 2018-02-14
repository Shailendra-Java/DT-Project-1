package com.daoimpl;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dao.CartDao;
import com.model.Cart;

public class CartDaoImpl implements CartDao
{

	@Autowired
	SessionFactory sessionFactory;
	
	public CartDaoImpl(SessionFactory sessionFactory)
	{
		super();
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public void insertCart(Cart cart)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(cart);
		session.getTransaction().commit();
	}
	
	@SuppressWarnings("unchecked")
	public List<Cart> findByCartID(String userId)
	{
		Session session = sessionFactory.openSession();
		List<Cart> cr = null;
		try 
		{
			session.beginTransaction();
			cr = (List<Cart>)session.createQuery("from Cart where userMailId=:email and cartProductId=:pid").setString("email", userId).list();
			session.getTransaction().commit();
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			session.getTransaction().rollback();
			
		}
		return cr;
	}
	
	public Cart getCartById(int cartProductId, String userEmail)
	{
		Session session = sessionFactory.openSession();
		Cart  cr = null;
		session.beginTransaction();
		cr = (Cart)session.createQuery("from Cart where userMailId=:email and cartProductId=:id").setString("email", userEmail).setInteger("id", cartProductId).uniqueResult();
		session.getTransaction().commit();
		return cr;
	}
	public void deleteCart(int cartId)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Cart cr = (Cart)session.get(Cart.class, cartId);
		session.delete(cr);
		session.getTransaction().commit();
	}
	public void updateCart(Cart cr)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(cr);
		session.getTransaction().commit();
	}
	

}