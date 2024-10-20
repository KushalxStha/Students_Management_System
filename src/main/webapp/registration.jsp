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
    	if(session.getAttribute("username")!=null){
    		response.sendRedirect("welcome.jsp");
    	}
    %>
    
    <%@include file="/WEB-INF/jsp/header.jsp" %>
    
    <section class="d-flex flex-column justify-content-center align-items-center flex-grow-1 py-5">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-8 col-lg-6 col-xl-7">
      
        <form action="register" method="post">
          <div class="row">
            <!-- Left column: First Name, Last Name, Email -->
            <div class="col-md-6">
              <!-- First Name input -->
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="text" id="firstName" class="form-control form-control-lg"
                  placeholder="Enter your first name" name="first_name" required/>
                <label class="form-label" for="firstName">First Name</label>
              </div>

              <!-- Last Name input -->
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="text" id="lastName" class="form-control form-control-lg"
                  placeholder="Enter your last name" name="last_name" required/>
                <label class="form-label" for="lastName">Last Name</label>
              </div>

              <!-- Email input -->
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="email" id="email" class="form-control form-control-lg"
                  placeholder="Enter your email" name="email" required/>
                <label class="form-label" for="email">Email</label>
              </div>
            </div>

            <!-- Right column: Username, Password, Confirm Password -->
            <div class="col-md-6">
              <!-- Username input -->
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="text" id="username" class="form-control form-control-lg"
                  placeholder="Set username" name="username" required/>
                <label class="form-label" for="username">Username</label>
              </div>

              <!-- Password input -->
              <div data-mdb-input-init class="form-outline mb-3">
                <input type="password" id="password" class="form-control form-control-lg"
                  placeholder="Set password" name="pass" required/>
                <label class="form-label" for="password">Password</label>
              </div>

              <!-- Confirm Password input -->
              <div data-mdb-input-init class="form-outline mb-3">
                <input type="password" id="confirmPassword" class="form-control form-control-lg"
                  placeholder="Confirm password" name="cpass" required/>
                <label class="form-label" for="confirmPassword">Confirm Password</label>
              </div>
            </div>
          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">Register</button>
            <p class="small fw-bold mt-2 pt-1 mb-0">Already have an account? <a href="login.jsp"
                class="link-danger">Login</a></p>
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