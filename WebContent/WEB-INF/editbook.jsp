<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<title>LearningDiary: Edit Book</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>

</head>
<body  >
	<c:import url="/WEB-INF/navbar.jsp"></c:import>
	
		${error_update }
		<form action="editBook" method = "post">
			<input type="hidden" name="action" value="edit-book">
		<div id="outerbody" class="row">
		<div class="col-md-5" >	
			<h2 style="text-align: left; color:blue">Edit Book</h2>
			<div class="form-group">
				<label>ID</label>
				<input class="form-control" style="width:500px; font-size: 20;" type="text" name="id" value="${book.id }" readonly><br>
				
			</div>
			
			<div class="form-group">
				<label>Category ID</label>
				<input class="form-control" style="width:500px;font-size: small;" type="text" name="category_id" value="${book.category_id }" readonly><br>
				<%-- <select name="category_id">
					<c:forEach items="${categories }" var="category">
						<option value="${category.id }"> ${category.id }. ${category.name }</option> 
					</c:forEach>
				</select> --%>
			</div>
			
			<div class="from-group">	
				<label>Image</label>
				<input class="form-control" style="width:500px;font-size: 20;" type="text" name="image" value="${book.image }" ><br>
			</div>
			
			<div class="from-group">	
				<label>Title</label>
				<input class="form-control" style="width:500px;font-size: 20;" type="text" name="name" value="${book.name }" required ><br>
			</div>
			
			<div class="from-group" >	
				<label>Book Format</label>
				<input class="form-control" style="width:500px;font-size: 20;" type="text" name="book_format" value="${book.book_format }" ><br>
			</div>
		</div>
		<div class="col-md-7">
			<br><br>
			<div class="from-group">	
				<label>Notes</label>
				<textarea class="form-control" rows="12"  name="notes" style="font-size: 20;"> ${book.notes }</textarea><br>
			</div>
			
			<label>&nbsp; </label>
			<input class="btn btn-primary" type="submit" value="Update Book" id="submit">
			<a href="/LearningDiary/booksByCategory?category_id=${book.category_id }" class="btn btn-primary">Cancel</a>		
		</div>
		</div>
		</form>
	
	<div id="footer" >
	<%@ include file="/WEB-INF/footer.jsp" %>
	</div>
	
</body>
</html>