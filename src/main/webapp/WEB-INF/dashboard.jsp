
   
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Project Manager</title>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h1>Welcome, <c:out value="${ user.firstName }"/></h1>
			<a href="/logout">Logout</a>
		</div>
		<div class="d-flex justify-content-between">
			<h3>All Projects</h3>
			<a href="/projects/new">+ Add a project</a>
		</div>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<td>Project</td>
					<td>Team Lead</td>
					<td>Due Date</td>
					<td>Actions</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="project" items="${ allProjects }" >
				<tr>
					<td><a href="/projects/${ project.id }"><c:out value="${ project.name}"/></a></td>
					<td><c:out value ="${ project.lead.firstName }"/> <c:out value ="${ project.lead.lastName }"/></td>
					<td><fmt:formatDate pattern="MMM d" value="${project.due}" /></td>
					<td>
						<c:choose>	
							<c:when test="${project.lead.id == user.id }"><a href="/projects/${ project.id }/edit">Edit</a> </c:when>
							<c:otherwise> 
								<form action="/users/${ user.id }/join" method="post">
									<input type="hidden" name="projId" value="${ project.id }"/>
									<input type="submit" value="Join Team" />
								</form>
							</c:otherwise> 
						</c:choose>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<h3>Your Projects</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<td>Project</td>
					<td>Team Lead</td>
					<td>Due Date</td>
					<td>Actions</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="project" items="${ yourProjects }" >
				<tr>
					<td><a href="/projects/${ project.id }"><c:out value="${ project.name}"/></a></td>
					<td><c:out value ="${ project.lead.firstName }"/> <c:out value ="${ project.lead.lastName }"/></td>
					<td><fmt:formatDate pattern="MMM d" value="${project.due}" /></td>
					<td>
						<c:choose>	
							<c:when test="${project.lead.id == user.id }"><a href="/projects/${ project.id }/edit">Edit</a> </c:when>
							<c:otherwise>
								<form action="/users/${ user.id }/leave" method="post">
									<input type="hidden" name="projId" value="${ project.id }"/>
									<input type="submit" value="Leave Team" />
								</form>
							</c:otherwise> 
						</c:choose>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>

</body>
</html>