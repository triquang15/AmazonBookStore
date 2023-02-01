<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Customers</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <link rel="shortcut icon" type="image/x-icon" href="../assets/img/icon.png">

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
                      <input type="text"  placeholder="First Name" id="firstname" name="firstname" size="45" value="${customer.firstname}" class="form-control">
                    </div>
                    
                    <div class="input-group input-group-outline mb-3">                      
                      <input type="text"  placeholder="Last Name" id="lastname" name="lastname" size="45" value="${customer.lastname}" class="form-control">
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
                      <input type="text" id="address1" name="address1" size="45" value="${customer.addressLine1}" placeholder="Address Line 1" class="form-control"> 
                    </div>
                    
                     <div class="input-group input-group-outline mb-3">                     
                      <input type="text" id="address2" name="address2" size="45" value="${customer.addressLine2}" placeholder="Address Line 2" class="form-control"> 
                    </div>
                    
                     <div class="input-group input-group-outline mb-3">                     
                      <input type="text" id="city" name="city" size="45" value="${customer.city}" placeholder="City" class="form-control"> 
                    </div>
                    
                     <div class="input-group input-group-outline mb-3">                     
                      <input type="text" id="state" name="state" size="45" value="${customer.state}" placeholder="State" class="form-control"> 
                    </div>
                    
                     <div class="input-group input-group-outline mb-3">                     
                      <input type="text" id="zipCode" name="zipCode" size="45" value="${customer.zipcode}" placeholder="Zip Code" class="form-control"> 
                    </div>
                    <label>Country</label>
                     <div class="input-group input-group-outline mb-3">                     
                     	<select class="form-select" name="country" id="country">
                     		<c:forEach items="${mapCountries }" var="country">
                     			<option value="${country.value }" <c:if test='${customer.country eq country.value}'>selected='selected'</c:if> >${country.key } </option>
                     		</c:forEach>
                     	</select>
                    </div>
                                                                                  
                    
                   <br>
                    <div class="text-center">
                      <button type="submit" class="btn btn-lg bg-gradient-warning">Submit</button>
                      <button type="button" class="btn btn-lg bg-gradient-warning" id="buttonCancel">Cancel</button>
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
				firstname: "required",
				lastname: "required",
				password: "required",
				
				confirmPassword: {
					required: true,
					equalTo: "#password"
				},
				
				phone: "required",								
				address1: "required",
				address2: "required",
				city: "required",
				state: "required",
				zipCode: "required",
				country: "required",
			},
			
			messages: {
				email: {
					required: "Please enter e-mail address",
					email: "Please enter a valid e-mail address"
				},
				
				firstname: "Please enter first name",
				lastname: "Please enter last name",
				password: "Please enter password",
				
				confirmPassword: {
					required: "Please confirm password",
					equalTo: "Confirm password does not match password"
				},
				
				phone: "Please enter phone number",								
				address1: "Please enter address line 1",
				address2: "Please enter address line 2",
				city: "Please enter city",
				state: "Please enter state",
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