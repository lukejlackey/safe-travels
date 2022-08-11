<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Safe Travels - Edit</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<form:form class="container" action="/expenses/${expense.getId()}/edit" method="post" modelAttribute="expense">
		<div class="d-flex justify-content-between align-items-center">
			<h1 class="display-1 text-primary">Edit Expense</h1>
			<a href="/">Go Back</a>
		</div>
		<form:errors class="text-danger" path="*"/>
		<input type="hidden" name="_method" value="put">
		<div>
			<form:label class="form-label" path="name">Expense Name:</form:label>
			<form:input class="form-control" path="name" type="text" value="${expense.getName()}"/>
		</div>
		<div>
			<form:label class="form-label" path="vendor">Vendor:</form:label>
			<form:input class="form-control" path="vendor" type="text" value="${expense.getVendor()}"/>
		</div>
		<div>
			<form:label class="form-label" path="amount">Amount:</form:label>
			<form:input class="form-control" path="amount" type="number" step="0.01" value="${expense.getAmount()}"/>
		</div>
		<div>
			<form:label class="form-label" path="description">Description:</form:label>
			<form:textarea class="form-control" path="description" value="${expense.getDescription()}"/>
		</div>
		<button class="btn btn-primary mt-3" type="submit">Submit</button>
	</form:form>
</body>
</html>