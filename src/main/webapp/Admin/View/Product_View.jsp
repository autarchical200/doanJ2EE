<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="inc/header.jsp" />

<div class="content-wrapper">
	<!-- Thêm phần code hiển thị danh sách sản phẩm ở đây -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Danh sách sản phẩm</h1>
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
								<a href="Add_Product_View.jsp">
									<button class="btn btn-primary">
										<i class="fa-sharp fa-solid fa-plus"></i> Thêm Hãng Sản Phẩm
									</button>
								</a>
							</div>
							<!-- ... -->
							<table class="table table-bordered" id="productTable">
								<thead>
									<tr class="text-center">
										<th>ID Sản phẩm</th>
										<th>Tên sản phẩm</th>
										<th>Danh mục</th>
										<th>Thương hiệu</th>
										<th>Giá</th>
										<th>Giá giảm</th>
										<th>Hình ảnh</th>
										<th>Thông tin sản phẩm</th>
										<th>Sửa</th>
										<th>Xóa</th>
									</tr>
								</thead>
								<tbody class="text-center"></tbody>
							</table>

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
	$(document)
			.ready(
					function() {
						var brandMap = {};
						var categoryMap = {};

						$
								.ajax({
									url : "../Controller/Product_Controller.jsp",
									type : "GET",
									dataType : "json",
									success : function(data) {
										for (var i = 0; i < data.length; i++) {
											var product = data[i];
											brandMap[product.brand_id] = product.brand_name;
											categoryMap[product.category_id] = product.category_name;
										}

										var productTable = $("#productTable")
												.DataTable(
														{
															data : data,
															columns : [
																
																	{
																		data : "product_id",
																	},
																	{
																		data : "product_name",
																	},
																	{
																		data : null,
																		render : function(
																				data,
																				type,
																				full,
																				meta) {
																			var categoryName = categoryMap[full.category_id];
																			return categoryName;
																		},
																	},
																	{
																		data : null,
																		render : function(
																				data,
																				type,
																				full,
																				meta) {
																			var brandName = brandMap[full.brand_id];
																			return brandName;
																		},
																	},
																	{
																		data : "price",
																	},
																	{
																		data : "discounted_price",
																	},
																	{
																		data : null,
																		render : function(
																				data,
																				type,
																				full,
																				meta) {
																			return '<img src="' + full.product_image + '" alt="Hình ảnh sản phẩm" style="max-width: 100px; max-height: 100px;">';
																		},
																	},
																	{
																		data : "product_info",
																	},
																	{
																		data : null,
																		render : function(
																				data,
																				type,
																				full,
																				meta) {
																			return '<a href="Update_Product_View.jsp?product_id='
																					+ full.product_id
																					+ '" class="btn btn-warning"><i class="fa-sharp fa-solid fa-pen-to-square"></i> Sửa</a>';
																		},
																	},
																	{
																		data : null,
																		render : function(
																				data,
																				type,
																				full,
																				meta) {
																			return '<a href="../Controller/Product_Controller.jsp?action=delete&productIds='
																					+ full.product_id
																					+ '" class="btn btn-danger">	<i class="fa-sharp fa-solid fa-trash"></i> Xóa</a>';
																		},
																	},
																],
														});
									},
									error : function(jqXHR, textStatus,
											errorThrown) {
										console.log(textStatus, errorThrown);
									},
								});

					});
</script>

<jsp:include page="inc/footer.jsp" />
