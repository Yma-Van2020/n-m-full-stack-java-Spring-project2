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
			<h1>Edit a project </h1>
			<a href="/dashboard">back to the dashboard</a>
		</div>
		<form:form action="/projects/${ project.id }/edit" method="put" modelAttribute="project" >
		    <p>
		    	<form:hidden path="lead" value="${lead.id}"/>
		    	<form:hidden path="id" value="${id}"/>
		        <form:label path="name">Project Title</form:label>
		        <form:errors path="name" class="text-danger"/>
		        <form:input path="name" class="form-control"/>
		    </p>
		    <p>
		        <form:label path="description">Description</form:label>
		        <form:errors path="description" class="text-danger"/>
		        <form:input path="description" class="form-control"/>
		    </p>
		    <p>
		        <form:label path="due">Due</form:label>
		        <form:errors path="due" class="text-danger"/>
		        <form:input type="date" path="due" class="form-control"/>
		    </p>

    		<input class="btn btn-primary" type="submit" value="Edit"/>
    	</form:form>
	</div>

</body>
</html>