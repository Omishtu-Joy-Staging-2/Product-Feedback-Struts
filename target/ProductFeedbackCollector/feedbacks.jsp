<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String user = (String) session.getAttribute("user");
  String role = (String) session.getAttribute("role");

  if (user == null || role == null || !"admin".equals(role)) {
    // Redirect to login or show unauthorized page
    response.sendRedirect("unauthorized.jsp");
    return;
  }
%>

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
  </head>
<body>
    <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
      <!-- Sidebar -->
      <ul
        class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar"
      >
        <!-- Sidebar - Brand -->
        <a class="sidebar-brand" href="home.html">
          <div class="sidebar-brand-text mx-2 w-100">
            <span>Product Feedback Collector</span>
          </div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0" />

        <!-- Nav Item - Dashboard -->
       <li class="nav-item active">
          <a class="nav-link" href="dashboard.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a
          >
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider" />
        <li class="nav-item active">
          <a class="nav-link" href="listProducts">
            <i class="fas fa-boxes"></i>
            <span>Products</span></a
          >
        </li>
        <hr class="sidebar-divider" />

        <li class="nav-item active">
          <a class="nav-link" href="viewAllFeedback">
            <i class="fas fa-comments"></i>
            <span>Feedbacks</span></a
          >
        </li>

        <div class="text-center d-none d-md-inline">
          <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

      
      </ul>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
          <!-- Topbar -->
          <nav
            class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
          >
            <!-- Sidebar Toggle (Topbar) -->
            <button
              id="sidebarToggleTop"
              class="btn btn-link d-md-none rounded-circle mr-3"
            >
              <i class="fa fa-bars"></i>
            </button>

            <!-- Topbar Search -->
            <form
              class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
            >
              <div class="input-group">
                <input
                  type="text"
                  class="form-control bg-light border-0 small"
                  placeholder="Search for..."
                  aria-label="Search"
                  aria-describedby="basic-addon2"
                />
                <div class="input-group-append">
                  <button class="btn btn-primary" type="button">
                    <i class="fas fa-search fa-sm"></i>
                  </button>
                </div>
              </div>
            </form>

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
              <!-- Nav Item - Search Dropdown (Visible Only XS) -->
              <li class="nav-item dropdown no-arrow d-sm-none">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="searchDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i class="fas fa-search fa-fw"></i>
                </a>
                <!-- Dropdown - Messages -->
                <div
                  class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                  aria-labelledby="searchDropdown"
                >
                  <form class="form-inline mr-auto w-100 navbar-search">
                    <div class="input-group">
                      <input
                        type="text"
                        class="form-control bg-light border-0 small"
                        placeholder="Search for..."
                        aria-label="Search"
                        aria-describedby="basic-addon2"
                      />
                      <div class="input-group-append">
                        <button class="btn btn-primary" type="button">
                          <i class="fas fa-search fa-sm"></i>
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </li>

              <!-- Nav Item - Alerts -->
              <li class="nav-item dropdown no-arrow mx-1">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="alertsDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i class="fas fa-bell fa-fw"></i>
                  <!-- Counter - Alerts -->
                  <span class="badge badge-danger badge-counter">3+</span>
                </a>
                <!-- Dropdown - Alerts -->
                <div
                  class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                  aria-labelledby="alertsDropdown"
                >
                  <h6 class="dropdown-header">Alerts Center</h6>
                 <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                      <div class="icon-circle bg-primary">
                        <i class="fas fa-file-alt text-white"></i>
                      </div>
                    </div>
                    <div>
                      <div class="small text-gray-500">December 12, 2024</div>
                      <span class="font-weight-bold"
                        >A new monthly report is ready to download!</span
                      >
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                      <div class="icon-circle bg-success">
                        <i class="fas fa-bug text-white"></i>
                      </div>
                    </div>
                    <div>
                      <div class="small text-gray-500">February 7, 2019</div>
                      18 New Feedback on Bugs has been reported Check it out!
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                      <div class="icon-circle bg-warning">
                        <i class="fas fa-exclamation-triangle text-white"></i>
                      </div>
                    </div>
                    <div>
                      <div class="small text-gray-500">April 2, 2019</div>
                      There are some Feedback's that haven't got any response yet!
                      please check them out.
                    </div>
                  </a>
                  <a
                    class="dropdown-item text-center small text-gray-500"
                    href="#"
                    >Show All Alerts</a
                  >
                </div>
              </li>

              <div class="topbar-divider d-none d-sm-block"></div>

              <!-- Nav Item - User Information -->
              <li class="nav-item dropdown no-arrow">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="userDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <span class="mr-2 d-none d-lg-inline text-gray-600 small"
                    >Admin</span
                  >
                  <img
                    class="img-profile rounded-circle"
                    src="img/undraw_profile.svg"
                  />
                </a>
                <!-- Dropdown - User Information -->
                <div
                  class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                  aria-labelledby="userDropdown"
                >
                  
                  <div class="dropdown-divider"></div>
                  <a
                    class="dropdown-item"
                    href="login.html"
                    data-toggle="modal"
                    data-target="#logoutModal"
                  >
                    <i
                      class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"
                    ></i>
                    Logout
                  </a>
                </div>
                
              </li>
            </ul>
          </nav>
          <!-- End of Topbar -->


          <div class="container-fluid">
  <h1 class="h3 mb-2 text-gray-800">Feedback Management</h1>

  <div class="row">
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                Total Feedback
              </div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">127</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-comments fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                Average Rating
              </div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">4.2/5</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-star fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                Pending Review
              </div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">23</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-clock fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-warning shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                Critical Feedback
              </div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">15</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-exclamation-triangle fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<div class="container-fluid">
  <div class="card shadow mb-4">
    <div class="card-header py-3 d-flex justify-content-between align-items-center">
      <h6 class="m-0 font-weight-bold text-primary">All Feedback Submissions</h6>
      <div>
        <button class="btn btn-success btn-sm mr-2">
          <i class="fas fa-download fa-sm"></i> Export
        </button>
        <button class="btn btn-info btn-sm">
          <i class="fas fa-filter fa-sm"></i> Filter
        </button>
      </div>
    </div>
    <div class="card-body">
      <div class="table-responsive">
      

<table class="table table-bordered" id="feedbackTable" width="100%" cellspacing="0">
  <thead class="thead-light">
    <tr>
      <th>Feedback ID</th>
      <th>Product</th>
      <th>Category</th>
      <th>User</th>
      <th>Rating</th>
      <th>Submission Date</th>
      <th>Status</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
    <s:iterator value="feedbacks" var="f">
      <tr>
        <td><s:property value="#f.id" /></td>
        <td><s:property value="#f.productName" /></td>
        <td><s:property value="#f.category" /></td>
        <td><s:property value="#f.userEmail" /></td>

        <!-- Rating stars -->
        <td>
		  <div class="rating-stars">
		    <s:iterator begin="1" end="5" var="i">
		      <s:if test="#i <= #f.rating">
		        <i class="fas fa-star text-warning"></i>
		      </s:if>
		      <s:else>
		        <i class="far fa-star text-warning"></i>
		      </s:else>
		    </s:iterator>
		    <span class="ml-2"><s:property value="#f.rating" />/5</span>
		  </div>
		</td>

        <td><s:date name="#f.createdAt" format="yyyy-MM-dd" /></td>

        <td>
          <s:if test="#f.status == 'Pending'">
            <span class="badge badge-warning">Pending</span>
          </s:if>
          <s:elseif test="#f.status == 'Processed'">
            <span class="badge badge-success">Processed</span>
          </s:elseif>
          <s:else>
            <span class="badge badge-secondary"><s:property value="#f.status" /></span>
          </s:else>
        </td>

        <td>
          <button 
			  class="btn btn-info btn-sm view-detail-btn"
			  data-feedback-id="<s:property value='#f.id' />"
			  title="View Details">
			  <i class="fas fa-eye"></i>
			</button>

		
		
          <button 
			  class="btn btn-primary btn-sm respond-btn" 
			  data-feedback-id="<s:property value='#f.id' />" 
			  data-comments="<s:property value='#f.comments' escapeHtml='true'/>"
			  title="Respond">
			  <i class="fas fa-reply"></i>
			</button>
        </td>
      </tr>
    </s:iterator>
  </tbody>
</table>
        
      </div>
    </div>
  </div>
</div>



<!-- View Details Modal -->
<div class="modal fade" id="viewDetailModal" tabindex="-1" role="dialog" aria-labelledby="viewDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-info text-white">
        <h5 class="modal-title" id="viewDetailModalLabel">Feedback Details</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row mb-4">
          <div class="col-md-6">
            <h6 class="font-weight-bold">Product Information</h6>
            <ul class="list-group list-group-flush">
              <li class="list-group-item d-flex justify-content-between align-items-center">
                <span>Product Name:</span>
                <span id="detail-product-name" class="font-weight-bold">--</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                <span>Category:</span>
                <span id="detail-product-category" class="font-weight-bold">--</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                <span>Feedback ID:</span>
                <span id="detail-feedback-id" class="font-weight-bold">--</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                <span>Submission Date:</span>
                <span id="detail-submission-date" class="font-weight-bold">--</span>
              </li>
            </ul>
          </div>
          <div class="col-md-6">
            <h6 class="font-weight-bold">User Information</h6>
            <ul class="list-group list-group-flush">
              <li class="list-group-item d-flex justify-content-between align-items-center">
                <span>User Email:</span>
                <span id="detail-user-email" class="font-weight-bold">--</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
				  <span>Contact Email:</span>
				  <span id="detail-contact-email" class="font-weight-bold text-primary">--</span>
			</li>
				              
              <li class="list-group-item d-flex justify-content-between align-items-center">
                <span>Rating:</span>
                <span id="detail-rating" class="font-weight-bold">
                  <span class="rating-stars">                  
                  </span>
                </span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                <span>Status:</span>
                <span id="detail-status" class="badge badge-success">--</span>
              </li>
            </ul>
          </div>
        </div>
        
        <div class="card mb-3">
          <div class="card-header">
            <h6 class="m-0 font-weight-bold text-primary">User Comments</h6>
          </div>
          <div class="card-body">
            <p id="detail-comments">--</p>
          </div>
        </div>
        
        <div class="card">
          <div class="card-header">
            <h6 class="m-0 font-weight-bold text-primary">Admin Response</h6>
          </div>
          <div class="card-body">
            <p id="admin-response">--</p>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Respond Modal -->
<div class="modal fade" id="respondModal" tabindex="-1" role="dialog" aria-labelledby="respondModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="respondModalLabel">Respond to Feedback</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="responseForm">
          <input type="hidden" id="response-feedback-id" name="feedback_id">
          <div class="form-group">
            <label for="response-product">Product</label>
            <input type="text" class="form-control" id="response-product" readonly>
          </div>
          <div class="form-group">
            <label for="response-user">User</label>
            <input type="text" class="form-control" id="response-user" readonly>
          </div>
          
          <div class="form-group">
            <label for="response-rating">Rating</label>
            <div id="response-rating" class="rating-stars">
              <!-- Stars will be inserted here by JavaScript -->
            </div>
          </div>
          <div class="form-group">
            <label for="response-comments">Original Comments</label>
            <textarea class="form-control" id="response-comments" rows="3" readonly></textarea>
          </div>
          <div class="form-group">
            <label for="admin-response">Your Response *</label>
            <textarea class="form-control" id="admin-response-input" name="response" rows="5" required></textarea>
          </div>
          <div class="form-group">
            <label for="response-status">Update Status</label>
            <select class="form-control" id="response-status" name="status">
              <option value="Pending">Pending</option>
              <option value="Processed">Processed</option>
              <option value="Rejected">Rejected</option>
            </select>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="submit" form="responseForm" class="btn btn-primary">Send Response</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade"
      id="logoutModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true">      
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button
              class="close"
              type="button"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            Select "Logout" below if you are ready to end your current session.
          </div>
          <div class="modal-footer">
            <button
              class="btn btn-secondary"
              type="button"
              data-dismiss="modal"
            >
              Cancel
            </button>
            <a class="btn btn-primary" href="logout.action">Logout</a>
          </div>
        </div>
      </div>
    </div>     
 <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
<script>
$(document).ready(function() {
  // View Detail button click handler
 $('.view-detail-btn').click(function () {
  const feedbackId = $(this).data('feedback-id');

  $.ajax({
    url: 'getFeedbackDetails',
    type: 'GET',
    data: { id: feedbackId }, // note: "id" must match the action's `setId()`
    success: function (res) {
      const fb = typeof res === 'string' ? JSON.parse(res) : res;

      $('#detail-product-name').text(fb.productName);
      $('#detail-product-category').text(fb.category);
      $('#detail-feedback-id').text(fb.id);
      $('#detail-user-email').text(fb.userEmail);
      $('#detail-submission-date').text(fb.createdAt);
      $('#detail-status').text(fb.status);
      $('#detail-status').removeClass().addClass('badge ' + getStatusBadgeClass(fb.status));

      // Rating
      updateRatingStars('#detail-rating .rating-stars', fb.rating);

      // Contact Email
      if (fb.allowContact) {
        $('#detail-contact-email').text(fb.email || 'Not provided');
      } else {
        $('#detail-contact-email').text('Not shared');
      }

      // Comments
      $('#detail-comments').text(fb.comments || 'No comments provided.');

      // Admin Response
      $('#admin-response').text(fb.adminResponse || 'No response yet.');

      $('#viewDetailModal').modal('show');
    },
    error: function () {
      alert("Failed to fetch feedback details.");
    }
  });
});
 $(document).on('click', '.respond-btn', function () {
	    const feedbackId = $(this).data('feedback-id');

	    $.ajax({
	      url: 'getFeedbackDetails',
	      type: 'GET',
	      data: { id: feedbackId },
	      success: function (res) {
	        const fb = typeof res === 'string' ? JSON.parse(res) : res;

	        $('#response-feedback-id').val(fb.id);
	        $('#response-product').val(fb.productName);
	        $('#response-user').val(fb.userEmail || 'Guest');
	        $('#response-comments').val(fb.comments || '');
	        $('#response-status').val(fb.status || 'Pending');
	        $('#admin-response-input').val(fb.adminResponse || '');

	        const stars = [];
	        for (let i = 1; i <= 5; i++) {
	          stars.push(
	            i <= fb.rating
	              ? '<i class="fas fa-star text-warning"></i>'
	              : '<i class="far fa-star text-warning"></i>'
	          );
	        }
	        $('#response-rating').html(stars.join('') + `<span class="ml-2">${fb.rating}/5</span>`);

	        $('#respondModal').modal('show');
	      },
	      error: function () {
	        alert("Error loading feedback for response.");
	      }
	    });
	  });


  
  // Response form submission
$('#responseForm').on('submit', function (e) {
  e.preventDefault();

  const formData = {
    feedback_id: $('#response-feedback-id').val(),
    response: $('#admin-response-input').val(),
    status: $('#response-status').val()
  };
  console.log('Submitting:', formData);
  $.ajax({
    url: 'submitFeedbackResponse',
    type: 'POST',
    data: formData,
    success: function (res) {
      try {
        const result = typeof res === "string" ? JSON.parse(res) : res;

        if (result.status === 'success') {
         alert('Response submitted successfully.');
          $('#respondModal').modal('hide');
          $('#responseForm')[0].reset();

          // Optionally update the row status badge or reload page
          location.reload(); 
        } else {
          alert('Failed to submit response.');
        }
      } catch (e) {
        alert('Unexpected response.');
        console.error(e);
      }
    },
    error: function () {
      alert('Error submitting response.');
    }
  });
});

  
  // Helper functions
  function getStatusBadgeClass(status) {
    switch(status.trim()) {
      case 'Pending': return 'badge-warning';
      case 'Processed': return 'badge-success';
      case 'Rejected': return 'badge-danger';
      default: return 'badge-secondary';
    }
  }
  
  function updateRatingStars(selector, rating) {
    $(selector).empty();
    for (let i = 1; i <= 5; i++) {
      if (i <= rating) {
        $(selector).append('<i class="fas fa-star text-warning"></i>');
      } else if (i - 0.5 <= rating) {
        $(selector).append('<i class="fas fa-star-half-alt text-warning"></i>');
      } else {
        $(selector).append('<i class="far fa-star text-warning"></i>');
      }
    }
  }
  
  function createRatingStars(rating) {
    let stars = '';
    for (let i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars += '<i class="fas fa-star text-warning"></i>';
      } else if (i - 0.5 <= rating) {
        stars += '<i class="fas fa-star-half-alt text-warning"></i>';
      } else {
        stars += '<i class="far fa-star text-warning"></i>';
      }
    }
    return stars;
  }
  
  // Sample data functions - in a real app, this would come from your backend
  function getSampleComments(feedbackId) {
    const comments = {
      'FB-1001': 'Excellent phone but battery life could be better. The camera quality is amazing but the battery drains too quickly with heavy usage.',
      'FB-1002': 'Good sound quality but uncomfortable for long wear. After about an hour, my ears start to hurt.',
      'FB-1003': 'Perfect picture quality and easy setup. The smart features work flawlessly with my other devices.'
    };
    return comments[feedbackId] || 'No comments available.';
  }
  
  function getSampleResponse(feedbackId) {
    const responses = {
      'FB-1001': "Thank you for your feedback. We're working on improving battery performance in our next software update.",
      'FB-1002': "We appreciate your feedback. We'll consider your comments about comfort in our next design iteration.",
      'FB-1003': "We're glad you're enjoying your new TV! Thank you for your positive feedback."
    };
    return responses[feedbackId] || 'No response yet.';
  }
});
</script>

<style>
.rating-stars {
  display: inline-block;
}
.rating-stars i {
  font-size: 1rem;
}
</style>
   


</body>
</html>