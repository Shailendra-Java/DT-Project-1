<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link type="text/css" rel="stylesheet" href="/assets/css/emart-styles.css" >
  
   <style type="text/css">
  	.container {
    	padding: 5px;
    	background:#fdfdfd;
    	box-shadow: 0px 0px 18px -3px;
    	border:solid 1px #777;
    	min-height: 450px;
	}
  </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div style="width: 100%; height:50px;"></div>

<div class="container">

<c:url value="/productUpdate" var="pru"></c:url>
				<h1 class="input-title"> Update Product </h1>
				<hr>
				<form method="post" action="${pageContext.request.contextPath}/admin/productUpdate" class="form-signin" enctype="multipart/form-data">
				<span id="reauth-email" class="reauth-email"></span>
				
				<input type="hidden" name="productId" value="${prod.productId }">
				<h4 class="input-title">Product Name</h4><br>
				<input class="form-control" value="${prod.productName}" type="text" name="productName" required/><br> 
				
				<h4 class="input-title">Product Description</h4><br>
				<input class="form-control" value="${prod.description}" type="text" name="description" required/>
				
				<h4 class="input-title">Product price</h4><br>
				<input class="form-control" value="${prod.price}" type="text" name="price" required/>
				
				<h4 class="input-title">Product stock</h4><br>
				<input class="form-control" value="${prod.stock}" type="text" name="stock" required/>
				
				<div class="form-group">
				<table>
				<tr>
					<tb>Select Supplier</tb>
					<td>
					<select class="form-control" name="pSupplier" required>
					<option value="">---Select Supplier</option>
					<c:forEach items="${sList }" var="sat">
					<option value="${sat.sId}">${sat.supplierName }</option>
					</c:forEach>
					</select>
				</tr>
				</table>
				</div>
				
				<div class="form-group">
				<table>
				<tr>
					<tb>Select Category</tb>
					<td>
					<select class="form-control" name="pCategory" required>
					<option value="">---Select Category</option>
					<c:forEach items="${cList }" var="cat">
					<option value="${cat.cid}">${cat.categoryName}</option>
					</c:forEach>
					</select>
				</tr>
				</table>
				</div>
				
				<div class="fileinput fileinput-new" data-provider="fileinput">
				<td>Product Image</td>
				<td><input class="form-control" type="file" name="file" accept="image/*"></td>
				</div>
				
				<br><br>
				<button class="btn btn-lg btn-primary" type="submit">Update</button>
				<button class="btn btn-lg btn-warning" type="reset">Cancel</button>
				
				</form>
				
				</div>
				
</body>
</html>