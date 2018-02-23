<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>Home page</title>
  <style type="text/css">
  	.container
  	{
  		min-width:100%;
  		min-height:490px;
  	}
  </style>
</head>
<body>
<div>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</div>
<div style="width: 100%; height:70px;"></div>
<div class="container">
<table class="table table-hover" id="apl" class="display" border="2" width="80" align="center">
<tr>
<th>Product Name</th>
<th>Product Quantity</th>
<th>Product Price</th>
<th>Product Image</th>
<th>Sub_Total</th>
<th class="span2">Action</th>
</tr>

<c:if test="${empty cartInfo}">
<tr>
<td colspan="10" align="center">No record exists!!</td>
</tr>
</c:if>

<c:forEach var="p" varStatus="st" items="${cartInfo }">

<tr>
<td><c:out value="${p.cartProductName }"></c:out></td>
<td><c:out value="${p.cartStock }"></c:out></td>
<td><c:out value="${p.cartPrice}"></c:out></td>
<td><img src="${pageContext.request.contextPath}/assets/images/${p.cartImage}" height="50" width="50"></td>
<td><c:out value="${p.cartStock*p.cartPrice  }"></c:out></td>
<td class = "span2">
<c:set var = "contextRoot" value = "${pageContext.request.contextPath }"></c:set>
<a class = "btn btn-danger" role = "button" href = "<c:url value="/deletePCart/${p.cartId }" />">Delete</a>
</td>

</tr>
<tr>
<td align="right" colspan="6">
<span class = "col-lg-9" align = "right"><b>Grand Total: </b><b><c:out value="${p.cartStock*p.cartPrice  }"></c:out></b></span>
</td>
</tr>
</c:forEach>
<tfoot>
<tr>
<td>
<a class = "btn btn-warning btn-lg" href = "${pageContext.request.contextPath }/index">Continue shopping</a>
</td>
<td>
<a class = "btn btn-sucess btn-lg" href = "${pageContext.request.contextPath }/checkout">Checkout</a>
</td>
</tr>
</tfoot>
</table>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>