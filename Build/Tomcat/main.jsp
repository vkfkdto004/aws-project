
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "javax.sql.*"%>
<%@ page import = "javax.naming.*"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.*" %>
	
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/assets/img/favicon.ico">
<title>Mediumish - A Medium style template by WowThemes.net</title>
<!-- Bootstrap core CSS -->
<link href="/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Fonts -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/assets/css/mediumish.css" rel="stylesheet">
</head>
<body>
	<!-- <% String url = "jdbc:mysql://t4-db-mysql.cr11ygywub5g.ap-northeast-2.rds.amazonaws.com:3306/reca3";
    	String username = "admin";
        String password = "rECA3333!";
    %> -->
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
    ArrayList<ArrayList<String>> restaurantsList = new ArrayList<>();
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		stmt = conn.createStatement();
		String sql = "SELECT * FROM restaurants";
		rs = stmt.executeQuery(sql);


        while (rs.next()) {
            String title = rs.getString("title"); 
            String psrc = rs.getString("psrc"); 
            String info = rs.getString("info"); 
            //배열에 추가함 
            ArrayList<String> data = new ArrayList<>();
            data.add(title);
            data.add(psrc);
            data.add(info);
            restaurantsList.add(data);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!-- Begin Nav
================================================== -->
<nav class="navbar navbar-toggleable-md navbar-light bg-white fixed-top mediumnavigation">
<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="container">
	<!-- Begin Logo -->
	<a class="navbar-brand" href="index.html">
	<img src="/assets/img/logo.png" alt="logo">
	</a>
	<!-- End Logo -->
	<div class="collapse navbar-collapse" id="navbarsExampleDefault">
		<!-- Begin Menu -->
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active">
			<!-- <a class="nav-link" href="index.html">Stories <span class="sr-only">(current)</span></a> -->
			</li>
			<li class="nav-item">
			<!-- <a class="nav-link" href="post.html">Post</a> -->
			</li>
			<!-- <li class="nav-item"> -->
			<!-- <a class="nav-link" href="author.html">Author</a> -->
			<!-- </li> -->
		</ul>

		<!-- End Menu -->
		<!-- Begin Search -->
		<form class="form-inline my-2 my-lg-0" action="/ex_jsp.jsp">
			<input class="form-control mr-sm-2" type="text" placeholder="Search">
			<span class="search-icon"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M20.067 18.933l-4.157-4.157a6 6 0 1 0-.884.884l4.157 4.157a.624.624 0 1 0 .884-.884zM6.5 11c0-2.62 2.13-4.75 4.75-4.75S16 8.38 16 11s-2.13 4.75-4.75 4.75S6.5 13.62 6.5 11z"></path></svg></span>
		</form> 
		<!-- End Search -->
	</div>
</div>
</nav>
<!-- End Nav
================================================== -->

<!-- Begin Site Title
================================================== -->
<div class="container">
	<div class="mainheading">
		<h1 class="sitetitle">ETL 학동역 맛집</h1>
		<p class="lead">
			
		</p>
		<ul>
		</ul>
	</div>
<!-- End Site Title
================================================== -->

	<!-- Begin Featured
	================================================== -->
	<section class="featured-posts">
	<div class="section-title">
		<h2><span></span></h2>
	</div>
	<div class="card-columns listfeaturedtag">

		<!-- begin post -->
		<div class="card">
			<div class="row">
				<div class="col-md-5 wrapthumbnail">
					<a>
						<% 
						if (restaurantsList != null && restaurantsList.size() > 0) {
							String imgsrc0 = restaurantsList.get(0).get(1);
						 %>
								<div class="thumbnail" style="background-image:url(<%= imgsrc0 %>);"></div>
						<%
						} else {
						%>
							 <p>No restaurants found.</p>
						<%
						}
						%>
					</a>
				</div>
				<div class="col-md-7">
					<div class="card-block">
						<h2 class="card-title"><a><%= restaurantsList.get(0).get(0) %></a></h2>
						<h4 class="card-text"><%= restaurantsList.get(0).get(2) %></h4>
						<div class="metafooter">
							<div class="wrapfooter">
								<span class="meta-footer-thumb">
								<!-- <a href="author.html"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a> -->
								</span>
								<span class="author-meta">
								<!-- <span class="post-name">Steve</a></span><br/> -->
								<span class="post-date">2023-07-26</span><span class="dot"></span>
								</span>
								<!-- <span class="post-read-more"><a href="post.html" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end post -->

		<!-- begin post -->
		<div class="card">
			<div class="row">
				<div class="col-md-5 wrapthumbnail">
					<a>
						<% 
						if (restaurantsList != null && restaurantsList.size() > 0) {
							String imgsrc1 = restaurantsList.get(1).get(1);
						 %>
								<div class="thumbnail" style="background-image:url(<%= imgsrc1 %>);"></div>
						<%
						} else {
						%>
							 <p>No restaurants found.</p>
						<%
						}
						%>
					</a>
				</div>
				<div class="col-md-7">
					<div class="card-block">
						<h2 class="card-title"><a><%= restaurantsList.get(1).get(0) %></a></h2>
						<h4 class="card-text"><%= restaurantsList.get(1).get(2) %></h4>
						<div class="metafooter">
							<div class="wrapfooter">
								<span class="meta-footer-thumb">
								<!-- <a href="author.html"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a> -->
								</span>
								<span class="author-meta">
								<!-- <span class="post-name">Steve</a></span><br/> -->
								<span class="post-date">2023-07-26</span><span class="dot"></span>
								</span>
								<!-- <span class="post-read-more"><a title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end post -->

		<!-- begin post -->
		<div class="card">
			<div class="row">
				<div class="col-md-5 wrapthumbnail">
					<a>
						<% 
						if (restaurantsList != null && restaurantsList.size() > 0) {
							String imgsrc2 = restaurantsList.get(2).get(1);
						 %>
								<div class="thumbnail" style="background-image:url(<%= imgsrc2 %>);"></div>
						<%
						} else {
						%>
							 <p>No restaurants found.</p>
						<%
						}
						%>
					</a>
				</div>
				<div class="col-md-7">
					<div class="card-block">
						<h2 class="card-title"><a><%= restaurantsList.get(2).get(0) %></a></h2>
						<h4 class="card-text"><%= restaurantsList.get(2).get(2) %></h4>
						<div class="metafooter">
							<div class="wrapfooter">
								<span class="meta-footer-thumb">
								<!-- <a href="author.html"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a> -->
								</span>
								<span class="author-meta">
								<!-- <span class="post-name">Steve</a></span><br/> -->
								<span class="post-date">2023-07-26</span><span class="dot"></span>
								</span>
								<!-- <span class="post-read-more"><a href="post.html" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end post -->

		<!-- begin post -->
		<div class="card">
			<div class="row">
				<div class="col-md-5 wrapthumbnail">
					<a>
						<% 
						if (restaurantsList != null && restaurantsList.size() > 0) {
							String imgsrc3 = restaurantsList.get(3).get(1);
						 %>
								<div class="thumbnail" style="background-image:url(<%= imgsrc3 %>);"></div>
						<%
						} else {
						%>
							 <p>No restaurants found.</p>
						<%
						}
						%>
					</a>
				</div>
				<div class="col-md-7">
					<div class="card-block">
						<h2 class="card-title"><a><%= restaurantsList.get(3).get(0) %></a></h2>
						<h4 class="card-text"><%= restaurantsList.get(3).get(2) %></h4>
						<div class="metafooter">
							<div class="wrapfooter">
								<span class="meta-footer-thumb">
								<!-- <a href="author.html"><img class="author-thumb" src="https://www.gravatar.com/avatar/e56154546cf4be74e393c62d1ae9f9d4?s=250&amp;d=mm&amp;r=x" alt="Sal"></a> -->
								</span>
								<span class="author-meta">
								<!-- <span class="post-name">Steve</a></span><br/> -->
								<span class="post-date">2023-07-26</span><span class="dot"></span>
								</span>
								<!-- <span class="post-read-more"><a href="post.html" title="Read Story"><svg class="svgIcon-use" width="25" height="25" viewbox="0 0 25 25"><path d="M19 6c0-1.1-.9-2-2-2H8c-1.1 0-2 .9-2 2v14.66h.012c.01.103.045.204.12.285a.5.5 0 0 0 .706.03L12.5 16.85l5.662 4.126a.508.508 0 0 0 .708-.03.5.5 0 0 0 .118-.285H19V6zm-6.838 9.97L7 19.636V6c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v13.637l-5.162-3.668a.49.49 0 0 0-.676 0z" fill-rule="evenodd"></path></svg></a></span> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end post -->

	</div>
	</section>
	
	<!-- End List Posts
	================================================== -->

	<!-- Begin Footer
	================================================== -->
	<div class="footer">
		<!-- <p class="pull-left">
			 Copyright &copy; 2017 Your Website Name
		</p> -->
		<p class="pull-right">
			<a target="_blank" href="https://www.eteverslearning.com/?ca1=A2&ca2=A220">ETEVERS</a>
		</p>
		<div class="clearfix">
		</div>
	</div>
	<!-- End Footer
	================================================== -->

</div>
<!-- /.container -->

<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/assets/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

