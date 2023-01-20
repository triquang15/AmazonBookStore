<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Amazon Books Store</title>
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
			<h1 class="text-center">Your Shopping Cart</h1> <br>
			
			<c:if test="${message != null}">
				<div align="center">
					<h3 style="color: red;">${message}</h3>
				</div>
			</c:if>
			
			<c:set var="cart" value="${sessionScope['cart']}" />
			
			<c:if test="${cart.totalItems == 0}">
				<h2 class="text-center">There's no items in your cart</h2>
			</c:if>
		
        <div class="container">
        
         <c:if test="${cart.totalItems > 0}">
         <form action="update_cart" method="post" id="cartForm">
          <div class="cart_inner">
            <div class="table-responsive">        
              <table class="table">
                <thead>
                  <tr>
                  <th scope="col">No</th> 
                    <th scope="col">Book</th>                   
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Subtotal</th>
                    <th scope="col">Action</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${cart.items}" var="item" varStatus="status" >
                  <tr>
                  <td>${status.index + 1}</td>
                    <td>
                      <div class="media">
                        <div class="d-flex">
                          <img src="data:image/jpg;base64,${item.key.base64Image}" style="width: 100px; height: 150px;" />
                        </div>
                        <div class="media-body">
                          <p id="book-title">${item.key.title}</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <h5>${item.key.price}</h5>
                    </td>
                    <td>
                      <div class="product_count">
                       <input type="hidden" name="bookId" value="${item.key.bookId}" />
                       <input type="text" name="quantity${status.index + 1}" value="${item.value}" size="5" />
                      </div>
                    </td>
                    <td>
                      <h5>$ ${item.value * item.key.price}</h5>
                    </td>
                    <td><a style="color: red;" href="remove_from_cart?book_id=${item.key.bookId}">Remove</a></td>
                  </tr>
                
                  </c:forEach>
                  <tr class="bottom_button">
                    <td>
                      <button class="btn primary" type="submit">Update Cart</button>
                    </td>
                    <td></td>
                    <td></td>
                    <td>
                      <div class="cupon_text float-right">
                      <input class="btn primary" type="button" id="clearCart" value="Clear Cart"/>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td><h5>Items: ${cart.totalQuantity} book(s)</h5></td> <br>
                    <td>
                      <h5>Total: $ ${cart.totalAmount}</h5>
                    </td>
                    
                  </tr>
                 
                </tbody>
              </table>
              <div class="checkout_btn_inner float-right">
                <a class="btn primary" href="${pageContext.request.contextPath}/">Continue Shopping</a>
                <a class="btn primary checkout_btn_1" href="checkout">Proceed to checkout</a>
              </div>
            </div>
          </div>
          </form>
          </c:if>

      <!--================End Cart Area =================-->
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
<script type="text/javascript">
	
		$(document).ready(function() {
			$("#clearCart").click(function() {
				window.location = 'clear_cart';
			});
			
			$("#cartForm").validate({
				rules : {
					<c:forEach items="${cart.items}" var="item" varStatus="status">
						quantity${status.index + 1}: {
							required: true, number: true, min: 1
						},
					</c:forEach>
				},

				messages : {
					<c:forEach items="${cart.items}" var="item" varStatus="status">
						quantity${status.index + 1}: { 
							required: "Please enter quantity",
							number: "Quantity must be a number",
							min: "Quantity must be greater than 0"
						},
					</c:forEach>					
				}
			});

		});
	</script>
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