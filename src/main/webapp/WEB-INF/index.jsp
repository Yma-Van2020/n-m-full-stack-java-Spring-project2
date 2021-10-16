
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
<title>Login / Register </title>
</head>
<body>
	<div class="container">
		<h1 class="text-primary">Project Manager</h1>
		<h4>A place for teams to manage projects</h4>
		<div class="row">
		  <form:form action="/register" method="post" modelAttribute="newUser" class="col-6">
		  	<h2>Register</h2>
	        <div class="form-group">
	            <label>First Name:</label>
	            <form:input path="firstName" class="form-control" />
	            <form:errors path="firstName" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Last Name:</label>
	            <form:input path="lastName" class="form-control" />
	            <form:errors path="lastName" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Email:</label>
	            <form:input path="email" class="form-control" />
	            <form:errors path="email" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Password:</label>
	            <form:password path="password" class="form-control" />
	            <form:errors path="password" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Confirm Password:</label>
	            <form:password path="confirm" class="form-control" />
	            <form:errors path="confirm" class="text-danger" />
	        </div>
	        <input type="submit" value="Register" class="btn btn-primary mt-2" />
	    </form:form>
	    
	    <form:form action="/login" method="post" modelAttribute="newLogin" class="col-6">
	    	<h2>Log In</h2>
	        <div class="form-group">
	            <label>Email:</label>
	            <form:input path="email" class="form-control" />
	            <form:errors path="email" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Password:</label>
	            <form:password path="password" class="form-control" />
	            <form:errors path="password" class="text-danger" />
	        </div>
	        <input type="submit" value="Login" class="btn btn-success mt-2" />
	    </form:form>
	    </div>
	</div>

</body>
</html>