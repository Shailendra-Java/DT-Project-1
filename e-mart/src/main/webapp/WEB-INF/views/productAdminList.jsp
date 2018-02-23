<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
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
<div class="container">
<h2>Product List for Admin</h2>

<table class="table table-hover" id="apl" class="display" border="2" width="80" align="center">
<tr>
<th>Serial No</th>
<th>PID</th>
<th>Product Name</th>
<th>Product Supplier</th>
<th>Product Category</th>
<th>Description</th>
<th>Stock</th>
<th>Price</th>
<th>Image</th>
<th class="span2">Action</th>
</tr>

<c:if test="${empty prodList}">
<tr>
<td colspan="10" align="center">No record exists!!</td>
</tr>
</c:if>

<c:forEach var="p" varStatus="st" items="${prodList }">

<tr>
<td><c:out value="${st.count }"></c:out></td>
<td><c:out value="${p.productId }"></c:out></td>
<td><c:out value="${p.productName }"></c:out></td>
<td><c:out value="${p.supplier.supplierName }"></c:out></td>
<td><c:out value="${p.category.categoryName}"></c:out></td>
<td class="span3"><c:out value="${p.description}"></c:out></td>
<td><c:out value="${p.stock}"></c:out></td>
<td><c:out value="${p.price}"></c:out></td>

<td><img src="${pageContext.request.contextPath}/assets/images/${p.imgName}" height="50px" width="50px"></td>

<td class="span4">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>

<a class="btn btn-info" role="button" href="${contextRoot }/admin/updateProd?pid=${p.productId }">Edit</a>
<a class="btn btn-danger" role="button" href="${contextRoot }/admin/deleteProd?pid=${p.productId }">Delete</a>
</tr>

</c:forEach>
</table>
</div>


</body>
</html>