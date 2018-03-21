<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  	.container{min-height: 490px;}
  </style>
</head>
<body style="background: bisque;color: brown;">
<div>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</div>
<div style="width: 100%; height:70px;"></div>
<div class="container">
    <div class="row">
    <center><div class="error-template">
	    <h1 style="font-size: 130px;">Oops!</h1>
	    <h2 style="font-size: 85px;">Access Denied</h2>
	    <div class="error-details" style="font-size: 30px;">
		Sorry, an error has occured, Requested page not accessible!<br>
	    </div>
	    <div class="error-actions">
		<a href="${pageContext.request.contextPath }/index" class="btn btn-danger">
		    <i class="icon-home icon-white"></i> Take Me Home </a>
	    </div>
	</div></center>
    </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>