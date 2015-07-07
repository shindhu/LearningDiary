<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>BookByCategory</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>
<style>
#category_name {
	text-align: center;
	color: red;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/navbar.jsp"></c:import>
	<div class="table-responsive" id="outerbody">
		<a href="/LearningDiary/category" style="color: blue;" ><span class="glyphicon glyphicon-arrow-left" style="size: large;"></span></a> 
		 <a class="btn btn-lg" href="/LearningDiary/addBookByCategory?category_id=${categories.id }" style="color:blue; font-weight: bold;">Add Book</a>
		
		<h3 id="category_name">${categories.name }</h3> 
		${error_delete } 
		<table class="table table-bordered">
			<tr>
				<th style="width: 5%">ID</th>
				<th>Image</th>
				<th style="width: 10%">Title</th>
				<th style="width: 5%">Book Format</th>
				<th>Notes</th>
				<th>Edit</th>
				<th>Delete</th>

			</tr>

			<%--<c:out value="${theBooksByCategory }"> </c:out> --%>
			<c:forEach items="${theBooksByCategory }" var="book">
				<tr>
					<td>${book.id }</td>
					<td><img src="${book.image }" height=100 width=100 /></td>
					<td>${book.name }</td>
					<td>${book.book_format }</td>
					<td style="text-align: justify;">${book.notes }</td>
					<td style="width:100px">
					<a class="btn btn-warning btn-md" href="editBook?id=${book.id }"> Edit </a></td>
				<td>
					<form action="deleteBook" method="post">
						<input type="hidden" name="id" value="${book.id }">
						<input type="hidden" name="category_id" value="${book.category_id }">
						<input class="btn btn-danger btn-sm" type="submit" value="Delete" id="submit">
					</form>
				</td>
				</tr>
			</c:forEach>

		</table>
		<a href="/LearningDiary/category"
			style="color: blue; font-style: italic;">Back to Category</a>

	</div>

	<div id="footer" style="position: relative;">
		<%@ include file="/WEB-INF/footer.jsp"%>
	</div>

</body>
</html>