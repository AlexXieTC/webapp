<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" lang="ja">
  <link rel="stylesheet" href="./stock/css/top.css">
  <title>テンプレ作成</title>
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
        <div class ="loginForm">
			<form method="post" action="<%=request.getContextPath() %>" class ="loginInput">
				User ID <input type="text" name="userID"><br>
				Password<input type="password">
          		<input type="submit" value="Log in">
			</form>
        </div>
      </div>

    </nav>

    <header id="heading">
      <div class="container text-center">
        <h1>Super Nintendo Rocks</h1>
        <h4>But this is just a sample demo layout, don't get too excited!</h4>

        <p><a href="index.html" class="btn btn-large btn-inverse">Check out our features</a></p>
      </div>
    </header>

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
        </div><!-- @end .row -->

        <hr>

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
</body>
</html>