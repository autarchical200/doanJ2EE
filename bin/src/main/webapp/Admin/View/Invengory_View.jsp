<%@page import="java.util.List"%>
<%@page import="pxu.edu.vn.*"%>
<%@page import="pxu.edu.vn.inventory.Inventory"%>
<%@page import="pxu.edu.vn.inventory.InventoryModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.*"%>

<!-- Import lớp DAO -->

<jsp:include page="inc/header.jsp" />

<div class="content-wrapper">
	<!-- Thêm phần code hiển thị danh sách kho hàng ở đây -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Danh sách sản phẩm trong kho hàng</h1>
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
									<tr class="text-center">
										<th><input type="checkbox" id="selectAll"></th>
										<th>ID</th>
										<th>Tên Sản Phẩm Sản Phẩm</th>
										<th>Ngày Nhập</th>
										<th>Số Lượng</th>
										<th>Chỉnh Sửa</th>
										<!-- Add other table headers here -->
									</tr>
								</thead>
								<tbody class="text-center"></tbody>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
									url : "../Controller/Invengory_Controller.jsp",
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
																			return '<input type="checkbox" name="brandIds" value="' + full.invengory_id + '">';
																		}
																	},
																	{
																		"data" : "inventory_id"
																	},
																	{
																		"data" : "product_id"
																	},
																	{
																		"data" : "date_add"
																	},
																	{
																		"data" : "quantity"
																	},

																	{
																		"data" : null,
																		"render" : function(
																				data,
																				type,
																				full,
																				meta) {
																			return '<button type="button" class="btn btn-warning text-dank " onclick="openEditModal('
																					+ full.invengory_id
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

						// Function to handle the click event of the "Lưu Thay Đổi" button inside the modal

					});
</script>
<jsp:include page="inc/footer.jsp" />