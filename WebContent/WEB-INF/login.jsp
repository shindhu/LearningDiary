<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Login</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>

</head>
<body>
	<c:import url="/WEB-INF/navbar.jsp" />
	
	
	<!-- <div id="outerbody" style="border:none; " > -->
		<div class="col-md-4"> </div>
		
		<div class="col-md-4" style="border: thick;" id="outerbody">
			<h3 style="text-align: left;color:blue;">Login</h3>
			<p style="color:red">${error }</p>
			
			<form  action="/LearningDiary/login" method="post" >
				<input type="hidden" name="action" value="login">
				<div class="form-group">
					<label><span>Username</span></label> <input class="form-control"
						style="height: 45px; width: 300px; font-size: 20;" type="text" name="username" required placeholder="username">
				</div>
				<div class="form-group">
					<label>Password</label> <input class="form-control"
						style="height: 45px;width: 300px; font-size: 20;" type="password" name="password" required placeholder="password">
				</div>
				<div class="form-group">
					<label>&nbsp;</label> <input class="btn btn-primary btn-md" style=" height: 45px;width:280px; "
						type="submit" value="Login" id="submit">
				</div>
			</form>
			<p>New User? <a href="/LearningDiary/signup" style="color:red;"><i>Please Register Here</i></a></p>
		</div>
	
		<div class="col-md-4"></div>
	<!-- 	</div> -->
	
	<br><br><br><br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="/WEB-INF/footer.jsp" %>
	</div>
</body>
</html>