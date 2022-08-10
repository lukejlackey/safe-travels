<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Safe Travels</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<h1 class="display-1 text-primary">Safe Travels</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Expense</th>
				<th>Vendor</th>
				<th>Amount</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="exp" items="${expenses}">
				<tr>
					<td><c:out value="${exp.getName()}"></c:out></td>
					<td><c:out value="${exp.getVendor()}"></c:out></td>
					<td>$<c:out value="${exp.getAmount()}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h2 class="display-2 text-primary">Add an expense:</h2>
	<form:form action="/add" method="post" modelAttribute="expense">
		<form:errors path="*"/>
		<div>
			<form:label path="name">Expense Name:</form:label>
			<form:input path="name" type="text"/>
		</div>
		<div>
			<form:label path="vendor">Vendor:</form:label>
			<form:input path="vendor" type="text"/>
		</div>
		<div>
			<form:label path="amount">Amount:</form:label>
			<form:input path="amount" type="number" step="0.01"/>
		</div>
		<div>
			<form:label path="description">Description:</form:label>
			<form:textarea path="description"/>
		</div>
		<button type="submit">Submit</button>
	</form:form>
</body>
</html>