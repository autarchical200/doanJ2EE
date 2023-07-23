
<%
// Kiểm tra session, nếu đã tồn tại user thì kiểm tra role và điều hướng trang
if (session.getAttribute("username") != null) {
	String role = (String) session.getAttribute("role");
	if (role != null) {
		if (role.equals("admin")) {
	// Điều hướng đến trang admin
	response.sendRedirect("Admin/View/Admin_index_View.jsp");
		} 
		// Nếu role khác admin hoặc customer thì xử lý trường hợp khác (nếu cần)
	}
}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin sản phẩm</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="css/reponsive.css">
<link rel="stylesheet" href="css/index.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%@ include file="banner/header.jsp"%>
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6 col-sm-12">
					<img class="card-img-detail mb-5 mb-md-0" src=""
						alt="Hình ảnh sản phẩm" id="productImage">
				</div>
				<div class="col-md-6 col-sm-12">
					<h1 class="display-6 fw-bolder" id="productName"></h1>
					<div class="fs-5 mb-5">
						<span class="text-danger fs-3 fw-bold" id="productDiscountPrice"></span>
						<span class="text-decoration-line-through mx-3 " id="productPrice"></span>
						<p class="mt-3 fs-5"
							style="font-family: 'Times New Roman', Times, serif;">Với
							thiết kế sang trọng, kiểu dáng thanh lịch màn hình chuyên biệt,
							độ sáng cao, màu sắc chân thực sống động cùng với hiệu năng mới
							mẻ và cực kì mạnh mẽ từ vi xử lý AMD 7000 mới nhất hiện nay. Sự
							kết hợp hoàn hảo và cực kì tuyệt vờ cho những ai có công việc
							liên quan đến thiết kế hình ảnh hay đồ họa cao cấp. Nghe đến đây
							mọi người đã thấy ưng ý chưa ạ, hãy cùng LaptopAZ đi tìm hiểu chi
							tiết về chiếc laptop này ngay thôi nào!</p>
					</div>
					<p class="lead" id="productInfo"></p>
					<div class="d-flex">
						<%
						String productId = request.getParameter("product_id");
						String productName = request.getParameter("product_name");
						String productPrice = request.getParameter("discounted_price") != null
								? request.getParameter("discounted_price")
								: request.getParameter("price");
						%>

						<%
						if (session.getAttribute("username") != null) {
							// Nếu đã đăng nhập, hiển thị form thêm vào giỏ hàng
						%>
						<form action="cart.jsp" method="post">
							<input type="hidden" name="hidden_id" value="<%=productId%>">
							<input type="hidden" name="hidden_name"
								value="<%=productName%>"> <input type="hidden"
								name="hidden_price" value="<%=productPrice%>">
							<div class="d-flex">
								<input class="form-control text-center me-3" name="quantity"
									id="inputQuantity" type="number" value="1" min="1"
									style="max-width: 3rem">
								<button class="btn btn-outline-success flex-shrink-0"
									name="add_to_cart" type="submit">
									<i class="bi bi-cart-fill me-1"></i> Thêm vào giỏ
								</button>
							</div>
						</form>
						<%
						} else {
						// Nếu chưa đăng nhập, hiển thị nút mua hàng và cảnh báo
						%>
						<button class="btn btn-outline-info flex-shrink-0"
							onclick="validateBtn()">
							<i class="bi bi-cart-fill me-1"></i> Thêm vào giỏ
						</button>
						<%
						}
						%>


					</div>

				</div>

			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-8 col-sm-12">
					<div class="title-tab col-12">
						<h3>Đặc điểm nổi bật</h3>
					</div>
					<h5 style="text-align: left;" align="center">
						Dell Latidual 827<span> hướng đến đối tượng nào?</span>
					</h5>
					<img class="w-100 mt-3 mb-3" src="img/products/product_detail.jpg"
						alt="">
					<p class="d-block"
						style="font-family: 'Times New Roman', Times, serif;">Với
						thiết kế sang trọng, kiểu dáng thanh lịch màn hình chuyên biệt, độ
						sáng cao, màu sắc chân thực sống động cùng với hiệu năng mới mẻ và
						cực kì mạnh mẽ từ vi xử lý AMD 7000 mới nhất hiện nay. Sự kết hợp
						hoàn hảo và cực kì tuyệt vờ cho những ai có công việc liên quan
						đến thiết kế hình ảnh hay đồ họa cao cấp. Nghe đến đây mọi người
						đã thấy ưng ý chưa ạ, hãy cùng LaptopAZ đi tìm hiểu chi tiết về
						chiếc laptop này ngay thôi nào!</p>
				</div>
				<div class="col-md-4 col-sm-12">
					<div class=" pl-0">
						<div class="title-tab">
							<h3>Thông số kỹ thuật</h3>
						</div>
						<div class="pro-parameter">
							<div class="prodetail-spec-full"
								style="font-size: 11px; font-family: Times New Roman;">

								<p>
									<span
										style="color: #0000ff; font-family: arial, helvetica, sans-serif; font-size: 10pt;"><strong>Thông
											số kỹ thuật</strong></span>
								</p>
								<table class="table table-striped table-bordered"
									style="height: 270px; float: left;" width="262">
									<tbody>
										<tr>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;"><strong>CPU</strong></span></td>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">AMD
													Ryzen 5-7530U (2.00GHz up to 4.50GHz, 19MB Cache)</span></td>
										</tr>
										<tr>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;"><strong>RAM</strong></span></td>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">16GB
													LPDDR4-3200MHz</span></td>
										</tr>
										<tr>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;"><strong>Ổ
														cứng</strong></span></td>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">512GB
													NVMe PCIe Gen3x4 SSD</span></td>
										</tr>
										<tr>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;"><strong>Card
														VGA</strong></span></td>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">AMD
													Radeon Graphics</span></td>
										</tr>
										<tr>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;"><strong>Màn
														hình</strong></span></td>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">14
													inch FHD(1920 x 1080) IPS-Level</span></td>
										</tr>
										<tr>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;"><strong>Webcam</strong></span></td>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">720p
													HD</span></td>
										</tr>
										<tr>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;"><strong>Cổng
														kết nối</strong></span></td>
											<td scope="row">
												<p>
													<span
														style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">1
														x Type-C USB3.2 Gen2 with PD charging</span>
												</p>
												<p>
													<span
														style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">1
														x Type-A USB3.2 Gen2</span>
												</p>
												<p>
													<span
														style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">2
														x Type-A USB2.0</span>
												</p>
												<p>
													<span
														style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">1
														x&nbsp;HDMI™ 2.1 (4K @ 60Hz)</span>
												</p>
												<p>
													<span
														style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">1
														x Mic-in/Headphone-out Combo Jack</span>
												</p>
												<p>
													<span
														style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">1
														x Micro SD</span>
												</p>
											</td>
										</tr>
										<tr>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;"><strong>Trọng
														lượng</strong></span></td>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">1.4kg</span></td>
										</tr>
										<tr>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;"><strong>Pin</strong></span></td>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">3Cell
													39Whrs</span></td>
										</tr>
										<tr>
											<td scope="row"><span
												style="font-family: arial, helvetica, sans-serif; font-size: 8pt;"><strong>Hệ
														điều hành</strong></span></td>
											<td scope="row"><span
												style="font-size: 8pt; font-family: arial, helvetica, sans-serif;">Windows
													11 bản quyền</span></td>
										</tr>
									</tbody>
								</table>
								<div id="eJOY__extension_root"
									class="eJOY__extension_root_class" style="all: unset;">
									<span
										style="font-family: arial, helvetica, sans-serif; font-size: 8pt;">&nbsp;</span>
								</div>

								<a href="javascript:;" data-fancybox=""
									data-src="#box_product-spec" class=" mt-2"><h5>Xem cấu
										hình chi tiết</h5></a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<%@ include file="banner/footer.jsp"%>
	<!-- Nhúng file jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	function validateBtn() {
		Swal.fire({
			icon : 'warning',
			title : '',
			text : 'Bạn cần đăng nhập để mua hàng!',
		});
	}
		$(document)
				.ready(
						function() {
							var urlParams = new URLSearchParams(
									window.location.search);
							var productId = urlParams.get('productId');

							// Gọi Ajax để lấy thông tin chi tiết sản phẩm từ ProductDetailServlet
							$
									.ajax({
										url : "ProductDetailServlet?productId="
												+ productId,
										type : "GET",
										dataType : "json",
										success : function(data) {
											// Hiển thị thông tin chi tiết sản phẩm lên trang
											$("#productName").text(
													data.product_name);
											$("#productInfo").text(
													data.product_info);
											$("#productPrice").text(data.price);
											$("#productDiscountPrice").text(
													data.discounted_price);
											$("#brandName").text(
													data.brand_name);
											$("#categoryName").text(
													data.category_name);
											$("#productImage")
													.attr(
															"src",
															"img/products/"
																	+ data.product_image);
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											console
													.log(textStatus,
															errorThrown);
										}
									});
						});
	</script>
</body>

</html>
<style>
.card-img-detail {
	max-width: 350px;
	min-width: 350px;
}

body {
	background-color: #fff
}
</style>