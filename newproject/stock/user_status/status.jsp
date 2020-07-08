<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>
<%--テスト用に各リクエストスコープの埋め込み --%>
<%

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<title>QUICK証券</title>

	<meta charset="Shift_JIS" lang="ja">

	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/top.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/highlight.js.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/swiper.min.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/style.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/sample.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/sample02.css">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/status.css">

	 <script src="<%=request.getContextPath()%>/stock/js/highlight.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/highlightjs-line-numbers.min.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/swiper.min.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/script.js"></script>
	 <script src="<%=request.getContextPath()%>/stock/js/table1.js"></script>
</head>


<body>
    <nav id="navigation">
      <div class="container">
        <ul class="navlinks">
          <li><a href="index.html">Homepage</a></li>
          <li><a href="index.html">About Us</a></li>
          <li><a href="index.html">Projects</a></li>
          <li><a href="index.html">The Team</a></li>
          <li><a href="index.html">Contacts</a></li>
        </ul>

      </div>

    </nav>

    <header id="heading">
      <div class="container text-center">
        <h1 class="title">QUICK証券</h1>

      </div>
    </header>

<section>
	<div class="wrapper">
        <!--for demo wrap-->
        <h1>Status Page</h1>
        <table class="rtable rtable--flip" >
		  <thead>
		    <tr>
		      <th>ユーザーID</th>
		      <th>口座残高</th>

		    </tr>
		  </thead>
 <%--     <% List<History> historyList = (List<History>)request.getAttribute("historyList");

            for(History hbean:historyList){
			%>

		 <tbody>
			<tr>
			<td><%=hbean.getId() %> </td>
            <td><%=hbean.getMoney() %>   </td>

            </tr>
			<%
            }
			%>
            </tbody> --%>
			<%
				User user=(User)session.getAttribute("user");
			%>

           <form action="<%=request.getContextPath()%>/logout" method="Post">
				<tbody>
				<tr>
				<td><%=user.getId() %>
				<td><%=user.getMoney() %>円 </td>

	          	</tbody>
			</form>
		</table>

          <table class="rtable" cellpadding="0" cellspacing="0" border="0">

          	<thead>
              <tr>
                <th>銘柄コード</th>
                <th>銘柄名</th>
                <th>所持数</th>
                <th>株資産</th>
                <th>日付</th>
              </tr>
            </thead>


            <%List<History> historyList = (List<History>)request.getAttribute("historyList");
            	SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
            for(History hbean:historyList){
			%>

		 <tbody>
			<tr>
			<td><%=hbean.getStockCode() %> </td>
            <td><%=hbean.getStockName() %>   </td>
            <td><%=hbean.getNumber() %> </td>
            <td><%=hbean.getNumber()*hbean.getClosingPrice() %> </td>
            <td><%=sdf.format(hbean.getSimulationDate()) %> </td>

            </tr>
			<%
            }
			%>
            </tbody>
          </table>
         </div>
      </section>


    <div id="footer">
      <div class="container">
        <p>Simple layout design for <a href="http://blog.teamtreehouse.com/">Treehouse Blog</a>.</p>
        <p>Feel free to download and use these codes for any basic template layout.</p>
        <p><small>Website code structured with <a href="https://twitter.github.io/bootstrap/">Twitter Bootstrap</a>. Background image credits to <a href="http://www.flickr.com/photos/fjolnir/2342246699/">Fjölnir Ásgeirsson</a>. Sample content via <a href="http://bluthipsum.com/">Bluth Ipsum</a>.</small></p>
      </div>
    </div>
</body>
</html>