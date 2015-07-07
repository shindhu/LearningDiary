<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Sign Up</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>

</head>
<body>
	<c:import url="/WEB-INF/navbar.jsp" />

	<div class="row"  >
		<div class="col-md-4"></div>
		<div class="col-md-4" style="border: thick;" id="outerbody">
			<h3 style="text-align: left; color: blue;">Sign Up</h3>

			<p style="color: red">${error }</p>
			<p style="color: red">${error_username }</p>
			<form action="SignupServlet" method="post"
				onsubmit="return checkEmail();" >
				<input type="hidden" name="action" value="signup">

				<div class="form-group">
					<label>Username</label> <input class="form-control"
						style="width: 300px; font-size: 20;" type="text" name="username"
						required placeholder="Enter username">
				</div>

				<div class="form-group">
					<label>Password</label> <input class="form-control"
						style="width: 300px; font-size: 20;" type="password"
						name="password" required placeholder="Enter password">
				</div>

				<div class="form-group">
					<label>Verify Password</label> <input class="form-control"
						style="width: 300px; font-size: 20;" type="password"
						name="verify_password" required placeholder="Retype password">
				</div>

				<div class="form-group">
					<label>Email</label> <input class="form-control"
						style="width: 500px; font-size: 20;" type="email" name="email"
						onchange="checkEmail();" id="email" required
						placeholder="Enter email"> <br>
				</div>

				<div class="form-group">
					<label>&nbsp;</label> <input class="btn btn-primary active"
						type="submit" value="Sign Up" id="submit">
				</div>
			</form>
		</div>
		<div class="col-md-4"></div>

	</div>

	<div>
		<%@ include file="/WEB-INF/footer.jsp"%>
	</div>

	<script>
		function checkEmail() {
			var email = document.getElementById('email');
			var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

			if (!filter.test(email.value)) {
				alert('Please provide a valid email address');
				email.focus;
				return false;
			}
		}
	</script>


</body>
</html>