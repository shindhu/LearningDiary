<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>LearningDiary UserBooks</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>
</head>

<body>
	<c:import url="/WEB-INF/navbar.jsp"></c:import>

	<div class="table-responsive" id="outerbody">
		<a href="/LearningDiary/users" style="color: blue; font-style: italic;">Back to users</a>
		
		<table class="table table-bordered">
			<tr style="text-align: justify; ">
				<th style="width:5%">ID</th>
				<th>User_ID</th>
				<th>Image</th>
				<th style="width:15%; text-align: left">Title</th>
				<th>Book_Format</th>
				<th style="width:70%">Notes</th>
				
			</tr>

			<%-- <c:out value="${ userBooks}"></c:out> --%>
			<c:forEach items="${userBooks }" var="userBook">
				<tr>
					<td>${userBook.id }</td>
					<td>${userBook.user_id}</td>
					<td><img src="${userBook.image }" height=100 width=100 /></td>
					<td  style="text-align: left;">${userBook.name }</td>
					<td>${userBook.book_format }</td>
					<td style="text-align: justify;">${userBook.notes }</td>
					
				</tr>
			</c:forEach>
		</table>
		<a href="/LearningDiary/users" style="color: blue; font-style: italic;">Back to users</a>
	</div>
		
	<div id="footer" style="position: relative;">
	<%@ include file="/WEB-INF/footer.jsp" %>
	</div>
	</body>
</html>



<!-- its optional to have the select books by id and name
		<form action="/LearningDiary/books" method="get">
			<select name="order">
				<option value="id">Order By ID</option>
				<option value="name">Order By Name</option>
			</select>
			<input type="submit" value="submit ">
		</form> -->
		<!-- style="position: fixed; background-color: grey;" -->