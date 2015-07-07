<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

 <!-- <img src="images/blueimage.jpg" style="height: 10%; width:100%; text">    --> 
	<nav class="navbar navbar-default navbar-fixed-top" style="background-image: url('images/blueimage.jpg'); height: 100px; width:100%" >
		<div class="container-fluid">
	
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-9">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<br><br>
				<a class="navbar-brand" 
					style="font-size: x-large;font-stretch:extra-expanded; color: white; font-weight: bolder;">
					LearningDiary</a>
			</div>
	
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-9" >
				
				
					
					<br><br>
					<ul class="nav navbar-nav navbar-left" style="font-size: medium;">
						<li><a href="/LearningDiary/index" style="color: white;"><span
								class="glyphicon glyphicon-home"></span></a></li>
						<li><a href="/LearningDiary/about" style="color: white;">About</a></li>
						<li><a href="/LearningDiary/contact" style="color: white;" >Contact Us</a></li>
					</ul> 
					<c:if test="${(isLoggedIn == false) or (empty isLoggedIn) }">
						
						<ul class="nav navbar-nav navbar-right" style="font-size: medium;">
							<li><a href="/LearningDiary/signup" style="color: white"><span
									class="glyphicon glyphicon-user"></span> Sign Up </a></li>
							<li><a href="/LearningDiary/login" style="color: white;"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
	
						</ul>
					</c:if> 
					
					<c:if test="${isLoggedIn == true}">
						<c:choose>
							<c:when test="${ user_id == 1 }">
								<ul class="nav navbar-nav navbar-left" style="font-size: medium;">
									<li><a href="/LearningDiary/users" style="color: white;">Users</a></li>
								</ul>
								<ul class="nav navbar-nav navbar-right" style="font-size: medium;">
									<li><a style="color:white">Logged in as ${capName }, id: ${user_id } </a></li>
									<li><a href="/LearningDiary/logout" style="color: white;">
									<span class="glyphicon glyphicon-log-out"></span> Log Out </a></li>
								</ul>
								
							</c:when>
							<c:otherwise>
								<ul class="nav navbar-nav navbar-left" style="font-size: medium;">
									<li><a href="/LearningDiary/category" style="color: white;">Category</a></li>
									<li><a href="/LearningDiary/books" style="color: white;">Books</a></li>
									<li>
										<form action = "/LearningDiary/booksByKeyword" class="navbar-form navbar-left" name="search" method="get">
											<div class="form-group">
												<input name="name" value="${param.name }" type="text" style="width: 500px; font-size: medium;"class="form-control" placeholder="Search">
												<select name="search">
													<option value="name">Find By Title</option>
													<option value="notes">Find By Notes</option>
												</select>
												<input class="btn btn-default btn-md" type="submit" value="search ">
												
											</div>
											<!-- <button type="submit" class="btn btn-default">search</button> -->
										</form>
									</li>
								</ul>
								<ul class="nav navbar-nav navbar-right" style="font-size: medium; color:white;">
									<li><a style="color:white"> Logged in as ${capName }<%-- , id: ${user_id } --%> </a></li>
									<li><a href="/LearningDiary/logout" style="color: white;">
									<span class="glyphicon glyphicon-log-out"></span> Log Out </a></li>
								</ul>
								</c:otherwise>
						</c:choose>
					</c:if>
					
					<%-- 
					<c:if test="${isLoggedIn == true}">
						<ul class="nav navbar-nav navbar-left" style="font-size: medium;">
							<li><a href="/LearningDiary/category" style="color: black;">Category</a></li>
							<li><a href="/LearningDiary/books" style="color: black;">Books</a></li>
							<li><a href="/LearningDiary/users" style="color: black;">Users</a></li>
						</ul>
						
						<ul class="nav navbar-nav navbar-right" style="font-size: medium;">
							<li> <a>Logged in as ${capName }, id: ${user_id } </a></li>
							<li><a href="/LearningDiary/logout" style="color: red;">
							<span class="glyphicon glyphicon-log-out"></span> Log Out </a></li>
						</ul>
					</c:if>
					 --%>
					
				
			</div>
	
		</div>
	</nav>

<!-- <div class="form-horizontal">
		<br><br>
		<form action="" method="get">
			<input type="text" name="search"  placeholder="book u are looking for ?" style="width:500px">
			<input type="submit" name="submit" value="Search">
		</form>
	</div> -->

<!-- <form action = "/LearningDiary/booksByKeyword" class="navbar-form navbar-left" name="search" action="get">
						<div class="form-group">
							<input type="text" style="width: 500px"class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">search</button>
					</form> -->
					
					
					
					
					