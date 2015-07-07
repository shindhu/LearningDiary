<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>User LoggedIn Main Page</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>

</head>
<body id="body_layout">

	<c:import url="/WEB-INF/navbar.jsp">
	</c:import>
	<div id="outerbody" style="border: none;">
		<br>
		<p style="text-align: left; color: blue;">&nbsp;Welcome to
			LearningDiary, ${capName }.</p>

		<%-- <c:param name= "isLoggedIn" value="${isLoggedIn }"></c:param>
				
			<c:if test="${sessionScope.isLoggedIn == true }">
				<p class="alert alert-success" role="alert">Logged In! </p>
			</c:if>	
			 --%>
		<p>
			&nbsp;Your id: ${id }<br> &nbsp;Email: ${email }
		</p>
	</div>

	<div>
	<%@ include file="/WEB-INF/footer.jsp" %>
	</div>
</body>
</html>