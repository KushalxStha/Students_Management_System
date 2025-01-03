<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="d-flex flex-column min-vh-100">
    
    <% 
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  // HTTP: 1.1
		response.setHeader("Pragma", "no-cache");     // HTTP: 1.0
		response.setHeader("Expire", "0");            // Proxies
	
    	if(session.getAttribute("username")!=null){
    		response.sendRedirect("welcome.jsp");
    	}
    %>
    
    <%@include file="/WEB-INF/jsp/header.jsp" %>
    
    <section class="d-flex flex-column justify-content-center align-items-center flex-grow-1 py-5">
      <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-md-9 col-lg-6 col-xl-5">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
              class="img-fluid" alt="Sample image">
          </div>
          <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
          
            <form action="login" method="post">
              <!-- Email input -->
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="text" id="form3Example3" class="form-control form-control-lg"
                  placeholder="Enter username" name="username" required/>
                <label class="form-label" for="form3Example3">Username</label>
              </div>

              <!-- Password input -->
              <div data-mdb-input-init class="form-outline mb-3">
                <input type="password" id="form3Example4" class="form-control form-control-lg"
                  placeholder="Enter password" name="pass" required/>
                <label class="form-label" for="form3Example4">Password</label>
              </div>

              <div class="text-center text-lg-start mt-4 pt-2">
                <button  type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg"
                  style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="registration.jsp"
                    class="link-danger">Register</a></p>
              </div>
            </form>
            
          </div>
        </div>
      </div>
    </section>

	<%@include file="/WEB-INF/jsp/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>