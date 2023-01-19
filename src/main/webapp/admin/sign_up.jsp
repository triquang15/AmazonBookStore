<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="shortcut icon" type="image/x-icon" href="../assets/img/icon.png">
   <script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../assets/js/jquery.validate.min.js"></script>
  <title>
    Amazon Book Store | Sign up
  </title>
  <!--     Fonts and icons     -->
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
</head>

<body class="bg-gray-200">
  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">
     
      </div>
    </div>
  </div>
  <main class="main-content  mt-0">
    <div class="page-header align-items-start min-vh-100" style="background-image: url('https://4kwallpapers.com/images/walls/thumbs_3t/5898.jpg');">
      <span class="mask bg-gradient-dark opacity-6"></span>
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom"> <br>
            
           
            <div align="center">
             	<c:if test="${user == null}">
              		<h4>Get started on Amazon today</h4>
              	</c:if>
              	<c:if test="${user != null}">
              		<h4>Update Account</h4>
              	</c:if>
              	</div>
               <c:if test="${message != null }">
                 	<div align="center">
                 		<p style="color: red">${message }</p>
                	</div>
                 	
                 </c:if>
                 
              <div class="card-body">
              	<c:if test="${user == null}">
               		 <form action="create_user" method="post" id="userForm" class="text-start">
                </c:if>
                <c:if test="${user != null}">
               		 <form action="update_user" method="post" id="userForm" class="text-start">
               		 <input type="hidden" name="userId" value="${user.userId}">
                </c:if>
                
                  <div class="input-group input-group-outline my-3">
                    <input type="email" id="email" name="email" placeholder="Email address" size="45" value="${user.email}" class="form-control">
                  </div>
                  
                  <div class="input-group input-group-outline my-3">
                    <input type="text" id="fullName" name="fullName" class="form-control" size="45" value="${user.fullName}" placeholder="Full Name">
                  </div>

                  <div class="input-group input-group-outline mb-3">
                    <input type="password" id="password" name="password" placeholder="Password" size="20" value="${user.password}" class="form-control">
                  </div>
              
                  <div class="text-center">
                    <button type="submit" class="btn bg-gradient-warning">Submit</button>&nbsp;&nbsp;
                    <button type="submit" id="buttonCancel" class="btn bg-gradient-warning">Cancel</button>
                  </div>
                  
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer position-absolute bottom-2 py-2 w-100">
        <div class="container">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-12 col-md-6 my-auto">
              <div class="copyright text-center text-sm text-white text-lg-start">
               © 1996-<script>
                  document.write(new Date().getFullYear())
                </script>, Amazon Book Store, Inc. or its affiliates
              </div>
            </div>
            <div class="col-12 col-md-6">
              <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                <li class="nav-item">
                  <a href="#" class="nav-link text-white" target="_blank">Terms of Service</a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link text-white" target="_blank">Privacy</a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link text-white" target="_blank">Cookies</a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link pe-0 text-white" target="_blank">Conditions of Use </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </main>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
 <script type="text/javascript">

	$(document).ready(function() {
		$("#userForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
		
				fullName: "required",
				password: "required",
			},
			
			messages: {
				email: {
					required: "Please enter email",
					email: "Please enter an valid email address"
				},
				
				fullName: "Please enter full name",
				password: "Please enter password"
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
</script>
</body>

</html>