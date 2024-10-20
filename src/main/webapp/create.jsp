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
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  // HTTP: 1.1
		response.setHeader("Pragma", "no-cache");     // HTTP: 1.0
		response.setHeader("Expire", "0");            // Proxies
	
		if(session.getAttribute("username")==null){
			response.sendRedirect("login.jsp");
		}
	%>
	<%@include file="/WEB-INF/jsp/logheader.jsp"%>
	
    <div class="my-5 mx-5 d-flex justify-content-center align-items-center h-100">
      
        <form action="crud?action=create" method="post">
              <!-- First Name input -->
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="text" id="firstName" class="form-control form-control-lg"
                  placeholder="Enter name" name="name" required/>
                <label class="form-label" for="firstName">Name</label>
              </div>
              
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="number" step="1" min="18" max="35" id="firstName" class="form-control form-control-lg"
                  placeholder="Enter Age" name="age" required/>
                <label class="form-label" for="firstName">Age</label>
              </div>
              
              <div data-mdb-input-init class="form-outline mb-4">
                <input type="number" step="0.01" min="40" max="100" id="firstName" class="form-control form-control-lg"
                  placeholder="Enter Marks" name="marks" required/>
                <label class="form-label" for="firstName">Marks</label>
              </div>

          <div class="text-center text-lg-start mt-4 pt-2">
          	<a href="showStudents" data-mdb-button-init data-mdb-ripple-init class="btn btn-danger btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">
              Cancel</a>
            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">
              Add</button>
          </div>
        </form>
        
      </div>
	
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>