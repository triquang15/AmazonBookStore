<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                           
                  <h4 class="font-weight-bolder">Update Order</h4>               
                </div>
            
                <p class="text-center" style="color: red;">${message }</p> <br>
                <div class="card-body">
                <form action="update_order" method="post" id="orderForm">
                  	<label>Customer:</label>
                  	<div class="input-group input-group-outline mb-3">  
                      <input type="text" value="${order.customer.fullname}" class="form-control" readonly="readonly"/>
                    </div>
                     <label>Order Date:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" value="${order.orderDate}" class="form-control" readonly="readonly"/>
                    </div>
                    
                    <label>First Name:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" id="firstname" name="firstname" value="${order.firstname}" size="45" class="form-control" placeholder="First Name"/>
                    </div>
                    
                     <label>Last Name:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" id="lastname" name="lastname" value="${order.lastname}" size="45" class="form-control" placeholder="Last Name"/>
                    </div>
                    
                    <label>Phone:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" id="phone" name="phone" value="${order.phone}" size="45" class="form-control" placeholder="Phone"/>
                    </div>
                    <label>Address Line 1:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" id="addressLine1" name="addressLine1" value="${order.addressLine1}" size="45" class="form-control" placeholder="Address Line 1"/>
                    </div>
                    <label>Address Line 2:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" id="addressLine2" name="addressLine2" value="${order.addressLine2}" size="45" class="form-control" placeholder="Address Line 2"/>
                    </div>
                    
                    <label>City:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" id="city" name="city" value="${order.city}" size="45" class="form-control" placeholder="City"/>
                    </div>
                    
                    <label>State:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" id="state" name="state" value="${order.state}" size="45" class="form-control" placeholder="State"/>
                    </div>
                    
                    <label>Zip Code:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <input type="text" id="zipcode" name="zipcode" value="${order.zipcode}" size="45" class="form-control" placeholder="Zip Code"/>
                    </div>
                    
                    <label>Country:</label>
                    <div class="input-group input-group-outline mb-3">  
                      <select class="form-select" name="country" id="country">
                     		<c:forEach items="${mapCountries }" var="country">
                     			<option value="${country.value }" <c:if test='${customer.country eq country.value}'>selected='selected'</c:if> >${country.key } </option>
                     		</c:forEach>
                     	</select>
                    </div>
                    
                    <label>Payment Method:</label>
                    <div class="input-group input-group-outline mb-3">  
                     <select name="paymentMethod"  class="form-select">
						<option value="Cash On Delivery" <c:if test="${order.paymentMethod eq 'Cash On Delivery' }">selected='selected'</c:if> >Cash On Delivery</option>
						<option value="PayPal" <c:if test="${order.paymentMethod eq 'PayPal' }">selected='selected'</c:if>>PayPal</option>
					</select>
                    </div>
                    
                    <label>Order Status:</label>
                    <div class="input-group input-group-outline mb-3">  
                     <select name="orderStatus"  class="form-select">
						<option value="Processing" <c:if test="${order.status eq 'Processing' }">selected='selected'</c:if> >Processing</option>
						<option value="Shipping" <c:if test="${order.status eq 'Shipping' }">selected='selected'</c:if>>Shipping</option>
						<option value="Delivered" <c:if test="${order.status eq 'Delivered' }">selected='selected'</c:if>>Delivered</option>
						<option value="Completed" <c:if test="${order.status eq 'Completed' }">selected='selected'</c:if>>Completed</option>
						<option value="Cancelled" <c:if test="${order.status eq 'Cancelled' }">selected='selected'</c:if>>Cancelled</option>
					</select>
                    </div>
                    
                    <div align="center">
				<h3>Ordered Books</h3>
		<table class="table table-striped table-hover">
			  <thead>
			    <tr>
			      <th scope="col">Index</th>
			      <th scope="col">Book Title</th>
			      <th scope="col">Author</th>
			      <th scope="col">Price</th>
			      <th scope="col">Quantity</th>
			      <th scope="col">Subtotal</th>
			      <th scope="col">Tax</th>
			      <th scope="col">Shipping Fee</th>
			      <th scope="col">Action</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
			    <tr>
			      	<td>${status.index + 1}</td>
					<td>${orderDetail.book.title}</td>
					<td>${orderDetail.book.author}</td>
					<td><input type="hidden" name="price" value="${orderDetail.book.price}" />
						$${orderDetail.book.price}</td>
					<td>
						<input type="hidden" name="bookId" value="${orderDetail.book.bookId}" />
						<input type="text" name="quantity${status.index + 1}" value="${orderDetail.quantity}" size="3" />
					</td>
					<td>$${orderDetail.subtotal}</td>
					<td><input type="text" size="3" name="tax" id="tax" value="${order.tax }" /></td>
					<td><input type="text" size="3" name="shippingFee" id="shippingFee" value="${order.shippingFee }" /></td>
					<td><a href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a></td>
			    </tr>			   
			   </c:forEach>
			    <tr>
			    
				<td align="center">
					<b><i>TOTAL:</i></b>
				</td>
				<td>
					<b>${order.bookCopies}</b>
				</td>
				<td>
					<b>$${order.total}</b>
				</td>
				<td>
					<a style="color: blue;" href="javascript:showAddBookPopup()"><b>Add Items</b></a>
				</td>
				<td></td>
			</tr>
			  </tbody>
	</table>
	</div>
                   
                    <div class="text-center">
                    
                      <button type="submit" class="btn btn-lg bg-gradient-warning">Submit</button> &nbsp;&nbsp;&nbsp;
                      <button type="button" class="btn btn-lg bg-gradient-warning " onclick="javascript:window.location.href='list_order';">Cancel</button>
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
<script>
		function showAddBookPopup() {
			var width = 600;
			var height = 250;
			var left = (screen.width - width) / 2;
			var top = (screen.height - height) / 2;
			
			window.open('add_book_form', '_blank', 
					'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
		}
		
		$(document).ready(function() {
			$("#orderForm").validate({
				rules: {	
					firstname: "required",
					lastname: "required",
					phone: "required",
					city: "required",
					zipcode: "required",
					state: "required",
					country: "required",
					addressLine1: "required",
					addressLine2: "required",
					
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
						quantity${status.index + 1}: {
							required: true, number: true, min: 1
						},
					</c:forEach>	
						
					shippingFee: {required: true, number: true, min: 0},
					tax: {required: true, number: true, min: 0}
				},
				
				messages: {
					firstname: "Please enter first name",
					lastname: "Please enter last name",
					phone: "Please enter phone",
					zipcode: "Please enter zipcode",
					state: "Please enter state",
					city: "Please enter city",
					country: "Please select country",
					addressLine1: "Please enter address line 1",
					addressLine2: "Please enter address line 2",
					
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
						quantity${status.index + 1}: { 
							required: "Please enter quantity",
							number: "Quantity must be a number",
							min: "Quantity must be greater than 0"
						},
					</c:forEach>	
						
						shippingFee: {
							required: "Please enter shipping fee",
							number: "Shipping fee must be a number",
							min: "Shipping fee must be greater than 0"
						},
						
						tax: {
							required: "Please enter tax",
							number: "Tax must be a number",
							min: "Tax must be greater than 0"
						}
				}
			});
			
		});		
	</script>
</html>