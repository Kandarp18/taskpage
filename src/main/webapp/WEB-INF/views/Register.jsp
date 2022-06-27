<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<h2 style="color:green">${success }</h2>
<h2 style="color:red">${error }</h2>
<h4>Your Registration Id is ${id }</h4>

<table border="2">
<tr>
<th>Student Name</th>
<th>Date of Birth</th>
<th>Age</th>
<th>Registration Date</th>
<th>Sport Activity</th>
<th>Amount</th>
</tr>
<c:forEach items="${student }"  var="s">
<tr>
<td>${s.studentName }</td>
<td>${s.dob }</td>
<td>${s.age }</td>
<td>${s.registerDate }</td>
<td>${s.activityName }</td>
<td>${s.amount }</td>
</tr>
</c:forEach>
</table>
<a href="register"><button type="button" name="editclass" class="btn btn-warning btn-circle btn-sm edit_button">
			                               Back to Registration
			                                  </button></a>
</body>
</html>