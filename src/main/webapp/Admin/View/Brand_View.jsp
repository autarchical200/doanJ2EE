<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.brand.brand"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.google.gson.Gson"%>

<jsp:include page="inc/header.jsp" />

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Thêm Hãng</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="../Controller/Brand_Controller.jsp" method="post">
					<input type="hidden" name="action" value="add">
					<div class="form-group">
						<label for="exampleInputEmail1">Tên Hãng</label> <input
							class="form-control" type="text" name="brandName"
							placeholder="Tên hãng">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Quốc Gia</label> <input
							class="form-control" type="text" name="brandCountry"
							placeholder="Quốc gia">

					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Ngày Thành Lập</label> <input
							class="form-control" type="date" name="brandNsx"
							placeholder="Ngày thành lập">
					</div>
					<button type="submit" class="btn btn-primary">Thêm</button>
				</form>
			</div>

		</div>
	</div>
</div>
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Danh sách các hãng sản phẩm</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="row justify-content-center">
								<button class="btn btn-primary" data-toggle="modal"
									data-target="#exampleModal">
									<i class="fa-sharp fa-solid fa-plus"></i> Thêm Hãng Sản Phẩm
								</button>
							</div>
							<!-- ... -->
							<table class="table table-bordered" id="brandTable">
								<thead>
									<tr>
										<th><input type="checkbox" id="selectAll"></th>
										<th>ID</th>
										<th>Tên hãng</th>
										<th>Quốc Gia</th>
										<th>Ngày Thành Lập</th>
										<th>Chỉnh Sửa</th>
										<!-- Add other table headers here -->
									</tr>
								</thead>
								<tbody></tbody>
							</table>
							<button class="btn btn-danger" onclick="deleteSelected()">
								<i class="fa-solid fa-trash"></i> Xóa các hãng đã chọn
							</button>
							<!-- ... -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


</div>

<!-- Modal for Edit -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
	aria-labelledby="editModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="editModalLabel">Chỉnh Sửa Thông Tin
					Hãng Sản Phẩm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- Place your form for editing the brand here -->
				<form id="editForm">
					<input type="hidden" id="brandId" name="brandId">
					<!-- Add other form fields for editing here -->
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
				<button type="button" class="btn btn-primary"
					onclick="saveChanges()">Lưu Thay Đổi</button>
			</div>
		</div>
	</div>
</div>

<!-- JavaScript and jQuery code to send the AJAX request -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	// Select all checkboxes when the "selectAll" checkbox is clicked

	function deleteSelected() {
		var selectedBrandIds = [];
		$('input[name="brandIds"]:checked').each(function() {
			selectedBrandIds.push($(this).val());
		});

		// Log selectedBrandIds để kiểm tra xem có chứa đúng các ID của hãng đã chọn không

		if (selectedBrandIds.length > 0) {
			$.ajax({
				url : "../Controller/Brand_Controller.jsp",
				type : "POST",
				data : {
					action : "delete",
					brandIds : selectedBrandIds
				},
				success : function(response) {
					// Xử lý phản hồi từ server nếu cần
					// Reload trang brand_view.jsp để cập nhật danh sách hãng sau khi xóa
					location.reload();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus, errorThrown);
				}
		});
		}

	}
</script>
<script>
	$("#selectAll").click(function() {
		$('input[name="brandIds"]').prop("checked", $(this).prop("checked"));
	});
	$(document)
			.ready(
					function() {
						// Gọi Ajax để lấy danh sách hãng sản phẩm từ "Brand_Controller.jsp"
						$
								.ajax({
									url : "../Controller/Brand_Controller.jsp",
									type : "GET",
									dataType : "json",
									success : function(data) {
										// Xử lý dữ liệu và hiển thị trong bảng
										var brandTable = $('#brandTable')
												.DataTable(
														{
															"data" : data,
															"columns" : [
																	{
																		"data" : null,
																		"render" : function(
																				data,
																				type,
																				full,
																				meta) {
																			return '<input type="checkbox" name="brandIds" value="' + full.brand_id + '">';
																		}
																	},
																	{
																		"data" : "brand_id"
																	},
																	{
																		"data" : "brand_name"
																	},
																	{
																		"data" : "brand_country"
																	},
																	{
																		"data" : "brand_nsx"
																	},
																	{
																		"data" : null,
																		"render" : function(
																				data,
																				type,
																				full,
																				meta) {
																			return '<button type="button" class="btn btn-warning text-dank " onclick="openEditModal('
																					+ full.brand_id
																					+ ')"><i class="fa-regular fa-pen-to-square"></i> Sửa</button>';
																		}
																	}
															// Add other data columns here
															]
														});
									},
									error : function(jqXHR, textStatus,
											errorThrown) {
										console.log(textStatus, errorThrown);
									}
								});

						// Function to open the edit modal and populate the edit form with brand details
						function openEditModal(brandId) {
							// Fetch brand details from the server using AJAX based on brandId
							$
									.ajax({
										url : "Get_Brand_Details_Controller.jsp", // Replace with the appropriate URL to fetch brand details
										type : "POST",
										data : {
											brandId : brandId
										},
										dataType : "json",
										success : function(brandData) {
											// Populate the edit form inside the modal with brandData
											$("#brandId").val(
													brandData.brand_id);
											// Populate other form fields with the relevant data
											// ...
											$("#editModal").modal("show");
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											console
													.log(textStatus,
															errorThrown);
										}
									});
						}

						// Function to handle the click event of the "Lưu Thay Đổi" button inside the modal
						function saveChanges() {
							// Serialize the edit form data
							var formData = $("#editForm").serialize();
							// Perform AJAX request to save the changes made in the edit form.
							$
									.ajax({
										url : "Save_Brand_Details_Controller.jsp", // Replace with the appropriate URL to save brand details
										type : "POST",
										data : formData,
										success : function(response) {
											// Handle the response from the server after saving the changes
											// ...
											// Close the modal after successful save
											$("#editModal").modal("hide");
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											console
													.log(textStatus,
															errorThrown);
										}
									});
						}
					});
</script>

<jsp:include page="inc/footer.jsp" />
