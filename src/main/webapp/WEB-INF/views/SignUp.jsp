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
 
<script type="text/javascript">
function formatDate(date){
var d = new Date(date),
month = '' + (d.getMonth() + 1),
day = '' + d.getDate(),
year = d.getFullYear();

if (month.length < 2) month = '0' + month;
if (day.length < 2) day = '0' + day;

return [year, month, day].join('-');

}

function getAge(dateString){
var birthdate = new Date().getTime();
if (typeof dateString === 'undefined' || dateString === null || (String(dateString) === 'NaN')){
// variable is undefined or null value
birthdate = new Date().getTime();
}
birthdate = new Date(dateString).getTime();
var now = new Date().getTime();
// now find the difference between now and the birthdate
var n = (now - birthdate)/1000;
if (n < 604800){ // less than a week
var day_n = Math.floor(n/86400);
if (typeof day_n === 'undefined' || day_n === null || (String(day_n) === 'NaN')){
// variable is undefined or null
return '';
}else{
return day_n + ' day' + (day_n > 1 ? 's' : '') + ' old';
}
} else if (n < 2629743){ // less than a month
var week_n = Math.floor(n/604800);
if (typeof week_n === 'undefined' || week_n === null || (String(week_n) === 'NaN')){
return '';
}else{
return week_n + ' week' + (week_n > 1 ? 's' : '');
}
} else if (n < 31562417){ // less than 24 months
var month_n = Math.floor(n/2629743);
if (typeof month_n === 'undefined' || month_n === null || (String(month_n) === 'NaN')){
return '';
}else{
return month_n + ' month' + (month_n > 1 ? 's' : '') ;
}
}else{
var year_n = Math.floor(n/31556926);
if (typeof year_n === 'undefined' || year_n === null || (String(year_n) === 'NaN')){
return year_n = '';
}else{
return year_n + ' year' + (year_n > 1 ? 's' : '');
}
}
}

function getAgeVal(pid){
var birthdate = formatDate(document.getElementById("dob").value);
var count = document.getElementById("dob").value.length;
if (count=='10'){
var age = getAge(birthdate);
var str = age;
var res = str.substring(0, 1);
if (res =='-' || res =='0'){
document.getElementById("dob").value = "";
document.getElementById("age").value = "";
$('#dob').focus();
return false;
}else{
document.getElementById("age").value = age;
}
}else{
document.getElementById("age").value = "";
return false;
}
}
</script>
</head>
<body>
  <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          
          <div class="col-md-7">
            <div class="card-body">
            
              <p class="login-card-description">Register Now!</p>
              <form action="saveuser" method="post">
              <div class="form-group">
                    <label for="studentName" >StudentName</label>
                    <input type="text" name="studentName" id="studentName" class="form-control" placeholder="Your Name" required>
                  </div>
                   <div class="form-group">
                    <label for="dateOfBirth" >Date Of Birth</label>
                    <input type="date" name="dob" id="dob" class="form-control" maxlength="10" placeholder="Date of Birth" onkeyup="getAgeVal(0)" onblur="getAgeVal(0);" required>
                  </div>
                  <div class="form-group">
                    <label for="age" >Age</label>
                    <input type="text" name="age" id="age" class="form-control" placeholder="Age" autocomplete="off" disabled>
                  </div>
                    <div class="form-group">
                    <label for="registerDate">Date Of Registration</label>
                    <input type="datetime-local" name="registerDate" id="registerDate"  class="form-control datepicker"  required data-parsley-trigger="keyup" maxlength="10" placeholder="Date of Registration">
                  </div>
                     
                   
                   <div class="form-group">
                       <label for="activity">Sport Activity</label>
                   <select name="activityId" id="activity" class="form-control" required>
                         <option>Select Sport Activity</option>
                         <c:forEach items="${activity}" var="a">
                              <option value="${a.activityId }">${a.activityName }</option>
                         </c:forEach>
                   </select>
                  </div>
                  
                  <div class="form-group">
                    <label for="amount" >Registration Amount</label>
                    <input type="text" name="amount" id="amount" class="form-control" placeholder="Amount" value="100" readonly>
                  </div>
                  
                  <input id="login"  type="submit" value="Register" >
                  <input id="clear" type="reset" value="Cancel" >
                </form>
            
            </div>
          </div>
        </div>
      </div>
    
     
    </div>
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="vendor/datepicker/bootstrap-datepicker.js"></script>
  <script type="text/javascript" src="vendor/datetimepicker/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript" src="vendor/bootstrap-select/bootstrap-select.min.js"></script>
  <script type="text/javascript" src="vendor/parsley/dist/parsley.min.js"></script>
  <script>
$(document).ready(function(){

    var date = new Date();
    date.setDate(date.getDate());
    $("#registerDate").datetimepicker({
        startDate: date,
        format: 'yyyy-mm-dd',
        autoclose: true
    });

    $('#registerDate').datetimepicker({
        startDate: date,
        format: 'yyyy-mm-dd',
        autoclose: true
    });


</script>
</body>
</html>
