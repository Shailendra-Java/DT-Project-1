<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link type="text/css" rel="stylesheet" href="/resources/nav.css" >
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div style="width: 100%; height:50px;"></div>
<div class = "container">
<div class = "row">
<div class = "col-sm-4 item-photo">
<img style = "max-width:100%; margin-top:30px;" src = "${pageContext.request.contextPath }/assets/images/${prod.imgName}" />
</div>
<div class = "col-sm-5" style = "border:0px solid gray; margin-top:90px;">
<h3>${prod.productName }</h3>
<h4>${prod.description }</h4>
<h4>${prod.price }</h4>
<h5>${prod.supplier.supplierName }</h5>
<div class = "section" stytle = "padding-bottom:20px;">
<form action="${pageContext.request.contextPath }/addToCart" method = "post">
<input type = "hidden" value = "${prod.productId }" name = "pid" />
<input type = "hidden" value = "${prod.price }" name = "pPrice" />
<input type = "hidden" value = "${prod.productName }" name = "pName" />
<input type = "hidden" value = "${prod.imgName }" name = "imgName" />
<input type = "text" class = "form-control" placeholder="Quantity" name = "pQty" required /><br>
<input class = "btn btn-warning btn-lg" type = "submit" value = "Add To Cart" />
<h6><span class = "glyphicon-heart-empty" style = "cursor:pointer;"></span>Wish List</h6>
</form>
</div>
</div>
<hr>
<div class = "col-sm-9">
<h3>Product Details</h3>
<ul class = "menu-Items">
<li>Checked quality</li>
<li>Easy return</li>
<li>Money Back Guarantee</li>
</ul>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>