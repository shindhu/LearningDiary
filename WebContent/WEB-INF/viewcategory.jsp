<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>LearningDiary Category</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>
</head>
<body>

	<c:import url="/WEB-INF/navbar.jsp"></c:import>

	<div class="table-responsive" id="outerbody"  >
		<p style="color: red">${error_delete }</p>
		<a class="btn btn-lg" href="/LearningDiary/addCategory?user_id=${user_id }" style="color: blue; font-weight: bold;">Add Category</a>
		<table class="table table-hover" style="width: 45%">   
			<tr>
				<!-- <th style="width: 10%">ID</th> -->
				<th style="text-align: left;">Category</th>
				<th >Count</th>
				<th >Edit</th>
				<th >Delete</th>
				<th>Add Book</th>
			</tr>
			<c:forEach items="${categoryList }" var="category">
				<tr>
					<%-- <td>${category.id }</td> --%>
					<td style="text-align: left;"><a href="booksByCategory?category_id=${category.id}">${category.name }</a></td>
					<td>${category.bookcounts }</td>
					<td><a class="btn btn-warning btn-md"
						href="editCategory?id=${category.id }"> Edit </a></td>
					<td>
						<form action="deleteCategory" method="post">
							<input type="hidden" name="id" value="${category.id }"> 
							<input class="btn btn-danger btn-sm" type="submit" value="Delete"
								id="submit">
						</form>
					</td>
					<td><a class="btn btn-info btn-md" href="/LearningDiary/addBookByCategory?category_id=${category.id }" >Add Book</a></td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
	<br><br><br><br><br>
	<div id="footer" >
		<%@ include file="/WEB-INF/footer.jsp"%>
	</div>

</body>
</html>