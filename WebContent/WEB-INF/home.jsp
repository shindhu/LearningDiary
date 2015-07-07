<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>


</head>
<body id="body_layout">

	<c:import url="/WEB-INF/navbar.jsp"></c:import>
	
	<div id="outerbody">
		welcome to the home page.
	</div>
	
	<div>
	<%@ include file="/WEB-INF/footer.jsp" %>
	</div>
	
</body>
</html>