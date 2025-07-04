<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Product Feedback Collector</title>

    <!-- Custom fonts for this template-->
    <link
      href="vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    <style>
      .rating-input {
        display: flex;
        flex-direction: row-reverse;
        justify-content: flex-end;
      }

      .rating-input input {
        display: none;
      }

      .rating-input label {
        color: #ddd;
        font-size: 1.5rem;
        padding: 0 0.2rem;
        cursor: pointer;
        transition: color 0.2s;
      }

      .rating-input input:checked ~ label,
      .rating-input input:hover ~ label {
        color: #ffc107;
      }

      .rating-input label:hover,
      .rating-input label:hover ~ label {
        color: #ffc107;
      }

      .rating-input input:checked + label {
        color: #ffc107;
      }
    </style>
  </head>

  <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
          <!-- Topbar -->
         <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
  <!-- Sidebar Toggle (Topbar) -->
  <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
    <i class="fa fa-bars"></i>
  </button>

  <!-- Search Bar -->
  <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
    <div class="input-group">
      <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search">
      <div class="input-group-append">
        <button class="btn btn-primary" type="button">
          <i class="fas fa-search fa-sm"></i>
        </button>
      </div>
    </div>
  </form>

  <!-- Right Section -->
  <ul class="navbar-nav ml-auto align-items-center">
    <!-- Alerts 
    <li class="nav-item dropdown no-arrow mx-1">
      <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown">
        <i class="fas fa-bell fa-fw"></i>
        <span class="badge badge-danger badge-counter">0</span>
      </a>
      <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
        <h6 class="dropdown-header">Notifications</h6>
        <span class="dropdown-item text-muted">No new messages</span>
      </div>
    </li>
-->
    <div class="topbar-divider d-none d-sm-block"></div>

    <!-- Login Button -->
    <li class="nav-item">
      <a href="login.jsp" class="btn btn-primary ml-2 d-flex align-items-center">
        <i class="fas fa-sign-in-alt mr-1"></i> <span>Login to Give Feedback</span>
      </a>
    </li>
  </ul>
</nav>

          <!-- End of Topbar -->

          <!-- Begin Page Content -->
<div class="container-fluid">
  

  <!-- Product Cards Section -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Available Products for Feedback</h6>
    </div>
    <div class="card-body">
      <div class="row">

      
        <s:iterator value="products" var="p">

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card product-card h-100">
              <!-- Product Image -->
              <!-- Add loading="lazy" and explicit dimensions -->
	<img src="<s:property value='#p.thumbnail'/>"
     class="img-fluid mb-3 card-thumbnail"
     alt="Product Image"
     style="height: 220px; width: 100%; object-fit: contain; border-radius: 6px;">

              <!-- Card Body -->
              <div class="card-body">
                <h5 class="card-title"><s:property value="name"/></h5>
                <div class="product-meta mb-3">
                  <span class="badge badge-info"><s:property value="category"/></span>
                  <span class="text-muted small ml-2">
                    <!-- <i class="fas fa-calendar-alt"></i> Released: <s:property value="releaseDate"/> -->
                  </span>
                </div>
                
                <!-- Rating -->
                <div class="rating-stars mb-2">
                  <%
                    Double rating = (Double) pageContext.findAttribute("averageRating");
                    if (rating != null) {
                      int fullStars = (int) Math.floor(rating);
                      boolean halfStar = (rating - fullStars) >= 0.5;
                      for (int i = 0; i < fullStars; i++) {
                  %>
                        <i class="fas fa-star text-warning"></i>
                  <%
                      }
                      if (halfStar) {
                  %>
                        <i class="fas fa-star-half-alt text-warning"></i>
                  <%
                      }
                      for (int i = fullStars + (halfStar ? 1 : 0); i < 5; i++) {
                  %>
                        <i class="far fa-star text-warning"></i>
                  <%
                      }
                  %>
                    <span class="ml-2"><%= String.format("%.1f", rating) %></span>
                    <span class="text-muted small ml-2">(<s:property value="feedbackCount"/> reviews)</span>
                  <%
                    } else {
                  %>
                    <span class="text-muted">No ratings yet</span>
                  <%
                    }
                  %>
                </div>
                
                <!-- Description (truncated) -->
                <p class="card-text text-muted product-description">
                  <s:property value="description"/>
                </p>
              </div>
              
              <!-- Card Footer -->
             <!-- Card Footer -->
			<div class="card-footer bg-transparent">
			  <div class="row">
			    <div class="col-6 pr-1">
			    <button class="btn btn-info view-details-btn"
				  data-id="<s:property value='#p.id'/>"
				  data-name="<s:property value='#p.name'/>"
				  data-category="<s:property value='#p.category'/>"
				  data-sku="<s:property value='#p.sku'/>"
				  data-description="<s:property value='#p.description'/>"
				  data-thumbnail="<s:property value='#p.thumbnail'/>"
				  data-specs="<s:property value='#p.specifications'/>"
				  data-rating="<s:property value='#p.averageRating'/>"
				  data-feedback-count="<s:property value='#p.feedbackCount'/>"
				  data-gallery="<s:property value='#p.galleryImages'/>">
				  <i class="fas fa-eye mr-1"></i> Details
				</button>

			    </div>
			    <div class="col-6 pl-1">
			      <button type="button" class="btn btn-primary btn-block open-login-prompt">
				  <i class="fas fa-comment-alt mr-1"></i> Feedback
				</button>

			    </div>
			  </div>
			</div>
            </div>
          </div>
        </s:iterator>
      </div>
    </div>
  </div>
</div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright &copy; Product Feedback collector 2025</span>
            </div>
          </div>
        </footer>
        <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
   
   
    <!-- Product Details Modal -->
<div class="modal fade" id="productDetailsModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-info text-white">
        <h5 class="modal-title">Product Details</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-6">
            <div class="product-gallery mb-4">
              <img id="detail-main-image" src="" class="img-fluid mb-3" alt="Product Image" style="max-height: 300px;">
              <div class="thumbnail-container mt-3">
                <div class="row">
                  <!-- Thumbnails will be added dynamically -->
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <h3 id="detailProductName" class="mb-3"></h3>
            <div class="d-flex align-items-center mb-3">
              <div class="rating-stars" id="detailRatingStars"></div>
              
            </div>
            
            <div class="product-meta mb-4">
              <span class="badge badge-info" id="detailCategory"></span>
              <span class="text-muted ml-2" id="detailReleaseDate"></span>
            </div>
            
            <h5>Description</h5>
            <p id="detailDescription" class="mb-4"></p>
            
            <div class="specifications">
              <h5>Specifications</h5>
              <ul class="list-group list-group-flush" id="specsList">
                <!-- Specs will be added dynamically -->
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Login Prompt Modal -->
<div class="modal fade" id="loginPromptModal" tabindex="-1" role="dialog" aria-labelledby="loginPromptLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-warning text-dark">
        <h5 class="modal-title" id="loginPromptLabel"><i class="fas fa-lock mr-2"></i>Login Required</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span>&times;</span>
        </button>
      </div>
      <div class="modal-body">
        You need to be logged in to submit feedback. Please log in to continue.
      </div>
      <div class="modal-footer">
        <a href="login.jsp" class="btn btn-primary">Login Now</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>



   
<script>
$(document).on('click', '.view-details-btn', function () {
	  const $btn = $(this);

	  const name = $btn.data('name');
	  const category = $btn.data('category');
	  const sku = $btn.data('sku');
	  const description = $btn.data('description');
	  const thumbnail = $btn.data('thumbnail') || 'uploads/placeholder.jpg';
	  const specs = $btn.data('specs');
	  const rating = $btn.data('rating') || 0;
	  const feedbackCount = $btn.data('feedback-count') || 0;
	  const galleryRaw = $btn.data('gallery');
	  const gallery = Array.isArray(galleryRaw) ? galleryRaw : (galleryRaw || "").split(',');

	  $('#detailProductName').text(name);
	  $('#detailCategory').text(category);
	  $('#detailReleaseDate').text('SKU: ' + sku);
	  $('#detailDescription').text(description);
	  $('#detail-main-image').attr('src', thumbnail);

	  // Set rating
	  const stars = [];
	  for (let i = 1; i <= 5; i++) {
	    stars.push(i <= rating
	      ? '<i class="fas fa-star text-warning"></i>'
	      : '<i class="far fa-star text-warning"></i>');
	  }
	  $('#detailRatingStars').html(stars.join(''));
	  $('#detailReviewCount').text(`${feedbackCount} Reviews`);

	  // Specs
	  $('#specsList').html(specs);
	  

	  // Gallery
	  const thumbnails = gallery.map(path => `
	    <div class="col-3">
	      <img src="${path}" class="img-thumbnail thumbnail-img" style="cursor:pointer;">
	    </div>
	  `).join('');
	  $('.thumbnail-container .row').html(thumbnails);

	  $('#productDetailsModal').modal('show');
	});

</script>
<script>
  $(document).ready(function () {
    $('.open-login-prompt').on('click', function () {
      $('#loginPromptModal').modal('show');
    });
  });
</script>



  </body>
</html>
