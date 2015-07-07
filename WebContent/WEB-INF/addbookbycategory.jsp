<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>LearningDiary:AddBookByCategory</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>

</head>
<body>
	<c:import url="/WEB-INF/navbar.jsp"></c:import>

		<form action="addBookByCategory" method="post" >
			<input type="hidden" name="action" value="add-bookbycategory">

			<%--<div class="from-group">
				<label>Category Name</label><br>
				<input class="form-control" style="width:500px" type="text" name="category_name" value="${ }" required placeholder="Category Name"><br>
				
				<c:out value="${categories}"></c:out>	
			</div> --%>
			<div id="outerbody" class="row">
				<div class="col-md-5">
					<h2 style="text-align: left; color: blue">Add BookByCategory</h2>
					<div class="form-group">
						<label>Category ID</label><br> <input class="form-control"
							style="width: 500px" type="text" name="category_id"
							value="${book.category_id}" required><br>
					</div>

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
							placeholder="Book Format" required><br>
					</div>
					<br><br><br><br>
				</div>
				<div class="col-md-7">
					<br><br>	
					<div class="from-group">
						<label>Notes</label>
						<textarea class="form-control"
							style=" font-size: 20;" rows="12" name="notes"
							value="${book.notes }" placeholder="Your Notes"></textarea>
						<br>
					</div>

					<label>&nbsp; </label> <input class="btn btn-primary "
						type="submit" value="Add Book" id="submit">
					<a href="/LearningDiary/category" class="btn btn-primary">Cancel</a>
				</div>
			</div>
		</form>

	<div id="footer" >
		<%@ include file="/WEB-INF/footer.jsp"%>
	</div>

</body>
</html>
