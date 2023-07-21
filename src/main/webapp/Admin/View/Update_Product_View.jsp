	<%@page import="pxu.edu.vn.product.ProductModel"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ page import="java.util.ArrayList"%>
	<%@ page import="java.util.List"%>
	<%@ page import="pxu.edu.vn.product.Product"%>
	<%@ page import="pxu.edu.vn.category.category"%>
	<%@ page import="pxu.edu.vn.brand.*"%>
	<%@ page import="pxu.edu.vn.product.*"%>
	
	<jsp:include page="inc/header.jsp" />
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-12">
						<h1 class="text-center">Sửa Sản Phẩm</h1>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<!-- left column -->
					<div class="col-md-12">
						<!-- jquery validation -->
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title text-center">Hệ Thống Bán Laptop</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<%
							String productId = request.getParameter("product_id");
							if (productId != null) {
								Product product = ProductModel.getProductById(productId);
								if (product != null) {
							%>
							<form id="updateForm" method="get" enctype="multipart/form-data" action="../Controller/Product_Controller.jsp">
								<input type="hidden" name="action" value="edit">
								<input type="hidden" name="id" value="<%=product.getProduct_id()%>" id="productId">
								<div class="modal-body">
									<div class="form-group">
										<label>Tên Sản Phẩm</label>
										<input type="text" required name="name" id="name" class="form-control" value="<%=product.getProduct_name()%>">
									</div>
									<div class="form-group">
									<label for="category">Loại sản phẩm:</label> <select
										name="category" id="category" class="form-control">
										<c:forEach var="category" items="${categories}">
											<option value="${category.category_id}">${category.category_name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label for="brand">Hãng sản phẩm:</label> <select name="brand"
										id="brand" class="form-control">
										<c:forEach var="brand" items="${brands}">
											<option value="${brand.brand_id}">${brand.brand_name}</option>
										</c:forEach>
									</select>
								</div>
									<div class="form-group">
										<label>Giá Sản Phẩm</label>
										<input type="number" required onkeypress="validateNumberInput(event)" name="price" id="price" class="form-control" placeholder="Nhập giá Sản Phẩm" value="<%=product.getPrice()%>">
									</div>
									<div class="form-group">
										<label>Giá Sale</label>
										<input type="number" required onkeypress="validateNumberInput(event)" name="discounted" id="discounted" class="form-control" placeholder="Nhập giá Sản Phẩm" value="<%=product.getDiscounted_price()%>">
									</div>
									<div class="form-group">
										<label for="image">Hình ảnh</label>
										<input type="file" name="image" id="image" class="form-control">
									</div>
									<div class="form-group">
										<label for="info">Thông Tin Sản Phẩm</label>
										<textarea id="info" name="info" class="form-control" required><%=product.getProduct_info()%></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">Cập Nhật</button>
								</div>
							</form>
							<%
							} else {
							%>
							<p>Sản phẩm không tồn tại hoặc đã bị xóa!</p>
							<%
							}
							} else {
							%>
							<p>Không có thông tin sản phẩm để sửa!</p>
							<%
							}
							%>
						</div>
						<!-- /.card -->
					</div>
					<!--/.col (left) -->
					<!-- right column -->
					<div class="col-md-6"></div>
					<!--/.col (right) -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script>
		function validateNumberInput(event) {
			var input = event.target.value;
			var regex = /^[0-9]*$/;
	
			if (!regex.test(input)) {
				event.preventDefault();
			}
		}
	</script>
	<script>
		$(document)
				.ready(
						function() {
							// Function to populate the brand select element with options
							function populateBrands(brands) {
								var brandSelect = $('#brand');
								brandSelect.empty(); // Clear existing options
								brandSelect
								$
										.each(
												brands,
												function(index, brand) {
													brandSelect
															.append('<option value="' + brand.brand_id + '">'
																	+ brand.brand_name
																	+ '</option>');
												});
							}
	
							// Function to populate the category select element with options
							function populateCategories(categories) {
								var categorySelect = $('#category');
								categorySelect.empty(); // Clear existing options
								categorySelect
								$
										.each(
												categories,
												function(index, category) {
													categorySelect
															.append('<option value="' + category.category_id + '">'
																	+ category.category_name
																	+ '</option>');
												});
							}
	
							// Ajax request to get the brand data from controller
							$.ajax({
								url : '../Controller/Brand_Controller.jsp', // Replace with the correct URL to your controller for brands
								type : 'GET',
								dataType : 'json',
								success : function(data) {
									populateBrands(data); // Call the function to populate the brand select element
								},
								error : function(xhr, status, error) {
									console.error('Error fetching brand data:',
											error);
								}
							});
	
							// Ajax request to get the category data from controller
							$.ajax({
								url : '../Controller/Category_Controller.jsp', // Replace with the correct URL to your controller for categories
								type : 'GET',
								dataType : 'json',
								success : function(data) {
									populateCategories(data); // Call the function to populate the category select element
								},
								error : function(xhr, status, error) {
									console.error('Error fetching category data:',
											error);
								}
							});
						});
	</script>
	
	
	<jsp:include page="inc/footer.jsp" />
