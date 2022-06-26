<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Register</title>
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/login.css">
   <link rel="stylesheet" type="text/css" media="screen" href="jquery-ui.css" />
</head>
<body>
  <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          
          <div class="col-md-7">
            <div class="card-body">
            
              <p class="login-card-description">Edit Sport Activity!</p>
              <form action="updateactivity" method="post">
              <input type="hidden" value="${a.activityId }" name="activityId">
              <div class="form-group">
                    <label for="activityName" >Activity Name</label>
                    <input type="text" name="activityName" id="activityName" class="form-control" value=${a.activityName }  required>
                  </div>
                  
                  
                  <div class="form-group">
                    <label for="amount" >Registration Amount</label>
                    <input type="text" name="amount" id="amount" class="form-control" value=${a.amount } required>
                  </div>
                  
                  <input id="login"  type="submit" value="Edit Activity" >
                  <input id="clear" type="reset" value="Cancel" >
                </form>
           
                        </div>
          </div>
        </div>
      </div>
    
     
    </div>
  </main>

</body>
</html>