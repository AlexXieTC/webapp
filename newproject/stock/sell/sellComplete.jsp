<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./stock/css/top.css">
<title>売却処理完了</title>
 <%@ include file="../stocklistheader.jsp" %>


	<div align="center">

		<h3 style="margin-top:20px;">売却処理に成功しました</h3>
		<br>
		<form action="<%=request.getContextPath() %>/showinfo" method="post">
			<input type="submit"class="btn btn-primary" style="cursor:pointer" value="トップへ戻る">
		</form>
	</div>
<br><br>

	<%@ include file="../stocklistfooter.jsp" %>
</body>
</html>