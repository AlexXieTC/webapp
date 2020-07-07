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
	 	 <link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/table1.css">

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
        <h1>QUICK証券</h1>
        <h4>But this is just a sample demo layout, don't get too excited!</h4>

      </div>
    </header>

<section>
        <!--for demo wrap-->
        <!-- <h1>Fixed Table header</h1> -->
        <div class="tbl-header">
          <table cellpadding="0" cellspacing="0" border="0">

          	<thead>
              <tr>
                <th>銘柄コード</th>
                <th>銘柄名</th>
                <th>日付</th>
                <th>始値</th>
                <th>終値</th>
                <th>出来高</th>
                <th>買い注文</th>
                <th>売り注文</th>
              </tr>
            </thead>
		          </table>
		                </div>
            <% List<Price> priceList = (List<Price>)request.getAttribute("priceList");
            	SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
            for(Price pbean:priceList){
			%>



        <div class="tbl-content">
          <table cellpadding="0" cellspacing="0" border="0">

		 <tbody>
			<tr>
			<td align="right"><%=pbean.getStockCode() %> </td>
			<td><%=pbean.getStockName() %> </td>
            <td><%=sdf.format(pbean.getDate()) %> </td>
            <td><%=pbean.getOpenPrice() %>   </td>
            <td><%=pbean.getClosingPrice() %> </td>
            <td><%=pbean.getVolume() %>  </td>
            <form action="<%=request.getContextPath() %>/buysellaction" method="post">
            	<input type="hidden" value =<%=pbean.getStockCode() %> name="stock_code">
	            <td><input type="submit"value="BUY"  name="button"/></td>
	            <td><input type="submit"value="SELL" name="button"/></td>
       	        <td><a href="<%= request.getContextPath()%>/buysellaction">リンク</a></td>
            </form>
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