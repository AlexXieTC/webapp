<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
contentType="text/html; charset=Shift_JIS" pageEncoding="UTF-8"%>


<%@ include file="stocklistheader.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/table1.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/stock/css/colorChange.css">
<script src="<%=request.getContextPath()%>/stock/js/colorChange.js"></script>



	<body>


	<div class="l-wrapper">
			<h1 align="center">${(empty alertMessage)? "":alertMessage}</h1>
	  <div class="c-container">
	    <div class="sample sample02">
	      <div class="swiper-container">
	        <div class="swiper-wrapper">
	          <div class="swiper-slide">
	            <div class="sample02-inner">


					<% List<News> newsList = (List<News>)request.getAttribute("newsList");


						SimpleDateFormat sdf1 = new SimpleDateFormat("MM月dd日");
						News nbean0=newsList.get(0);%>

					<p>[<%=nbean0.getStockCode()%>]  <%=sdf1.format(nbean0.getNewsDate())%> <b> <%=nbean0.getTitle()%> </b></p>
	            </div>

	          </div>
	        <div class="swiper-slide">
	            <div class="sample02-inner">
	             <%News nbean1=newsList.get(1);%>
				<p>[<%=nbean1.getStockCode()%>]  <%=sdf1.format(nbean1.getNewsDate())%>	<b><%=nbean1.getTitle()%></b></p>
	            </div>
	          </div>


	        <div class="swiper-slide">
	            <div class="sample02-inner">
	            <%News nbean2=newsList.get(2);%>
				<p>[<%=nbean2.getStockCode()%>]	<%=sdf1.format(nbean2.getNewsDate())%>	<b><%=nbean2.getTitle()%></b></p>
	            </div>
	          </div>

	        </div>

	        <div class="swiper-button-prev">
	          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 27 44">
	            <path class="c-arrow c-arrow-prev" d="M0,22L22,0l2.1,2.1L4.2,22l19.9,19.9L22,44L0,22L0,22L0,22z" />
	          </svg>
	        </div>
	        <div class="swiper-button-next">
	          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 27 44">
	            <path class="c-arrow c-arrow-next" d="M27,22L27,22L5,44l-2.1-2.1L22.8,22L2.9,2.1L5,0L27,22L27,22z" />
	          </svg>
	        </div>

	        <div class="swiper-pagination"></div>
	      </div>
	    </div><!-- .sample -->



	  </div><!-- .c-container -->
	</div><!-- .l-wrapper -->



<!--
    <div id="main-content">
      <div class="container">
         <div class="row">
           <div class="span4">
             <h2>Our Products</h2>
             <p>Oh…yeah…the guy in the…the $4,000 suit is holding the elevator for a guy who doesn't make that in three months. Come on! Speaking of settling, how's Ann? He's a regular Freddie Wilson, that one.</p>
             <p class="text-center"><a class="btn" href="index.html">Read more</a></p>
           </div>

           <div class="span4">
             <h2>We Love You! <small>so much</small></h2>
             <p>I mean, it's one banana, Michael. What could it cost, ten dollars? It's sort of like going from prime rib to… I don't know… weird brother of prime rib. I hear the jury's still out on science. <strong>Check out banner, Michael!</strong></p>
             <p class="text-center"><a class="btn btn-primary" href="index.html">Primary button</a></p>
           </div>

           <div class="span4">
             <h2>Headline Here</h2>
             <p>Obviously this blue part here is the land. Let the great experiment begin! But I'm the oldest. The matriarch if you will. She's always got to wedge herself in the middle of us so that she can control everything. Yeah. Mom's awesome. Maybe we should call her?</p>
             <p class="text-center"><a class="btn" href="index.html">Read more</a></p>
           </div>
        </div>@end .row -->

        <hr>

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
                <th>前日比</th>
                <th>買い注文</th>
                <th>売り注文</th>
              </tr>
            </thead>
		          </table>
		                </div>
            <% List<Price> priceList = (List<Price>)request.getAttribute("priceList");

        		List<Price> dateList = (List<Price>)request.getAttribute("dateList");

            	SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");

            for(int i =0;i<dateList.size();i++){
            	 Price pbean = priceList.get(i);
            	 Price yesterdaybean=  dateList.get(i);
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
            <td name="num"><%=yesterdaybean.getClosingPrice()-(pbean.getClosingPrice()) %> </td>

			<form action="<%=request.getContextPath() %>/buysellaction" method="post">
            	<input type="hidden" value =<%=pbean.getStockCode() %> name="stock_code">
	            <td><input type="submit"value="BUY"  name="button"/></td>
	            <td><input type="submit"value="SELL" name="button"/></td>
            </form>
            </tr>
            </tbody>


			<%
            }
			%>

			</table>
			</div>

      </section>

      <%@ include file="stocklistfooter.jsp" %>


</p>
</body>
</html>