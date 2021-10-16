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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h1>Project  Details</h1>
			<a href="/dashboard">back to the dashboard</a>
		</div>
		<ul>
			<li> Project: <c:out value="${ project.name }"/></li>
			<li> Lead: <c:out value="${ project.lead.firstName }"/> <c:out value="${ project.lead.lastName }"/></li>
			<li> Description: <c:out value="${ project.description }"/></li>
			<li> Due Date: <fmt:formatDate pattern="MM/dd/yyyy" value="${project.due}" /></li>
			<li> Team:
				<ul>
					<c:forEach var="member" items="${project.projectTeam }">
					<li> <c:out value="${ member.firstName }"/> <c:out value="${ member.lastName }"/> </li>
					</c:forEach>				
				</ul> 
			</li>
			
		</ul>
		<c:choose>
		<c:when test="${ project.lead.id == uuid }">
			<form action="/projects/${ project.id }" method="post">
				<input type="hidden" name="_method" value="delete"/>
				<input class="btn btn-danger" type="submit" value="Delete Project"/>
			</form>
		</c:when>
		</c:choose>
	</div>
	

</body>
</html>