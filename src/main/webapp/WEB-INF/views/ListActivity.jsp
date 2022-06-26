<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Activity List</title>
</head>
<body>
<h2 style="color:green">${success }</h2>
<h2 style="color:red">${error }</h2>
<table border="2">
<tr>
<th>Activity Name</th>

<th>Registration Amount</th>
<th>Action</th>
</tr>
<c:forEach items="${activity }"  var="s">
<tr>
<td>${s.activityName }</td>
<td>${s.amount }</td>
<td><a href="deleteactivity/${s.activityId}"><button type="button" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-danger btn-circle btn-sm delete_button" >
		                                      Delete
		                                      </button></a>
| <a href="editactivity?activityId=${s.activityId}"><button type="button" name="editclass" class="btn btn-warning btn-circle btn-sm edit_button">
			                                 Edit
			                                  </button></a></td>
</tr>
</c:forEach>
</table>
</body>
</html>