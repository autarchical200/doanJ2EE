<%
    // Kiểm tra session, nếu đã tồn tại user thì kiểm tra role và điều hướng trang
    if (session.getAttribute("username") != null) {
        String role = (String) session.getAttribute("role");
        if (role != null) {
            if (role.equals("admin")) {
                // Điều hướng đến trang admin
                response.sendRedirect("Admin/Admin_index.jsp");
            } else if (role.equals("customer")) {
                // Điều hướng đến trang người dùng
                response.sendRedirect("user/userView.jsp");
            }
            // Nếu role khác admin hoặc customer thì xử lý trường hợp khác (nếu cần)
        }
    } 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
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
</head>
<body>


	<%@ include file="banner/header.jsp"%>
	<%@ include file="banner/spanner.jsp"%>



	<div class="product">	
			<div class="container product-item">
				<div class="row product__show" id="productContainer"></div>
			</div>
	</div>
	<!-- end product -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							var categoryIDs = [ 1, 2, 3, 4, 5 ]; // Các categoryID bạn muốn hiển thị
							var productContainer = $('#productContainer');

							categoryIDs
									.forEach(function(categoryID) {
										// Gọi Ajax để lấy dữ liệu JSON từ "IndexController.jsp" cho từng categoryID
										$
												.ajax({
													url : "IndexController.jsp?categoryID="
															+ categoryID,
													type : "GET",
													dataType : "json",
													success : function(data) {
														// Xử lý dữ liệu JSON và hiển thị trong bảng cho từng categoryID
														var categoryName = data.categoryName;
														var products = data.products;

														productContainer
																.append('<div class="pro-head">'
																		+'<div class="product-title">'
																		+'<p>'
																		+ categoryName
																		+ '</p>')
																		+'</div>'
																		+'</div>'
																		;

														products
																.forEach(function(
																		product) {
																	var card = '<div class="col-md-6 col-lg-3 mt-4">'
																			+ '<div class="card">'
																			+ '<img src="img/products/' + product.productImg + '" class="card-img-top" alt="Product Image">'
																			+ '<div class="card-body">'
																			+ '<h5 class="card-title">'
																			+ product.productName
																			+ '</h5>'
																			+ '<p class="card-text">'
																			+ product.productInfo
																			+ '</p>'
																			+ '<div class="d-flex">'
																			+ (product.discountedPrice > 0 ? '<p class="product_discount-price">'
																					+ product.discountedPrice
																					+ '</p>'
																					: '')
																			+ '<p class="product_price">'
																			+ product.price
																			+ '</p>'
																			+ '</div>'
																			+ '<a href="#" class="btn btn-primary">Mua hàng</a>'
																			+ '</div>'
																			+ '</div>'
																			+ '</div>';

																	productContainer
																			.append(card);
																});
													},
													error : function(jqXHR,
															textStatus,
															errorThrown) {
														console.log(textStatus,
																errorThrown);
													}
												});
									});
						});
	</script>

	<%@ include file="banner/footer.jsp"%>
</body>
</html>