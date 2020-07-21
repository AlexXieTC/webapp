
<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%@ page import="bean.*" %>
<%@ page import="java.sql.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <title>売却エラー</title>
  <link rel="stylesheet" href="./stock/css/top.css">
  <%@ include file="../stocklistheader.jsp" %>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/purchase.css">


<%-- ここから本文 --%>


    <div id="main-content">
		<div align="center">
		<h3>株を所持していません。</h3>

		<br><br>
<a href="<%=request.getContextPath() %>/showinfo" class="btn btn-primary">戻る</a>

		</div>
    </div><!-- @end #main-content -->


    <%@ include file="../footer/subfooter.jsp" %>
</body>
</html>