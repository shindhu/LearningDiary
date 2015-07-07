<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>LearningDiary:AddBook</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>

</head>
<body>
	<c:import url="/WEB-INF/navbar.jsp"></c:import>


	<!-- <a href="/LearningDiary/books" style="color: blue; font-style: italic;">Back to Books</a> -->

	<form action="addBook" method="post">
		<input type="hidden" name="action" value="add-book">
		<div class="row" id="outerbody">
			<div class="col-md-5">
				<h2 style="text-align: left; color: blue">Add Book</h2>

				<div class="form-group">
					<label>Category ID</label><br>
					<%-- <input class="form-control" style="width:500px" type="text" name="category_id" value="${book.category_id }" required placeholder="Category ID"><br> --%>
					<select name="category_id">
						<c:forEach items="${categories}" var="category">
							<option value="${category.id}">${category.id}.
								${category.name}</option>
						</c:forEach>
					</select>

				</div><br>

				<%-- <div class="from-group">
				<label>Select Category Name</label><br>
				<input class="form-control" style="width:500px" type="text" name="category_name" value="${book.category_name }" required placeholder="Category Name"><br>
				
				<c:out value="${categories}"></c:out>	
				
					 <select name="category_id"> 
						<c:forEach items="${categories}" var="category">
							<option value="${category.id}">
							${category.id}.  ${category.name}</option>
						</c:forEach>
					 </select> 
				
			</div> --%>

				<div class="from-group">
					<label>Image</label> <input class="form-control"
						style="width: 500px; font-size: 20;" type="text" name="image"
						value="${book.image }"
						placeholder="Paste the book image link from your browser"><br>
				</div>

				<div class="from-group">
					<label>Title</label> <input class="form-control"
						style="width: 500px; font-size: 20;" type="text" name="name"
						value="${book.name }" required placeholder="Book Title "><br>
				</div>

				<div class="from-group">
					<label>Book Format</label> <input class="form-control"
						style="width: 500px; font-size: 20;" type="text"
						name="book_format" value="${book.book_format }"
						placeholder="Book Format"><br>
				</div>
				<br>
				<br>
			</div>

			<div class="col-md-7">
				<br>
				<br>
				<div class="from-group">
					<label>Notes</label>
					<textarea class="form-control" style="font-size: 20;" rows="12"
						name="notes" value="${book.notes }" placeholder="Your Notes"></textarea>
					<br>
				</div>

				<label>&nbsp; </label> <input class="btn btn-primary " type="submit"
					value="Add Book" id="submit">
				<a href="/LearningDiary/books" class="btn btn-primary">Cancel</a>
				<br><br><br>
			</div>
		</div>
	</form>

	<div id="footer">
		<%@ include file="/WEB-INF/footer.jsp"%>
	</div>

</body>
</html>
