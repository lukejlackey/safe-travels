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
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="exp" items="${expenses}">
				<tr>
					<td><a href="/expenses/${exp.getId()}"><c:out value="${exp.getName()}"></c:out></a></td>
					<td><c:out value="${exp.getVendor()}"></c:out></td>
					<td>$<c:out value="${exp.getAmount()}"></c:out></td>
					<td>
						<a href="/expenses/${exp.getId()}/edit">edit</a>
						<form action="/expenses/${exp.getId()}" method="post">
							<input type="hidden" name="_method" value="delete">
							<input class="btn btn-danger" type="submit" value="delete"/>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form:form class="container" action="/" method="post" modelAttribute="expense">
		<h2 class="display-4 text-primary">Add an expense:</h2>
		<form:errors class="text-danger" path="*"/>
		<div>
			<form:label class="form-label" path="name">Expense Name:</form:label>
			<form:input class="form-control" path="name" type="text"/>
		</div>
		<div>
			<form:label class="form-label" path="vendor">Vendor:</form:label>
			<form:input class="form-control" path="vendor" type="text"/>
		</div>
		<div>
			<form:label class="form-label" path="amount">Amount:</form:label>
			<form:input class="form-control" path="amount" type="number" step="0.01"/>
		</div>
		<div>
			<form:label class="form-label" path="description">Description:</form:label>
			<form:textarea class="form-control" path="description"/>
		</div>
		<button class="btn btn-primary mt-3" type="submit">Submit</button>
	</form:form>
</body>
</html>