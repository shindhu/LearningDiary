<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Learning Diary</title>
<%@ include file="/WEB-INF/common-css-javascript.html"%>
</head>

<body >
	<%@ include file="/WEB-INF/navbar.jsp"%>
	
		<div class="row">
			<div class="col-md-2">	</div>
			<div class="col-md-8" >
				<br>
				<!-- <h1 style="text-align: center;color:navy; font-size: 80px">LearningDiary</h1> -->
				<br><br><br>
				<p style="text-align: justify; font-size: 20;">

					<br><br><br>
					<strong>What?</strong> One stop place to keep track of <u style="color:blue">takeaways</u>
					from your reading (both hard and digital). This is radically
					different than pure note taking or highlighting. For example, one
					book read by 5 folks can have five different learnings because it
					is very personal to each one of them as everybody sees the world
					differently. <br>
					<br><br> <strong>How?</strong> <u style="color:blue">Securely</u> organize and manage
					learnings in your personal online account. <br>
					<br> <br><strong>Why?</strong> <u style="color:blue">Reflections</u> of learnings from your
					reading gives you a very personal experience that can you go and
					revisit over time or reading them again. <br>
					<br>
					<u><a href="/LearningDiary/signup" style="color: red;"> CLICK HERE TO SIGN-UP FOR FREE </a></u>
					 We will help you to keep your learnings organized by books and category. 
					<!--  LearningDiary does not have
					limitations to have category and books. <br> <br> Each
					Category track number of books you own as count. If you decide to
					delete category please make sure category is empty. <br> <br> -->
					
				</p>

			</div>
			<div class="col-md-2"></div>
		</div>
		<!-- rows div -->

		
		<div id="footer">
			<%@ include file="/WEB-INF/footer.jsp"%>
		</div>
	
</body>
</html>