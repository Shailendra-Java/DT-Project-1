package com.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CartDao;
import com.dao.CategoryDao;
import com.dao.OrderDao;
import com.dao.ProductsDao;
import com.dao.SupplierDao;
import com.dao.UserDao;
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

@Controller 
public class CartController
{
		@Autowired
		SupplierDao supplierDaoImpl;
		
		@Autowired
		CategoryDao categoryDaoImpl;
		
		@Autowired
		ProductsDao productsDaoImpl;
		
		@Autowired
		CartDao cartDaoImpl;
		
		@Autowired
		OrderDao orderDaoImpl;
		
		@Autowired
		UserDao userDaoImpl;
		
		@RequestMapping(value="/prodDetails")
		public ModelAndView prodDet(@RequestParam("pid")int pid)
		{
			ModelAndView mv = new ModelAndView();
			Products prod = productsDaoImpl.findByProductId(pid);
			mv.addObject("prod",prod);
			mv.setViewName("prodDetails");
			return mv;
		}
		
		@RequestMapping(value =  "/addToCart", method = RequestMethod.POST)
		public ModelAndView addtocart(HttpServletRequest request)
		{
			ModelAndView mv = new ModelAndView();
			Principal principal = request.getUserPrincipal();
			String userEmail = principal.getName();
			
			try
			{
				int pid = Integer.parseInt(request.getParameter("pid"));
						Double price = Double.parseDouble(request.getParameter("pPrice"));
						int qty = Integer.parseInt(request.getParameter("pQty"));
						String pname = request.getParameter("pName");
						String imgName = request.getParameter("imgName");
						Cart cartExist = cartDaoImpl.getCartById(pid, userEmail);
						if(cartExist == null)
						{
							
							Cart cm = new Cart();
							cm.setCartPrice(price);
							cm.setCartProductId(pid);
							cm.setCartStock(qty);
							cm.setCartImage(imgName);
							cm.setCartProductName(pname);
							
							User u = userDaoImpl.findUserByEmail(userEmail);
							cm.setCartUserDetails(u);
							cartDaoImpl.insertCart(cm);
						}
						else if(cartExist != null)
						{
							Cart cm = new Cart();
							cm.setCartId(cartExist.getCartId());
							cm.setCartProductId(pid);
							cm.setCartStock(cartExist.getCartStock()+qty);
							cm.setCartImage(imgName);
							cm.setCartProductName(pname);
							
							User u = userDaoImpl.findUserByEmail(userEmail);
							cm.setCartUserDetails(u);
							cartDaoImpl.updateCart(cm);
						}
						mv.addObject("cartInfo",cartDaoImpl.findByCartID(userEmail));
						mv.setViewName("cart");
						return mv;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				mv.addObject("cartInfo",cartDaoImpl.findByCartID(userEmail));
				mv.setViewName("cart");
				return mv;
			}
		}
		@RequestMapping(value = "/checkout", method = RequestMethod.GET)
		public ModelAndView checkoutProcess(HttpServletRequest req)
		{
			ModelAndView mv = new ModelAndView();
			Principal principal = req.getUserPrincipal();
			String userEmail = principal.getName();
			User user = userDaoImpl.findUserByEmail(userEmail);
			List<Cart> cart = cartDaoImpl.findByCartID(userEmail);
			mv.addObject("user", user);
			mv.addObject("cart", cart);
			return mv;
		}
		
		@RequestMapping(value = "/invoiceprocess", method = RequestMethod.POST )
		public ModelAndView invoiceProcess(HttpServletRequest req)
		{
			ModelAndView mv = new ModelAndView("invoice");
			Orders ord = new Orders();
			Principal principal = req.getUserPrincipal();
			String userEmail = principal.getName();
			Double total = Double.parseDouble(req.getParameter("total"));
			String payment = req.getParameter("Payment");
			User users = userDaoImpl.findUserByEmail(userEmail);
			ord.setUser(users);
			ord.setTotal(total);
			ord.setPayment(payment);
			orderDaoImpl.insertOrder(ord);
			mv.addObject("user", users);
			mv.addObject("order", ord);
			return mv;
			
		}
		
		@RequestMapping(value = "/orderprocess", method = RequestMethod.POST )
		public ModelAndView orderProcess(HttpServletRequest req)
		{
			ModelAndView mv = new ModelAndView("ack");
			return mv;
			
		}
		@RequestMapping("/ack")
		public String ack()
		{
			return "ack";
		}
		
		@RequestMapping(value = "/deletePCart/{cartId}")
		public ModelAndView deleteCartItem(@PathVariable("cartId")int cartId, HttpServletRequest req)
		{
			ModelAndView mv = new ModelAndView();
			Principal principal = req.getUserPrincipal();
			String userEmail = principal.getName();
			cartDaoImpl.deleteCart(cartId);
			mv.addObject("cartInfo", cartDaoImpl.findByCartID(userEmail));
			mv.setViewName("cart");
			return mv;
			
			
		}
		
		@RequestMapping(value = "/goToCart", method = RequestMethod.GET)
		public ModelAndView gotocart(HttpServletRequest req)
		{
			ModelAndView mv = new ModelAndView();
			Principal principal = req.getUserPrincipal();
			String userEmail = principal.getName();
			mv.addObject("cartInfo", cartDaoImpl.findByCartID(userEmail));
			mv.setViewName("cart");
			return mv;
		}
}
