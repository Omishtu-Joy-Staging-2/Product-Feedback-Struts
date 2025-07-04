<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
        <a class="sidebar-brand" href="dashboard.jsp">
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
            <div
              class="d-sm-flex align-items-center justify-content-between mb-4"
            >
              <h1 class="h3 mb-0 text-gray-800">Products</h1>
             <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addProductModal">
              <i class="fas fa-plus-circle mr-2"></i> Add New Product
            </button>
            </div>
                    
<div class="card shadow mb-4 mt-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Product List</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="productTable" width="100%" cellspacing="0">
        <thead class="thead-light">
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>SKU</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <s:iterator value="productList">
            <tr>
              <td><s:property value="id"/></td>
              <td><s:property value="name"/></td>
              <td><s:property value="category"/></td>
              <td><s:property value="sku"/></td>
              <td>
                <span class="badge 
                  <s:if test="status == 'Active'">badge-success</s:if>
                  <s:elseif test="status == 'Limited Stock'">badge-warning</s:elseif>
                  <s:else>badge-danger</s:else>
                ">
                  <s:property value="status"/>
                </span>
              </td>
              <td><button class="btn btn-primary btn-sm viewProductBtn" data-id="<s:property value='id'/>" data-toggle="modal" data-target="#productDetailModal">
        View
      </button>
      <button class="btn btn-warning btn-sm editProductBtn" data-id="<s:property value='id'/>">Edit Product</button>
      <button class="btn btn-danger btn-sm deleteProductBtn" data-id="${id}">Delete</button>
      
      </td>
            </tr>
          </s:iterator>
        </tbody>
      </table>
    </div>
  </div>
</div>

          <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
              <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                  <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
 <s:form action="addProduct" method="post" enctype="multipart/form-data" theme="simple">
  <!-- Product Name, SKU -->
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label>Product Name *</label>
		      <s:textfield name="productName" cssClass="form-control" required="true" />
		    </div>
		    <div class="form-group col-md-6">
		      <label>SKU/Product Code *</label>
		      <s:textfield name="productSKU" cssClass="form-control" required="true" />
		    </div>
		  </div>
		
		  <!-- Category and Brand -->
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label>Category *</label>
		      <s:select name="productCategory" cssClass="form-control" list="#{'Electronics':'Electronics','Home Appliances':'Home Appliances','Computers':'Computers','Audio':'Audio','Wearables':'Wearables','Other':'Other'}" headerValue="Select Category" required="true"/>
		    </div>
		    <div class="form-group col-md-6">
		      <label>Brand</label>
		      <s:textfield name="productBrand" cssClass="form-control"/>
		    </div>
		  </div>
		
		  <!-- Description -->
		  <div class="form-group">
		    <label>Description</label>
		    <s:textarea name="productDescription" cssClass="form-control" rows="3"/>
		  </div>
		
		  <!-- Thumbnail -->
		  <div class="form-group">
		    <label>Thumbnail Image *</label>
		    <s:file name="productThumbnail" cssClass="form-control" required="true"/>
		  </div>
		
		  <!-- Gallery -->
		  <!-- 
		   <div class="form-group">
		    <label>Additional Images</label>
		    <s:file name="productGallery" cssClass="form-control" multiple="true"/>
		  </div>
		  
		   -->
		  <div class="form-group">
		  <label>Specifications</label>
		  <s:textarea name="productSpecifications" cssClass="form-control" rows="3"/>
		  </div>
		
		  <!-- Submit -->
		   </div>
		 <div class="modal-footer">
		     <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			  <s:submit value="Add Product" cssClass="btn btn-primary"/>
		                  	
                </div>
</s:form>
              </div>
            </div>
          </div>

                        </div>
                      </div>
                    </div>
        </div>
                            </div>
                        </div>
                      </div>
               <div
      class="modal fade"
      id="logoutModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
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
 <div class="modal fade" id="editProductModal" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-warning text-white">
        <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <form id="editProductForm" enctype="multipart/form-data">
        <div class="modal-body">
          <!-- Hidden product ID -->
          <input type="hidden" id="editProductId" name="id" />

          <!-- Product Name, SKU -->
          <div class="form-row">
            <div class="form-group col-md-6">
              <label>Product Name</label>
              <input type="text" class="form-control" id="editProductName" name="name" required>
            </div>
            <div class="form-group col-md-6">
              <label>SKU</label>
              <input type="text" class="form-control" id="editProductSku" name="sku" required>
            </div>
          </div>

          <!-- Category, Brand -->
          <div class="form-row">
            <div class="form-group col-md-6">
              <label>Category</label>
              <select class="form-control" id="editProductCategory" name="category" required>
                <option value="">Select Category</option>
                <option>Electronics</option>
                <option>Home Appliances</option>
                <option>Computers</option>
                <option>Audio</option>
                <option>Wearables</option>
                <option>Other</option>
              </select>
            </div>
            <div class="form-group col-md-6">
              <label>Brand</label>
              <input type="text" class="form-control" id="editProductBrand" name="brand">
            </div>
          </div>

          <!-- Description -->
          <div class="form-group">
            <label>Description</label>
            <textarea class="form-control" id="editProductDescription" name="description" rows="3"></textarea>
          </div>

          <!-- Specifications -->
          <div class="form-group">
            <label>Specifications</label>
            <textarea class="form-control" id="editProductSpecifications" name="specifications" rows="3"></textarea>
          </div>

          <!-- Thumbnail (optional update) -->
          <div class="form-group">
            <label>Change Thumbnail</label>
            <input type="file" class="form-control" name="productThumbnail" accept="image/*">
          </div>

          <!-- Status -->
          <div class="form-group">
            <label>Status</label>
            <select class="form-control" id="editProductStatus" name="status">
              <option>Active</option>
              <option>Limited Stock</option>
              <option>Discontinued</option>
            </select>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-warning">Update Product</button>
        </div>
      </form>
    </div>
  </div>
</div>
</div>

 <div class="modal fade" id="productDetailModal" tabindex="-1" role="dialog" aria-labelledby="productDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="productDetailModalLabel">Product Details</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
        
        
          <!-- Product Images Column -->
<div class="col-lg-5">
  <div class="card mb-4">
    <div class="card-body text-center">
      <!-- Main Product Image -->
      <img id="detail-main-image" src="" class="img-fluid mb-3" alt="Product Image" style="max-height: 300px;">

      <!-- Thumbnail Gallery -->
      <div class="row" id="thumbnail-gallery">
        <!-- Dynamically appended thumbnails go here -->
      </div>
    </div>
  </div>

  <!-- Quick Stats Card -->
  <div class="card mb-4">
    <div class="card-header">
      <h6 class="m-0 font-weight-bold text-primary">Quick Stats</h6>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-6 text-center">
          <div class="h5 mb-0 font-weight-bold text-gray-800" id="detail-feedback-count">--</div>
          <div class="small text-muted">Feedbacks</div>
        </div>
        <div class="col-6 text-center">
          <div class="h5 mb-0 font-weight-bold text-gray-800" id="detail-avg-rating">
            <span class="rating-stars">
              <i class="fas fa-star text-warning"></i>
              <i class="fas fa-star text-warning"></i>
              <i class="fas fa-star text-warning"></i>
              <i class="fas fa-star text-warning"></i>
              <i class="far fa-star text-warning"></i>
              <span>--</span>
            </span>
          </div>
          <div class="small text-muted">Avg Rating</div>
        </div>
      </div>
        
    </div>
  </div>
</div>

<!-- Product Details Column -->
<div class="col-lg-7">
  <div class="card mb-4">
    <div class="card-header">
      <h6 class="m-0 font-weight-bold text-primary">Basic Information</h6>
    </div>
    <div class="card-body">
      <table class="table table-bordered">
        <tbody>
          <tr><th>Product ID</th><td id="detail-product-id">--</td></tr>
          <tr><th>Name</th><td id="detail-product-name">--</td></tr>
          <tr><th>SKU</th><td id="detail-product-sku">--</td></tr>
          <tr><th>Category</th><td id="detail-product-category">--</td></tr>
          <tr><th>Brand</th><td id="detail-product-brand">--</td></tr>
          <tr><th>Status</th><td id="detail-product-status">--</td></tr>
        </tbody>
      </table>
    </div>
  </div>
 <!-- description -->
<div class="card mb-4">
    <div class="card-header">
      <h6 class="m-0 font-weight-bold text-primary">Description</h6>
    </div>
    <div class="card-body">
      <p id="detail-product-description">--</p>
    </div>
  </div>

  <!-- Specifications -->
  <div class="card mb-4">
    <div class="card-header">
      <h6 class="m-0 font-weight-bold text-primary">Specifications</h6>
    </div>
    <div class="card-body">
      <p id="detail-product-specifications">--</p>
    </div>
  </div>

  <!-- Pricing & Inventory -->
  
</div>

        <!-- Recent Feedback Card -->
       <!-- 
        <div class="card">
          <div class="card-header d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">Recent Feedback</h6>
            <button class="btn btn-sm btn-primary">View All Feedback</button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="recentFeedbackTable">
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>User</th>
                    <th>Rating</th>
                    <th>Comments</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>2023-08-20</td>
                    <td>user1@example.com</td>
                    <td>
                      <div class="rating-stars">
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="far fa-star text-warning"></i>
                      </div>
                    </td>
                    <td>Great phone but battery could be better</td>
                    <td><span class="badge badge-success">Processed</span></td>
                  </tr>
                  <tr>
                    <td>2023-08-18</td>
                    <td>user2@example.com</td>
                    <td>
                      <div class="rating-stars">
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                      </div>
                    </td>
                    <td>Excellent camera quality!</td>
                    <td><span class="badge badge-success">Processed</span></td>
                  </tr>
                  <tr>
                    <td>2023-08-15</td>
                    <td>user3@example.com</td>
                    <td>
                      <div class="rating-stars">
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="far fa-star text-warning"></i>
                        <i class="far fa-star text-warning"></i>
                      </div>
                    </td>
                    <td>Screen scratches too easily</td>
                    <td><span class="badge badge-warning">Pending</span></td>
                  </tr>
                </tbody>
              </table>
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
        -->
<!-- Edit Product Modal -->


    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>


<script>
$(document).ready(function () {
	  $('.viewProductBtn').click(function () {
	    const productId = $(this).data('id');

	    $.ajax({
	      url: 'getProductDetail',
	      type: 'GET',
	      data: { id: productId },
	      success: function (product) {
	        $('#detail-product-id').text(product.id);
	        $('#detail-product-name').text(product.name);
	        $('#detail-product-sku').text(product.sku);
	        $('#detail-product-category').text(product.category);
	        $('#detail-product-brand').text(product.brand);
	        $('#detail-product-status').text(product.status);
	        $('#detail-product-description').text(product.description);
	        $('#detail-product-specifications').text(product.specifications);

	        const imgSrc = product.thumbnail ? product.thumbnail : 'uploads/placeholder.jpg';
	        $('#detail-main-image')
	          .attr('src', imgSrc)
	          .on('error', function () {
	            $(this).attr('src', 'uploads/placeholder.jpg');
	          });

	        $('#productDetailModal').modal('show');
	      },
	      error: function () {
	        alert('Failed to load product details.');
	      }
	    });
	  });
	});
 
  $(document).ready(function () {
	  $('.editProductBtn').click(function () {
	    const productId = $(this).data('id');

	    $.ajax({
	      url: 'getProductDetail',
	      type: 'GET',
	      data: { id: productId },
	      success: function (data) {
	        // Populate fields in the modal
	        $('#editProductId').val(data.id);
	        $('#editProductName').val(data.name);
	        $('#editProductSku').val(data.sku);
	        $('#editProductCategory').val(data.category);
	        $('#editProductBrand').val(data.brand);
	        $('#editProductDescription').val(data.description);
	        $('#editProductSpecifications').val(data.specifications);
	        $('#editProductStatus').val(data.status);

	        $('#editProductModal').modal('show');
	      }
	    });
	  });
	});

</script>
<script>
$(document).ready(function () {
  // Handle Edit Form Submission
  $('#editProductForm').on('submit', function (e) {
    e.preventDefault();

    const formData = new FormData(this);

    $.ajax({
      url: 'updateProduct',
      type: 'POST',
      data: formData,
      contentType: false, // Important for multipart/form-data
      processData: false, // Important for multipart/form-data
      success: function (response) {
        $('#editProductModal').modal('hide');
        alert('Product updated successfully!');
        location.reload(); // Reload product list (optional improvement: use AJAX)
      },
      error: function (xhr, status, error) {
        alert('Failed to update product.');
        console.error(xhr.responseText);
      }
    });
  });

  // Optional: Fill the form when Edit is clicked
  $('.editProductBtn').on('click', function () {
    const productId = $(this).data('id');

    // Fetch product details
    $.get('getProductDetail', { id: productId }, function (data) {
      $('#editProductId').val(data.id);
      $('#editProductName').val(data.name);
      $('#editProductSku').val(data.sku);
      $('#editProductCategory').val(data.category);
      $('#editProductBrand').val(data.brand);
      $('#editProductDescription').val(data.description);
      $('#editProductSpecifications').val(data.specifications);
      $('#editProductStatus').val(data.status);
      $('#editProductModal').modal('show');
    });
  });
});
</script>
<script>
  $(document).on('click', '.deleteProductBtn', function () {
    const id = $(this).data('id');
    if (confirm("Are you sure you want to delete this product?")) {
      window.location.href = "deleteProduct?id=" + id;
    }
  });
</script>


<style>
.thumbnail-img {
  transition: all 0.3s ease;
}
.thumbnail-img:hover {
  opacity: 0.8;
}
.thumbnail-img.active {
  border: 2px solid #4e73df !important;
}
.rating-stars {
  display: inline-block;
}
.rating-stars i {
  font-size: 1rem;
}
</style>

 </body>
</html>