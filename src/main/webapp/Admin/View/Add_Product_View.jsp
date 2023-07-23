<%@page import="pxu.edu.vn.category.*"%>
<%@page import="pxu.edu.vn.brand.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="inc/header.jsp" />

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-12">
					<h1 class=" text-center">Thêm Sản Phẩm</h1>
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
							<h3 class="card-title text-center">Hệ Thống Bán Lap Top</h3>
						</div>
						<form action="../Controller/Product_Controller.jsp" method="GET"
							enctype="multipart/form-data">
							<input type="hidden" name="action" value="add">
							<div class="form-group">
								<label>Tên Sản Phẩm</label> <input type="text" name="name"
									id="name" class="form-control" placeholder="Nhập Tên Sản Phẩm"
									required>
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
									<option value="">Tất cả hãng sản phẩm</option>
									<c:forEach var="brand" items="${brands}">
										<option value="${brand.brand_id}">${brand.brand_name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label>Giá Sản Phẩm</label> <input type="number" name="price"
									id="price" class="form-control" placeholder="Nhập giá Sản Phẩm"
									onkeypress="validateNumberInput(event)" required>
							</div>
							<div class="form-group">
								<label>Giá Sale</label> <input type="number" name="discounted"
									id="discounted" class="form-control"
									placeholder="Nhập giá Sale"
									onkeypress="validateNumberInput(event)" required>
							</div>
							<div class="form-group">
								<label for="image">Hình ảnh</label> <input type="file"
									name="image" id="image" class="form-control" required>
							</div>
							<div class="form-group">
								<label for="image">Thông Tin Sản Phẩm</label>
<<<<<<< HEAD
								<textarea  name="info" class="form-control"
=======
								<textarea name="info" class="form-control"
>>>>>>> refs/heads/Hung
									required></textarea>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary">Làm Mới</button>
								<button type="submit" class="btn btn-primary">Thêm Dữ
									Liệu</button>
							</div>
						</form>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						// Function to populate the brand select element with options
						function populateBrands(brands) {
							var brandSelect = $('#brand');
							brandSelect.empty(); // Clear existing options
							brandSelect
									.append('<option value="">Tất cả hãng sản phẩm</option>'); // Add default option
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
									.append('<option value="">Tất cả loại sản phẩm</option>'); // Add default option
							$
									.each(
											categories,
											function(index, category) {
												categorySelect
														.append('<option value="' + category.categoryID + '">'
																+ category.categoryName
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

<script>
	$(function() {
		//Add text editor
		$('#compose-textarea').summernote()
	})
</script>
<jsp:include page="inc/footer.jsp" />
