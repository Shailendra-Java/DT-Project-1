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
  <link type="text/css" rel="stylesheet" href="/resources/nav.css" >
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<div class="container">

<c:url value="/productUpdate" var="pru"></c:url>

				<form method="post" action="productUpdate"class="form-signin" enctype="multipart/form-part">
				<span id="reauth-email" class="reauth-email"></span>
				
				<input type="hidden" name="pid" prod="${prod.pid }">
				
				<h4 class="input-title">Product Name</h4><br>
				<input value="${prod.pname}" type="number" name="pName" required/><br> 
				
				<h4 class="input-title">Product Description</h4><br>
				<input value="${prod.Description}" type="text" name="pDescription" required/>
				
				<h4 class="input-title">Product price</h4><br>
				<input value="${prod.price}" type="number" name="pPrice" required/>
				
				<h4 class="input-title">Product stock</h4><br>
				<input value="${prod.stock}" type="number" name="pStock" required/>
				
				<div class="form-group">
				<table>
				<tr>
					<tb>Select Supplier</tb>
					<td>
					<select class="form-control" name="pSupplier" required>
					<option value="">---Select Supplier</option>
					<c:forEach items="${sList }" var="sat">
					<option value="${sat.sid}">${sat.supplierName }</option>
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
					<option value="${cat.cid}">${cat.cname}</option>
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