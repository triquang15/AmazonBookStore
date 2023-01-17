<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Customers - Amazon Customer Store</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />

  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.0.4" rel="stylesheet" />
  <script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../assets/js/jquery.validate.min.js"></script>

</head>
<body class="g-sidenav-show  bg-gray-200">
<jsp:directive.include file="sidebar.jsp" />
<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">

	<main class="main-content  mt-0">
    <section>
      <div class="page-header min-vh-100">
        <div class="container">
        <br>
          <div class="row">
              <div class="card card-plain">
                <div class="card-header text-center">
                	<c:if test="${customer != null }">
                  		<h4 class="font-weight-bolder">Edit Customer</h4>
                   </c:if>
                   <c:if test="${customer == null }">
                  		<h4 class="font-weight-bolder">Create New Customer</h4>
                   </c:if>
                </div>
                 <br>
                 <c:if test="${message != null}">
               		 <p class="text-center" style="color: red;">${message }</p>
                	</c:if> <br>
                <div class="card-body">
               	  <c:if test="${customer != null }">
                    <form action="update_customer" method="post" role="form" id="customerForm">
                    <input type="hidden" name="customerId" value="${customer.customerId}">
                  </c:if>
                  
                   <c:if test="${customer == null }">
                    <form action="create_customer" method="post" role="form" id="customerForm">
                  </c:if>
                  
            
                  	<div class="input-group input-group-outline mb-3">               
                      <input type="text" id="email" name="email" size="45" value="${customer.email}" class="form-control" placeholder="E-mail" >
                    </div>
                    
                    <div class="input-group input-group-outline mb-3">                      
                      <input type="text"  placeholder="Full Name" id="fullName" name="fullName" size="45" value="${customer.fullname}" class="form-control">
                    </div>
                    
                    <div class="input-group input-group-outline mb-3">                     
                      <input type="password" id="password" name="password" size="45" value="${customer.password}" placeholder="Password" class="form-control"> 
                    </div>
                    
                    <div class="input-group input-group-outline mb-3">                     
                      <input type="password" id="confirmPassword" name="confirmPassword" size="45" value="${customer.password}" placeholder="Confirm Password" class="form-control"> 
                    </div>
                    
                    <div class="input-group input-group-outline mb-3">                     
                      <input type="text" id="phone" name="phone" size="45" value="${customer.phone}" placeholder="Phone Number" class="form-control"> 
                    </div>
                    
                    <div class="input-group input-group-outline mb-3">                     
                      <input type="text" id="address" name="address" size="45" value="${customer.address}" placeholder="Address" class="form-control"> 
                    </div>
                    
                     <div class="input-group input-group-outline mb-3">                     
                      <input type="text" id="city" name="city" size="45" value="${customer.city}" placeholder="City" class="form-control"> 
                    </div>
                    
                     <div class="input-group input-group-outline mb-3">                     
                      <input type="text" id="zipCode" name="zipCode" size="45" value="${customer.zipcode}" placeholder="Zip Code" class="form-control"> 
                    </div>
                    
                     <div class="input-group input-group-outline mb-3">                     
                      <input type="text" id="country" name="country" size="45" value="${customer.country}" placeholder="Country" class="form-control"> 
                    </div>
                             
                                                                   
                    
                   <br>
                    <div class="text-center">
                      <button type="submit" class="btn btn-lg bg-gradient-primary">Submit</button>
                      <button type="button" class="btn btn-lg bg-gradient-primary" id="buttonCancel">Cancel</button>
                    </div>
                  </form>
                </div>     
              </div>
            </div>
          
        </div>
      </div>
    </section>
    <!-- start-footer -->
      <jsp:directive.include file="footer.jsp" />
      <!-- end-footer -->
  </main>
	
	</main>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		$("#customerForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				fullName: "required",
				password: "required",
				
				confirmPassword: {
					required: true,
					equalTo: "#password"
				},
				
				phone: "required",								
				address: "required",
				city: "required",
				zipCode: "required",
				country: "required",
			},
			
			messages: {
				email: {
					required: "Please enter e-mail address",
					email: "Please enter a valid e-mail address"
				},
				
				fullName: "Please enter full name",
				password: "Please enter password",
				
				confirmPassword: {
					required: "Please confirm password",
					equalTo: "Confirm password does not match password"
				},
				
				phone: "Please enter phone number",								
				address: "Please enter address",
				city: "Please enter city",
				zipCode: "Please enter zip code",
				country: "Please enter country",
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});	
</script>
</html>