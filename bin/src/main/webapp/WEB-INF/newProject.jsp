
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) --> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Functions --> 
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <!-- for Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <!-- YOUR own local CSS -->
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body style="padding: 150px">
	<h1>Create a Project</h1>
	
	<form:form action="/projects/create" method="post" modelAttribute="project">
	 <p>
    	<form:hidden path="lead" value="${lead.id}"/>
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
       <form:label path="dueDate">Due Date:</form:label>
       <form:errors path="dueDate" class="text-danger"/>
       <form:input type="date" path="dueDate" class="form-control"/>
   </p>
   
   	 <input class="btn btn-primary" type="submit" value="Submit"/>
 	
	</form:form>

</body>
</html>