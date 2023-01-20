 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
  <!--? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/amazon.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start --> 
        <div class="header-area">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="${pageContext.request.contextPath}/"><img src="assets/img/logo/amazon.png" style="width: 40%;"></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu d-none d-lg-block">
                            <nav>                                                
                                <ul id="navigation">  
                                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                                    <li><a href="#">About</a></li>
                                    <li class="hot"><a href="#">Category</a>
                                        <ul class="submenu">
                                        <c:forEach var="category" items="${listCategory}" varStatus="status">
                                            <li><a href="view_category?id=${category.categoryId}"> <font size="+1"><b><c:out value="${category.name}" /></b></font></a></li>
                                           </c:forEach>
                                        </ul>
                                    </li>
                                     <li><a href="#">Contact</a></li>
                                     <c:if test="${loggedCustomer != null}">
                                     <li><a class="flaticon-user" href="#">&nbsp;Account</a>
                                        <ul class="submenu">
                                            <li><a href="view_profile" style="color: red;">${loggedCustomer.fullname}</a></li>
                                            <li><a href="view_orders">My Orders</a></li>
                                            <li><a href="logout">Logout</a></li>
                                        </ul>                                   
                                    </li>    
                                     </c:if>                              
                                   
                                </ul>
                            </nav>
                        </div>
                        <!-- Header Right -->
                        <div class="header-right">
                            <ul>
                                <li>
                                    <div class="nav-search search-switch">
                                        <span class="flaticon-search"></span>
                                    </div>
                                </li>
                                
                                <c:if test="${loggedCustomer == null}">
                               		 <li> <a href="login"><span class="flaticon-user"></span></a></li>
                                </c:if>                             
                               <li><a href="view_cart"><span class="flaticon-shopping-cart"></span></a></li>
                            </ul>
                        </div>
                    </div>
                
                    
                   
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none">	
                        </div>
                    </div>
                </div>
            </div>
        </div>