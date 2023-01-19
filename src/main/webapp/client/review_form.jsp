<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
</head>
<body>
   
 <header>
        <!-- Header Start -->
	<jsp:directive.include file="header.jsp" />
        <!-- Header End -->

    </header>
    <main>
       
        <!--================login_part Area =================-->
        <section class="login_part section_padding ">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_text text-center">
                            <div class="login_part_text_iner">
                                <h2 id="book-title">${book.title}</h2>                            
                               <img style="height: 300px;" src="data:image/jpg;base64,${book.base64Image}" /> <br><br>
                                <p>Help with your account | Subscriptions | Unsubscribe | Terms of Use and Privacy | Cookie Preferences</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="login_part_form">
                            <div class="login_part_form_iner">
                                <h3>Review this product</h3>
                                  
                                <form class="row contact_form" id="reviewForm" action="submit_review" method="post">
                                    <div class="col-md-12 form-group p_star">
                                   		<div id="rateYo"></div>
                                        <input type="hidden" id="rating" name="rating" />
										<input type="hidden" name="bookId" value="${book.bookId}" />
                                    </div>
                                     <div class="col-md-12 form-group p_star">
                                        <input type="text" class="form-control" name="headline" size="60" placeholder="Headline" />
                                    </div>
                                     <div class="col-md-12 form-group p_star">
                                        <textarea name="comment" cols="50" rows="5" placeholder="Write your review details..." ></textarea>
                                    </div>
                                   
                                    <div class="col-md-12 form-group">                                      
                                        <button type="submit" value="submit" class="button button-contactForm btn_3 boxed-btn">
                                            Submit
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
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
		
		$("#reviewForm").validate({
			rules: {
				headline: "required",
				comment: "required"
			},
			
			messages: {
				headline: "Please enter headline",				
				comment: "Please enter review details"
			}
		});

		
		$("#rateYo").rateYo({
			starWidth: "40px",
			fullStar: true,
			onSet: function (rating, rateYoInstance) {
				$("#rating").val(rating);
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