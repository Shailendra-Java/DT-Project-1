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
</head>
<body>
<div>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</div>
<div class = "container">
<div class = "row">
<div class = "col-xs-6" jumbotron>
<div class = "head">
<lable>Customer shipping details</lable>
</div>
<div class = "outer">
<div class = "well" style="width:100%">
<form action="${pageContext.request.contextPath }/invoiceprocess" method = "post">
<c:set var = "gtot" value = "0"></c:set>
<c:forEach var = "c" items = "${cart  }">
<c:set var = "gtot" value = "${gtot+ c.price*c.qty }"></c:set>
</c:forEach>
<div class = "well">
<table>
<tr>
<td colspan = "3">Name</td><td>${user.name }</td>
</tr>
<tr>
<td colspan = "3">Email</td><td>${user.email }</td>
</tr>
<tr>
<td colspan = "3">Address</td><td>${user.address }</td>
</tr>
<tr>
<td colspan = "3">Phone</td><td>${user.phone }</td>
</tr>
</table>
<div class = "outer">
<h3>Enter Payment Details</h3>
<br>
<lable>Select payment</lable>
<select name = "Payment">
<option value = "COD">cash on delivery</option>
<option value = "Net">Net Banking</option>
</select><br><br>
<div>
Name:<input type = "text" name = "name on card">
Card number:<input type = "number" name = "card number">
<input type = "hidden" name = "total" value = "${gtot }">
</div>
</div>
<input type = "submit" value = "PROCEED" style = "width:75%" class = "btn btn-danger"> 
</div>
</form>
</div>
</div>
</div>
</div>


</body>
</html>