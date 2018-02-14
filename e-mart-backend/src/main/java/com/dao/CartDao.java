package com.dao;
import java.util.List;

import com.model.Cart;

public interface CartDao
{

	public void insertCart(Cart cart);
	public List<Cart> findByCartID(String userId);
	public Cart getCartById(int cartId, String userEmail);
	public void deleteCart(int cartId);
	public void updateCart(Cart cr);
	
}
