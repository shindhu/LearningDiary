<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LearningDiary About</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>


</head>
<body >
	<c:import url="/WEB-INF/navbar.jsp"></c:import>

	<div id="outerbody" style="border: none;">
		<div>
			<h3 style="color:blue;">About LearningDiary</h3>
			<h4><i>(Dedicated to my 2015 ACC Java Development Capstone Project)</i></h4><br>
		</div>
		
		<div  class="col-md-9" style="text-align: justify;">
			
				<h3><strong>Task 1</strong> - Create the initial project</h3>
				The LearningDiary is a simple CRUD (Create Read Update Delete)
				ArrayList Management application created as a Dynamic Web Project with 
				Eclipse IDE, Apache Tomcat and Derby database using Java Servlets
				and JSPs to return and display Prepared Statements.
				<br>
		
				<h3><strong>Task 2</strong> - Create the home page and site structure</h3>
				<ul>
					<li>LearningDiary online database application built on a template using HTML 
					and CSS.</li>
					<li>There are 2 levels of access: Admin and Member</li>
					<li>Admin has permission to view users and their books</li>
					<li>Member can have their own book learnings</li>
				</ul>
				
				<h3><strong>Task 3</strong> - Create database model for single user</h3>
				 <ul>
				 	<li>Create database tables for CATEGORY, BOOKS, USERS</li>
				 	<li>CATEGORY - id as autoincrement, name</li>
				 	<li>BOOKS - id as autoincrement, category_id, image, name, book_format, notes</li>
				 	<li>USERS - id as autoincrement, username, password, email</li>
				 </ul>
				 
				 <h3><strong>Task 4</strong> - Create controller objects for accessing data</h3>
				 <div class="row">
					 <div class="col-md-3">
					 	<strong>CategoryManager</strong>
					 	getCategory()<br>
					 	getCtegoryByID()<br>
					 	getCategoryTotals()<br>
					 	addCategory()<br>
					 	updateCategory()<br>
					 	deleteCategoryWithID()<br>
					 </div>
					 <div class="col-md-3">
					 	<strong>BooksManager</strong><br>
					 	getBooks()<br>
					 	getBooksOrderByID()<br>
					 	getBooksOrderByName()<br>
					 	getBookWithBookID()<br>
					 	getBooksByCategoryID<br>
					 	addBook()<br>
					 	updateBook()<br>
					 	deleteBookWithID()<br>
					 </div>
					 <div class="col-md-3">
					 	<strong>UsersManager</strong><br>
					 	getUsers()<br>
					 	getUserByID()<br>
					 	findUserWithNameAndPassword()<br>
					 	addUser()<br>
					 </div>
				</div>
				
				<h3><strong>Task 5</strong> - Create objects to interact with data</h3>
				<div class="row">
					<div class="col-md-3">
						<strong>Category</strong><br>
						CategoryServlet.java<br>
						AddCategoryServlet.java<br>
						EditCategoryServlet.java<br>
						DeleteCategoryServlet.java<br>
					</div>
					<div class="col-md-3">
						<strong>Books</strong><br>
						BooksServlet.java<br>
						BooksByCategoryServlet.java<br>
						AddBookServlet.java<br>
						EditBookServlet.java<br>
						DeleteBookServlet.java<br>
					</div class="col-md-3">
					<div> 
						<strong>Users</strong><br>
						LoginServlet.java<br>
						LogoutServlet.java<br>
						SignupServlet.java<br>
					</div>
				</div>
				
				<h3><strong>Task 6</strong> - Create JSP pages</h3>
				<ul>
					<li>index.jsp</li>
					<li>viewcategory.jsp with hyperlink to booksbycategory.jsp</li>
					 <li>addcategory.jsp, editcategory.jsp and delete button in viewcategory.jsp </li>
					<li>viewbooks.jsp hyperlink to orderBooksByID, orderBooksByName</li>
					<li>addbook.jsp, editbook.jsp, delete button</li>
					<li>viewusers.jsp</li>
					<li>signup.jsp</li>
					<li>main.jsp</li>
					<li>login.jsp</li>
					<li>about.jsp</li>
					<li>contact.jsp</li>
				</ul>
				
				<h3><strong>Task 7</strong> - Modify application from single user to multi user</h3>
				<ul>
					<li>Add USER_ID in tables CATEGORY and BOOKS</li>
					<li>In CATEGORY table add ID as primary key and add constraint in BOOKS table as CATEGORY_ID_REF</li>
					<li>Add user_id variables in Domain classes and make necessary changes in Manager and Servlet classes</li>
					<li> </li>
				</ul>
		</div>
		
	</div>
	
	<div id="footer" style="position: relative;">
	<%@ include file="/WEB-INF/footer.jsp" %>
	</div>
</body>
</html>