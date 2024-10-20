<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, java.util.ArrayList, com.model.Students"%>
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
	
	<%@include file="/WEB-INF/jsp/logheader.jsp" %>

    
    <div class="container my-5">
    <a class="btn btn-primary mb-3" href="create.jsp">Create</a>
    
    <table border="1" class="table table-striped table-hover">
        <thead class="table-dark">
        	<tr>
            	<th scope="col">ID</th>
            	<th scope="col">Name</th>
            	<th scope="col">Age</th>
            	<th scope="col">Marks</th>
            	<th width="20%">Action</th>
        	</tr>
    	</thead>
    	<tbody>
			<%
    		Object stdListObj = session.getAttribute("stdList");
    		if (stdListObj != null && stdListObj instanceof List<?>) {
    	
    		@SuppressWarnings("unchecked")
        	List<Students> studentsList = (List<Students>) stdListObj;
        
    		for (Students std : studentsList) {
			%>
			<tr>
				<td><%=std.getId()%></td>
				<td><%=std.getName()%></td>
				<td><%=std.getAge()%></td>
				<td><%=std.getMarks()%></td>
				<td>
                    <a class="btn btn-primary" href="crud?action=update&id=<%=std.getId()%>">Update</a>
                    <a class="btn btn-danger" href="crud?action=delete&id=<%=std.getId()%>">Delete</a>
                    <a class="btn btn-success" href="crud?action=read&id=<%=std.getId()%>">View</a>
                </td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="4">No students found.</td>
			</tr>
			<%
			}
			%>
		</tbody>
    </table>
    </div>
    
	<%@include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>