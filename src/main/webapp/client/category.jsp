 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="menu-wrapper">
 	<div class="main-menu d-none d-lg-block">
 		
	    	<nav>                                                
	    		<ul id="navigation">  
	    			<li><a href="#">List Category</a>
                		<ul class="submenu">
                			<c:forEach var="category" items="${listCategory }" varStatus="status"> 
                   				<li><a href="view_category?id=${category.categoryId }">
	    							<c:out value="${category.name }"></c:out>
	    						</a></li>
	    						<c:if test="${not status.last }">
	    						
	    						</c:if>	
	    					</c:forEach>
                   		</ul>
                   		
                	</li>	
	    		</ul>    		
	    	</nav>
    	
    </div>
</div>