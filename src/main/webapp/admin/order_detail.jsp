<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Details - Amazon Book Store</title>
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
<br>

	<div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-warning shadow-warning border-radius-lg pt-4 pb-3 text-center">
                <h5><a class="text-white text-capitalize ps-3" href="#">Order Details</a></h5>   
              </div>
            </div> <br>
            
            <h5 class="text-center" style="color: #32CD32;">${message }</h5>
           
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center justify-content-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Index</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Book</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Image</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Author</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Price</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Quantity</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Subtotal</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Action</th>
                    </tr>
                  </thead>
                  <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
                  <tbody>
                    <tr>
                    <td>
                      	<div class="d-flex flex-column justify-content-center">
                        	<p class="text-xs font-weight-bold mb-0">${status.index + 1}</p>
                        </div>
                      </td>  
                      <td>
                      	<div class="d-flex flex-column justify-content-center">
                        	<p class="text-xs font-weight-bold mb-0">${orderDetail.book.title}</p>
                        </div>
                      </td>   
                      <td>
                      	<div class="d-flex flex-column justify-content-center">
                        	<img src="data:image/jpg;base64,${orderDetail.book.base64Image}" width="80">
                        </div>
                      </td> 
                      <td>
                      	<div class="d-flex flex-column justify-content-center">
                        	<p class="text-xs font-weight-bold mb-0">${orderDetail.book.author}</p>
                        </div>
                      </td>
                      <td>
                      	<div class="d-flex flex-column justify-content-center">
                      		<p class="text-xs font-weight-bold mb-0">$ ${orderDetail.book.price}</p>  
                      	</div>
                      </td>
                       <td>
                      	<div class="d-flex flex-column justify-content-center">
                      		<p class="text-xs font-weight-bold mb-0">${orderDetail.quantity}</p>  
                      	</div>
                      </td>
         
                      <td>
                      	<div class="d-flex flex-column justify-content-center">
                      		<p class="text-xs font-weight-bold mb-0">$ ${orderDetail.subtotal}</p>  
                      	</div>
                      </td>
                      
                      
                      <td class="align-middle">
                                         	
                        <a href="edit_order?id=${order.orderId}" class="text-secondary font-weight-bold text-xs">
                          <i class="fa fa-pencil-square-o" aria-hidden="true">&nbsp;Edit</i> |
                        </a>&nbsp;
                        <a href="javascript:void(0);" class="text-secondary font-weight-bold text-xs">
                          <i class="fa fa-trash-o deleteLink" id="${order.orderId}" aria-hidden="true" style="color: red;">&nbsp;Delete</i>
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
	
<script>
		$(document).ready(function() {
			$(".deleteLink").each(function() {
				$(this).on("click", function() {
					orderId = $(this).attr("id");
					if (confirm('Are you sure you want to delete the order with ID ' +  orderId + '?')) {
						window.location = 'delete_order?id=' + orderId;
					}					
				});
			});
		});
	</script>
</body>

</html>