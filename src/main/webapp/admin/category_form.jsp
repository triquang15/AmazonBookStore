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

	<main class="main-content  mt-0">
    <section>
      <div class="page-header min-vh-100">
        <div class="container">
          <div class="row">
              <div class="card card-plain">
                <div class="card-header">
                  <h4 class="font-weight-bolder">Create New Category</h4>
                </div>
                 <br>
                <p class="text-center" style="color: red;">${message }</p> <br>
                <div class="card-body">
                  <form action="create_category" method="post" onsubmit="return validateFormInput()" role="form">
                  <input type="hidden" name="categoryId" id="categoryId" value="${category.categoryId }">
                  	<div class="input-group input-group-outline mb-3">  
                      <input type="text" id="name" name="name" value="${category.name }" class="form-control" placeholder="Name">
                    </div>
                   
                    <div class="text-center">
                      <button type="submit" class="btn btn-lg bg-gradient-primary">Submit</button> &nbsp;&nbsp;&nbsp;
                      <button type="button" class="btn btn-lg bg-gradient-primary " onclick="javascript:history.go(-1);">Cancel</button>
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
	function validateFormInput(){
		var fieldName = document.getElementById("name");
		if(fieldName.value.length == 0){
			alert("Category name is required! ");
			fieldName.focus();
			return false;
		}
		return true;
	}
</script>
</html>