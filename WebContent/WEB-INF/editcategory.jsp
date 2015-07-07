<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>LearningDiary:Edit_Category</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>

</head>
<body >
	<c:import url="/WEB-INF/navbar.jsp"></c:import>
	
	<div id="outerbody"> 
	
	<h2 style="text-align: left;color:blue;">Edit Category</h2>
	
		<form  action="editCategory" method = "post">
			<input type="hidden" name="action" value="edit-category">
			${error }
			<div class="form-group">
				<label>ID</label>
				<input class="form-control" style="width:500px; font-size: 20;" type="text" name="id" value="${category.id }" readonly ><br>
			</div>
			
			<div class="form-group">
				<label>Category Name</label>
				<input class="form-control" style="width:500px; font-size: 20;" type="text" name="name" value="${category.name }" required><br>
			</div>
			
			<label>&nbsp; </label>
			<input class="btn btn-primary" type="submit" value="Update Category" id="submit">		
			<a href="/LearningDiary/category" class="btn btn-primary">Cancel</a>
		</form>
	</div>

	<div>
	<%@ include file="/WEB-INF/footer.jsp" %>
	</div>
	

</body>
</html>