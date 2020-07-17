<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" defer></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lettering.js/0.6.1/jquery.lettering.min.js" defer></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/load.css">
    <script src="<%=request.getContextPath()%>/stock/js/load.js" defer></script>

</head>
<body class="load change" onload="myFunction()" >
<div id="loader">
    <div class="word">LOADING...</div>
    <div class="overlay"></div>
</div>
</body>

</html>