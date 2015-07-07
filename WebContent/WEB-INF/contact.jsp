<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LearningDiary Contact</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>
</head>

<body>
	<c:import url="/WEB-INF/navbar.jsp"></c:import>
	<div id="outerbody"  style="border: none;">
		<div class="col-sm-6">
			<h3 style="color:blue">About Me</h3>
			<p>
				Thank you for visiting my Webpage. 
				My name is Shindhu (prounounced 'Sindhu' ...h silent).<br> 
				I graduated with Bachelors degree in Information Technology from Anna University back in 2007 and
				recently pursued Certification in Java Development Series from Austin Community College (ACC).
			</p>
		</div>
		<div class="col-sm-6">
			<h3 style="color: blue; ">Contact us</h3>
			
			<p style="font-size: 20;"> Got a question ? Got a suggestion ?<br>
			 <span class="glyphicon glyphicon-earphone" style="color: red"></span> 512-431-5668 or <br>
			 <span class="glyphicon glyphicon-envelope" style="color: red"></span> mp.shindhu@gmail.com<br>
			<!-- Please submit your contact information and I will be in touch shortly. -->
			</p>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br>
	<div id="footer">
	<%@ include file="/WEB-INF/footer.jsp" %>
	</div>
	
</body>
</html>



<!--  <form  action="mailto:mp.shindhu@gmail.com" method="POST" enctype="text/plain">
					<div class="form-group">
						<label for="name">Your name:</label><br /> 
						<input id="name" class="input" name="name" type="text" value="" size="30" /><br />
					</div>
					
					<div class="form-group">
						<label for="email">Your email:</label><br /> 
						<input id="email" class="input" name="email" type="text" value="" size="30" /><br />
					</div>
					
					<div class="form-group">
						<label for="message">Your message:</label><br />
						<textarea id="message" class="input" name="message" rows="4" cols="50"></textarea>
						<br />
					</div>
					<input id="submit_button" type="submit" value="send message" />
				</form> 
			</div>
		</div>	 -->		