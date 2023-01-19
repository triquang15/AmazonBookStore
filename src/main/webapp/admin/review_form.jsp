<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amazon Book Store</title>
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
                <div class="card-header">
                           
                  <h4 class="font-weight-bolder">Update Review</h4>               
                </div>
            
                <p class="text-center" style="color: red;">${message }</p> <br>
                <div class="card-body">
                <form action="update_review" method="post" id="reviewForm">
					<input type="hidden" name="reviewId" value="${review.reviewId}">
                  	<label>Book:</label>
                  	<div class="input-group input-group-outline mb-3">  
                      <input type="text" value="${review.book.title}" class="form-control" readonly="readonly"/>
                    </div>
                     <label>Rating:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" value="${review.rating}" class="form-control" readonly="readonly"/>
                    </div>
                    
                    <label>Customer:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" value="${review.customer.fullname}" class="form-control" readonly="readonly"/>
                    </div>
                    
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" name="headline" value="${review.headline}" class="form-control" placeholder="Headline"/>
                    </div>
                     <div class="input-group input-group-outline mb-3">  
                     <textarea rows="5" cols="70" name="comment" class="form-control">${review.comment}</textarea>
                    </div>
                   
                    <div class="text-center">
                      <button type="submit" class="btn btn-lg bg-gradient-warning">Submit</button> &nbsp;&nbsp;&nbsp;
                      <button type="button" class="btn btn-lg bg-gradient-warning " onclick="javascript:history.go(-1);">Cancel</button>
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
	$("#reviewForm").validate({
		rules: {	
			headline: "required",
			comment: "required"
		},
		
		messages: {
			headline: "Please enter headline",
			comment: "Please enter comment",
		}
	});
	
	$("#buttonCancel").click(function() {
		history.go(-1);
	});	
});
</script>
</html>