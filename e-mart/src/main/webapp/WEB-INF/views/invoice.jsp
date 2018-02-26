<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>e-mart</title>
	<style type="text/css">
  	.col-xs-6-custom {
    	width: 40%;
    	margin-left: 28%;
    	margin-right: 28%;
    }
  	.container
  	{
  		min-width:100%;
  		min-height:490px;
  	}
  </style>
</head>
<body style="background-image: url('${pageContext.request.contextPath }/assets/images/pay.jpg')">
<div>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</div>
<div style="width: 100%; height:70px;"></div>
	<div class = "outer">
		<div class = "well" style="width:100%">
			<form action="${pageContext.request.contextPath }/orderprocess" method = "post">
				
				<div class = "well">
					<table style="text-align: left; width: 350px;">
						<tr>
							<td colspan = "3"><b>Name    : </b></td><td>${user.name }</td>
						</tr>
						<tr>
							<td colspan = "3"><b>Email   : </b></td><td>${user.email }</td>
						</tr>
						<tr>
							<td colspan = "3"><b></>Address : </b></td><td>${user.address }</td>
						</tr>
						<tr>
							<td colspan = "3"><b>Phone   : </b></td><td>${user.phone }</td>
						</tr>
						<tr>
							<td colspan = "3"><b>Total   : </b></td><td>${order.total }</td>
						</tr>
						<tr>
							<td colspan = "3"><b>Payment Mode   : </b></td><td>${order.payment }</td>
						</tr>
					</table>
				</div>
				<input type = "submit" value = "OK" style="width: 100%" class = "btn btn-success">
				</form>
				</div>
			</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>