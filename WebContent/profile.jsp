<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import="com.app.entities.User" %>
<%@ page import="com.app.entities.Message" %>

 <%
	User user = (User)session.getAttribute("currentUser");
	if(user == null){
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Space</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	</head>
	<body>
	
		<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/javablog" user = "root"  password = "12345"/>
		
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark pl-3 pr-3">
			<a class="navbar-brand" href="./Profile.jsp">Space</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item active">
						<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
					</li>
				</ul>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item">
						<a class="nav-link" href="index.jsp"><%= user.getFirstName() %></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="LogoutServlet">Logout</a>
					</li>
				
				</ul>
			</div>
			
		</nav>
		
		<div class="container-fluid my-4">
			<div class="row mr-3 ml-3">
				<div class="col-lg-9">
					<%
						Message msg = (Message)session.getAttribute("global");
						
						if(msg!=null){
							%>
								<c:set var="alertClass" value="alert-danger"/>
								<div class="alert <%=msg.getCssClass() %> alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<p><%= msg.getContent() %></p>
								</div>
							
							<%
							session.removeAttribute("message");
						}
					%>
					<div class="container">
						<div class="d-flex" style="gap:1em;">					
							<h2 class="display-4">Tasks List</h2>
							<button type="button" class="btn btn-success my-3" data-toggle="modal" data-target="#taskModal">Add tasks</button>
						</div>
						<hr class="br-1" />
					</div>
					<div class="container">
						<table class="table">
							<thead>
								<th>
									<th scope="col">Task</th>
									<th scope="col">Expected Time</th>
									<th scope="col">Status</th>
									<th scope="col">Actions</th>
								<th>
							</thead>
							<sql:query dataSource = "${snapshot}" var = "result">SELECT * from tasks WHERE fk_user=<%=user.getId()%> AND status=1 OR status=2;</sql:query>
							<c:set var="count" value="${1}" />
							<tbody>
								<c:forEach var = "row" items = "${result.rows}">
						            <tr>
						               <td> <c:out value = "${count}"/></td>
						               <td> <c:out value = "${row.task_name}"/></td>
						               <td> <c:out value = "${row.task_created}"/></td>
						               <td> <c:out value = "${row.status}"/></td>
						               <td> 
						               		<div class="container d-flex text-align-left">
												<a href="">delete</a>&nbsp;
						               		</div>
						               </td>
						            </tr>
						            <c:set var="count" value="${count+1}"></c:set>
         						</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-lg-3 ">
					<div class="container">
						<img src="./pics/default.jpg" class="img-thunbnail rounded-circle" alt="Responsive image">
					</div>	
					<div class="container">
						<div >
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Name: </td>
										<td><%=user.getFirstName() %></td>
									</tr>
									<tr>
										<th scope="row">ID: </td>
										<td><%=user.getId() %></td>
									</tr>
									<tr>
										<th scope="row">email: </td>
										<td><%=user.getEmail() %></td>
									</tr>
									<tr>
										<th scope="row">Date Joined: </td>
										<td><%=user.getTimestamp().substring(0, 11) %></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" tabindex="-1" role="dialog"  aria-labelledby="taskModal" id="taskModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Add Tasks</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="taskForm" action="taskServlet" method="post">
							<div class="form-group">
								<label for="taskGroup1">Task</label>
								<input type="text" class="form-control" id="taskGroup1" placeholder="Task" name="taskName">
							</div>
							<div class="form-group">
								<label for="taskGroup2">Select Time:</label>
								<input type="datetime-local" class="form-control" id="taskGroup2" name="taskTime" step="1">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success" form="taskForm">Add</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>