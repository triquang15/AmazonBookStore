<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Users - Amazon Book Store</title>
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
<body class="g-sidenav-show  bg-gray-200">
<jsp:directive.include file="sidebar.jsp" />
<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
	<jsp:directive.include file="navbar.jsp" />

	<div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                <h5 class="text-white text-capitalize ps-3">Users Management</h5>   
              </div>
            </div>
            <h6>${message }</h6>
            <a href="user_form.jsp">Create New User</a>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0" align="center">
                  <thead>
                    <tr>
                      <th class="text-secondary opacity-7">UserId</th>
                      <th class="text-secondary opacity-7">Email</th>
                      <th class="text-secondary opacity-7">Full Name</th>
                      <th class="text-secondary opacity-7">Action</th>
                    </tr>
                  </thead>
                  <c:forEach var="user" items="${listUsers }">
                  <tbody>
                    <tr>
                      <td>
                      	<div class="d-flex flex-column justify-content-center">
                        	<p class="text-xs font-weight-bold mb-0">${user.userId }</p>
                        </div>
                      </td>    
                      <td>
                      	<div class="d-flex flex-column justify-content-center">
                        	<p class="text-xs font-weight-bold mb-0">${user.email }</p>
                        </div>
                      </td>
                      <td>
                      	<div class="d-flex flex-column justify-content-center">
                      		<p class="text-xs font-weight-bold mb-0">${user.fullName }</p>  
                      	</div>
                      </td>
                      
                      <td class="align-middle">
                        <a href="edit_user?id=${user.userId}" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          Edit
                        </a>&nbsp;
                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          Delete
                        </a>
                      </td>
                    </tr>
                   
                  </tbody>
                  </c:forEach>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
	
	
		
	</main>
</body>
</html>