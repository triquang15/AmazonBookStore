<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Amazon Book Store | Customer Profile</title>
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
       
        <!--================login_part Area =================-->
        <section class="login_part ">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_text text-center">
                            <div class="login_part_text_iner">
                                <h2>Do you already have an account ?</h2>
                                <p>Help with your account | Subscriptions | Unsubscribe | Terms of Use and Privacy | Cookie Preferences</p>
                                <a href="${pageContext.request.contextPath}/" class="btn_3">Home Page</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3>Profile & settings</h3>
  
                                    <h3>${message}</h3>
                                <form class="row contact_form" action="update_profile" method="post" id="customerForm">
                                    <div class="col-md-12 form-group p_star ">
                                    <label style="color: red;">Email(*)</label>
                                        <input type="text" class="form-control" placeholder="${loggedCustomer.email}" readonly="readonly">
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="firstname" name="firstname" size="45"
                                            placeholder="First Name(*)" value="${loggedCustomer.firstname}">
                                    </div>
                                     <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="lastname" name="lastname" size="45"
                                            placeholder="Last Name(*)" value="${loggedCustomer.lastname}">
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="password" name="password" size="15" 
                                            placeholder="Password">
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" size="15" 
                                            placeholder="Confirm Password">
                                    </div>
                                     <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="phone" name="phone" size="15"
                                            placeholder="Phone(*)" value="${loggedCustomer.phone}">
                                    </div>
                                    
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="address1" name="address1" size="45"
                                            placeholder="Address Line 1(*)" value="${loggedCustomer.addressLine1}">
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="address2" name="address2" size="45"
                                            placeholder="Address Line 2(*)" value="${loggedCustomer.addressLine2}">
                                    </div>
                                    
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="city" name="city" size="45"
                                            placeholder="City(*)" value="${loggedCustomer.city}">
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="state" name="state" size="45"
                                            placeholder="State" value="${loggedCustomer.state}">
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" id="zipCode" name="zipCode" size="45"
                                            placeholder="Zip Code(*)" value="${loggedCustomer.zipcode}">
                                    </div>
                                    <div class="col-md-12 form-group p_star">
                                       <select class="form-select" name="country" id="country">
			                     		<c:forEach items="${mapCountries }" var="country">
			                     			<option value="${country.value }" <c:if test='${loggedCustomer.country eq country.value}'>selected='selected'</c:if> >${country.key } </option>
			                     		</c:forEach>
                     			</select>
                                    </div>
                                    
                                    <div class="col-md-12 form-group">                                      
                                        <button type="submit" value="submit" class="btn_3">
                                            Update an Account
                                        </button>
                                       
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================login_part end =================-->
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
		$("#customerForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				firstname: "required",
				lastname: "required",
				
				confirmPassword: {
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
				
				confirmPassword: {
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