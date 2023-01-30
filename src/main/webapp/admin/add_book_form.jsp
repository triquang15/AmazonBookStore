<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Book to Order</title>
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
                	
                   
                  		<h4 class="font-weight-bolder">Add book to Order ID: ${order.orderId}</h4>
                 
                </div>
                 <br>
                 <br>
                <div class="card-body">
               	 
                    <form action="add_book_to_order" method="post">
                   <label>Select a book:</label>  
                  	<div class="input-group input-group-outline mb-3">               
                     <select class="form-select" name="bookId">
						<c:forEach items="${listBook}" var="book" varStatus="status">
							<option value="${book.bookId}">${book.title} - ${book.author}</option>
						</c:forEach>
					</select>
                    </div>
                   
                    <label>Number of Copies</label>
                     <div class="input-group input-group-outline mb-3">                     
                     <select name="quantity" class="form-select">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
                    </div>
                    
      
                   <br>
                    <div class="text-center">
                      <button type="submit" class="btn btn-lg bg-gradient-warning">Submit</button>
                      <button type="button" class="btn btn-lg bg-gradient-warning" onclick="javascript: self.close();">Cancel</button>
                    </div>
                  </form>
                </div>     
              </div>
            </div>
          
        </div>
      </div>
    </section>
 
  </main>
	
	</main>
</body>

</html>