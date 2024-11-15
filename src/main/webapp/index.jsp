<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
    	if(session.getAttribute("username")!=null){
    		response.sendRedirect("welcome.jsp");
    	}
    %>

	<%@include file="/WEB-INF/jsp/header.jsp"%>
	<!-- Hero -->
	<div class="container">
		<div
			class="row p-3 align-items-center rounded-3">
			<div class="col-lg-7 p-3 p-lg-5 pt-lg-3">
				<div class="lc-block mb-3">
						<h2 class="fw-bold display-4">
							Border hero with cropped image and shadows&nbsp;
						</h2>
				</div>

				<div class="lc-block mb-3">
						<p class="lead">Quickly design and customize responsive
							mobile-first sites with Bootstrap, the world’s most popular
							front-end open source toolkit, featuring Sass variables and
							mixins, responsive grid system, extensive prebuilt components,
							and powerful JavaScript plugins.</p>
				</div>
			</div>
			<div class="col-lg-4 offset-lg-1 p-0 overflow-hidden shadow-lg">
				<div class="lc-block">
					<img class="rounded-start w-100"
						src="https://images.unsplash.com/photo-1493612276216-ee3925520721?crop=entropy&amp;cs=tinysrgb&amp;fit=max&amp;fm=jpg&amp;ixid=MnwzNzg0fDB8MXxzZWFyY2h8M3x8d2Vic2l0ZXxlbnwwfDF8fHwxNjIxNDQ4NTEw&amp;ixlib=rb-1.2.1&amp;q=80&amp;w=1080"
						alt="Photo by Diego PH" width="720">
				</div>
			</div>
		</div>
	</div>
	<!-- Hero -->
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>