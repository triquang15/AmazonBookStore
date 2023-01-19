<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="../assets/img/icon.png">
<title>Manager Books - Amazon Book Store</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->

  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
   <link href="../assets/css/jquery-ui.min.css" rel="stylesheet" />
   <link href="../assets/css/richtext.min.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.0.4" rel="stylesheet" />
  <script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../assets/js/jquery.validate.min.js"></script>
  <script type="text/javascript" src="../assets/js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="../assets/js/jquery.richtext.min.js"></script>
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
                	<c:if test="${book != null }">
                  		<h4 class="font-weight-bolder">Edit Book</h4>
                   </c:if>
                   <c:if test="${book == null }">
                  		<h4 class="font-weight-bolder">Create New Book</h4>
                   </c:if>
                </div>
                 <br>
                 <c:if test="${message != null}">
               		 <p class="text-center" style="color: red;">${message }</p>
                	</c:if> <br>
                <div class="card-body">
               	  <c:if test="${book != null }">
                    <form action="update_book" method="post" role="form" id="bookForm" enctype="multipart/form-data">
                    <input type="hidden" name="bookId" value="${book.bookId}">
                  </c:if>
                  
                   <c:if test="${book == null }">
                    <form action="create_book" method="post" role="form" id="bookForm" enctype="multipart/form-data">
                  </c:if>
                  
                  	<div class="input-group input-group-outline mb-3">                   
                      	<select name="category" class="form-select">
                      		<c:forEach items="${listCategory}" var="category">
                      			<option value="${category.categoryId }">
                      				${category.name}
                      			</option>
                      		</c:forEach>
                      	</select>
                    </div>
                  	<div class="input-group input-group-outline mb-3">
               
                      <input type="text" id="title" name="title" class="form-control" size="20" placeholder="Title" value="${book.title }">
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      
                      <input type="text" id="author" name="author" class="form-control" size="20" placeholder="Author" value="${book.author }">
                    </div>
                    
                    <div class="input-group input-group-outline mb-3">
                      
                      <input type="text" id="isbn" name="isbn" class="form-control" size="20" placeholder="ISBN" value="${book.isbn }"> 
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      
                      <input type="text" id="price" name="price" class="form-control" size="20" placeholder="Price" value="${book.price }"> 
                    </div>
                  
                    <div class="input-group input-group-outline mb-3"> 
                      <input type="text" id="publishDate" name="publishDate" class="form-control"
                       size="20" placeholder="Publish Date" value="<fmt:formatDate pattern='MM/dd/yyyy' value='${book.published}' />" />
                    </div>    
                     <div class="mb-3"> 
                      <label for="formFile" class="form-label">File Image(*)</label>
 						<input type="file" id="bookImage" name="bookImage" size="20" /><br/>
						<img class="form-control" id="thumbnail" alt="Image Preview" style="width:20%; margin-top: 10px"
						src="data:image/jpg;base64,${book.base64Image}"
					 />
                    </div>                                 
                      <div class="input-group">
                      	<textarea rows="3" cols="30" class="form-control" id="description" name="description" >${book.description}</textarea>
                    </div>
                    
                   <br>
                    <div class="text-center">
                      <button type="submit" class="btn btn-lg bg-gradient-warning">Submit</button>
                      <button type="button" class="btn btn-lg bg-gradient-warning" onclick="javascript:history.go(-1);">Cancel</button>
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
		$('#publishDate').datepicker();
		$('#description').richText();
		
		$('#bookImage').change(function() {
			showImageThumbnail(this);
		});
		
		
		$("#bookForm").validate({
			rules: {
				category: "required",
				title: "required",
				author: "required",
				isbn: "required",
				publishDate: "required",
				
				<c:if test="${book == null}">
				bookImage: "required",
				</c:if>
				
				price: "required",
				description: "required",
			},
			
			messages: {
				category: "Please select a category for the book",
				title: "Please enter title of the book",
				author: "Please enter author of the book",
				isbn: "Please enter ISBN of the book",
				publishDate: "Please enter publish date of the book",
				bookImage: "Please choose an image of the book",
				price: "Please enter price of the book",
				description: "Please enter description of the book"
			}
		});
		
	});
	
	function showImageThumbnail(fileInput) {
		var file = fileInput.files[0];
		
		var reader = new FileReader();
		
		reader.onload = function(e) {
			$('#thumbnail').attr('src', e.target.result);
		};
		
		reader.readAsDataURL(file);
	}
</script>
</html>