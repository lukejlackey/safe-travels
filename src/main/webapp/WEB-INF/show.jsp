<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Safe Travels - Edit</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h1 class="display-1 text-primary">Expense Details</h1>
			<a href="/">Go Back</a>
		</div>
		<input type="hidden" name="_method" value="put">
		<div>
			<label class="form-label">Expense Name:</label>
			<p>${expense.getName()}</p>
		</div>
		<div>
			<label class="form-label">Vendor:</label>
			<p>${expense.getVendor()}</p>
		</div>
		<div>
			<label class="form-label">Amount:</label>
			<p>${expense.getAmount()}</p>
		</div>
		<div>
			<label class="form-label">Description:</label>
			<p>${expense.getDescription()}</p>
		</div>
	</div>
</body>
</html>