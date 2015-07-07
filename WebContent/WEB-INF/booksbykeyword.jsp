<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>

<html>
<head>
<title>BookByKeyword</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>

</head>
<body >
	<c:import url="/WEB-INF/navbar.jsp"></c:import>
	
	<div class="table-responsive" id="outerbody" >
	${Empty_filteredBooks }
	<table class="table table-bordered">
		<tr>
			<th>ID</th>
			<th>Image</th>
			<th>Title</th>
			<th>Book_Format</th>
			<th>Notes</th>
		</tr>
		
		  <c:out value="${theFilteredBook }"> </c:out>
		  <c:forEach items="${theFilteredBook }" var="book"> 
			<tr>	
				<td>${book.id }</td>
				<td><img src="${book.image }" height=100 width=100 /></td>
				<td>${book.name }</td>
				<td>${book.book_format }</td>
				<td>${book.notes }</td>
			</tr>
		</c:forEach> 
			
	</table>
	</div>
	
	<div>
	<%@ include file="/WEB-INF/footer.jsp" %>
	</div>
	

</body>
</html>