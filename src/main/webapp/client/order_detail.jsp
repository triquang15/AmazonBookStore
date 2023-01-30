<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>My Orders - Amazon Books Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/icon.png">
    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/flaticon.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="./assets/js/jquery.validate.min.js"></script>
</head>
<body>
   
 <header>
        <!-- Header Start -->
	<jsp:directive.include file="header.jsp" />
        <!-- Header End -->

    </header>       
          <main>
       
          <!--================Checkout Area =================-->
        <section class="checkout_area">
          <div class="container">
            <div class="returning_customer">
              <div class="check_title">
                <h3 class="text-center">
                   ORDERS DETAILS
                </h3>
              </div>
              
              <c:if test="${order == null}">
	              <p class="text-center" style="color: red;">
	                Sorry, you are not authorized to view this order.
	              </p>
              </c:if>
              
            </div>
          
            <div class="billing_details ">
              <div class="row">
              
              <table class="table table-hover">
			<tr>
				<td><b>Order Status: </b></td>
				<td>${order.status}</td>
			</tr>		
			<tr>
				<td><b>Order Date: </b></td>
				<td>${order.orderDate}</td>
			</tr>			
			<tr>
				<td><b>Quantity: </b></td>
				<td>${order.bookCopies}</td>
			</tr>
			<tr>
				<td><b>Total Amount: </b></td>
				<td>$${order.total}</td>
			</tr>			
			<tr>
				<td><b>Recipient Name: </b></td>
				<td>${order.recipientName}</td>
			</tr>
			<tr>
				<td><b>Recipient Phone: </b></td>
				<td>${order.recipientPhone}</td>
			</tr>
			<tr>
				<td><b>Ship to: </b></td>
				<td>${order.shippingAddress}</td>
			</tr>			
			<tr>
				<td><b>Payment Method: </b></td>
				<td>${order.paymentMethod}</td>
			</tr>
												
		</table>
                
			<table border="1" cellpadding="5" class="table table-striped">
				<tr>
					<th>No</th>
					<th>Book</th>
					<th>Author</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Subtotal</th>
				</tr>
				<c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
				<td>
					<img style="vertical-align: middle;" src="data:image/jpg;base64,${orderDetail.book.base64Image}" width="48" height="64" />
					${orderDetail.book.title}
				</td>
				<td>${orderDetail.book.author}</td>
				<td>$${orderDetail.book.price}</td>
				<td>${orderDetail.quantity}</td>
				<td>$${orderDetail.subtotal}</td>
				</tr>
				</c:forEach>
				<tr>
				<td colspan="4" align="right">
					<b><i>TOTAL:</i></b>
				</td>
				<td>
					<b>${order.bookCopies}</b>
				</td>
				<td>
					<b>$${order.total}</b>
				</td>
			</tr>
			</table>

            </div>
          </div>
        </section>
        <!--================End Checkout Area =================-->
    </main>
    <footer>
        <!-- Footer Start-->
<jsp:directive.include file="footer.jsp" />
        <!-- Footer End-->
    </footer>
    <!--? Search model Begin -->
    <div class="search-model-box">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-btn">+</div>
            <form class="search-model-form" action="search" method="get">
                <input type="text" id="search-input" placeholder="Search for anything....." name="keyword" size="50" >
            </form>
        </div>
    </div>
    <!-- Search model end -->
    
    <!-- JS here -->
  

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>

    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    
    <!-- Scroll up, nice-select, sticky -->
    <script src="./assets/js/jquery.scrollUp.min.js"></script>
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>

</body>
    
</html>