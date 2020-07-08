
<%@ page import="java.sql.*, database.*, java.util.*, java.text.SimpleDateFormat,bean.* "
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

	<title>QUICK証券</title>
<%
	User user=(User)session.getAttribute("user");
%>


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
          <li><a href="<%=request.getContextPath()%>/status"/>User Status</a></li>
          <li><a href="index.html">Projects</a></li>
          <li><a href="index.html">The Team</a></li>
          <li><a href="index.html">Contacts</a></li>
                    <li><form action="<%=request.getContextPath() %>/renewconfirmation" method="post">
          <input type="submit" value="次の日に進む"/>
          </form></li>
        </ul>

        <div class ="AfterloginForm">
		<form action="<%=request.getContextPath()%>/logout" method="Post">

				ユーザーID：<%=user.getId() %>
				日付：<%=user.getSimulationDate() %>
			    所持金：<%=user.getMoney() %>円
          		<input  type="submit" onclick="location.href='<%=request.getContextPath() %>/signup'" value="Log out">
		</form>
        </div>
      </div>
    </nav>

    <header id="heading">
      <div class="container text-center">
        <h1>QUICK証券</h1>
        <br><br><br><br><br><br><br><br>
        <h4>But this is just a sample demo layout, don't get too excited!</h4>

      </div>
    </header>


	<div class="l-wrapper">
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
            </form>
            </tr>
			<%
            }
			%>
            </tbody>
          </table>
        </div>
      </section>


        <h2>SNES in Dribbble Shots</h2>
        <div class="alert alert-info">
          <strong>Note:</strong> Each shot is linked to the original source.
        </div>

        <div class="row-fluid">
          <ul class="thumbnails">
            <li class="span4">
              <a href="http://dribbble.com/shots/39065-snes-controller" class="thumbnail" target="_blank">
              <img src="https://i.imgur.com/Q4bxBmd.png" alt="snes controller dribbble shot">
              </a>
            </li>
            <li class="span4">
              <a href="http://dribbble.com/shots/525128-Micons-Series-2-SNES" class="thumbnail" target="_blank">
              <img src="https://i.imgur.com/uQLkghZ.png" alt="minicon series2 snes console">
              </a>
            </li>
            <li class="span4">
              <a href="http://dribbble.com/shots/633186-The-Game" class="thumbnail" target="_blank">
              <img src="https://i.imgur.com/vLg6MDV.png" alt="snes video game cartridge shot">
              </a>
            </li>
          </ul>
        </div><!-- @end .row-fluid -->

        <div class="row-fluid">
          <ul class="thumbnails">
            <li class="span6">
              <a href="http://dribbble.com/shots/758735-Oh-Oh-Please-Amaze-Me-Detail-IV" class="thumbnail" target="_blank">
              <img src="https://i.imgur.com/SS8Kiln.png" alt="dribbble shots super nintendo">
              </a>
            </li>
            <li class="span6">
              <a href="http://dribbble.com/shots/436565-Jaku-Console-Wars" class="thumbnail" target="_blank">
              <img src="https://i.imgur.com/y3M2d7p.png" align="dribbble console wars super nintendo design">
              </a>
            </li>
          </ul>
        </div><!-- @end .row-fluid -->

        <hr>
      </div><!-- @end .container -->
    </div><!-- @end #main-content -->



    <div id="footer">
      <div class="container">
        <p>Simple layout design for <a href="http://blog.teamtreehouse.com/">Treehouse Blog</a>.</p>
        <p>Feel free to download and use these codes for any basic template layout.</p>
        <p><small>Website code structured with <a href="https://twitter.github.io/bootstrap/">Twitter Bootstrap</a>. Background image credits to <a href="http://www.flickr.com/photos/fjolnir/2342246699/">Fjölnir Ásgeirsson</a>. Sample content via <a href="http://bluthipsum.com/">Bluth Ipsum</a>.</small></p>
      </div>
    </div>


</p>
</body>
</html>