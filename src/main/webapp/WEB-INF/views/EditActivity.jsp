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
                    <input type="text" name="activityName" id="activityName" onkeypress="return allowOnlyLetters(event,this);" class="form-control" value=${a.activityName }  required>
                  </div>
                  
                  
                  <div class="form-group">
                    <label for="amount" >Registration Amount</label>
                    <input type="text" name="amount" id="amount" class="form-control" value=${a.amount } required>
                  </div>
                  
                  <input id="login"  type="submit" value="Edit Activity" class="btn btn-warning btn-circle btn-sm edit_button">
                 <a href="listactivity"><button type="button" name="editclass" class="btn btn-warning btn-circle btn-sm edit_button">
			                                Cancel
			                                  </button></a></td>
                </form>
           
                        </div>
          </div>
        </div>
      </div>
    
     
    </div>
  </main>
<script>
function allowOnlyLetters(e, t)   
{    
   if (window.event)    
   {    
      var charCode = window.event.keyCode;    
   }    
   else if (e)   
   {    
      var charCode = e.which;    
   }    
   else { return true; }    
   if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))    
       return true;    
   else  
   {    
      alert("Please enter only alphabets");    
      return false;    
   }           
} 
</script>
</body>
</html>