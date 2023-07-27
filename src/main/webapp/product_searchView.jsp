
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
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Tìm Kiếm</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link rel="stylesheet" href="css/reponsive.css">
	<link rel="stylesheet" href="css/index.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style>
		.card {
			border: none;
			margin-bottom: 20px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		.card-img-top {
			height: 200px;
			object-fit: cover;
		}

		.card-title {
			font-size: 27px;
			font-weight: bold;
			margin-bottom: 10px;
		}

		.card-text {
			color: #555;
			margin-bottom: 10px;
		}

		.card-text.price {
			font-size: 16px;
			font-weight: bold;
			margin-bottom: 5px;
		}

		.card-text.discount-price {
			color: red;
			font-weight: bold;
		}

		.btn-primary {
			background-color: #007bff;
			border-color: #007bff;
			font-weight: bold;
		}

		.btn-primary:hover {
			background-color: #0069d9;
			border-color: #0062cc;
		}

		.text-success {
			color: green;
			font-weight: bold;
		}

		.text-danger {
			color: red;
			font-weight: bold;
		}
	</style>
</head>

<body>
	<%@ include file="banner/header.jsp"%>
	<main>
		<div class="container">
			<!-- Hiển thị kết quả tìm kiếm sản phẩm từ ServletController -->
			<div class="search-results">
				<ul id="productList"></ul>
			</div>
		</div>

		<!-- Nhúng file jQuery và script xử lý Ajax (từ file main) -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			$(document).ready(function() {
				function displaySearchResults(data) {
					// Hiển thị kết quả tìm kiếm lên trang
					var productList = $("#productList");
					productList.empty(); // Xóa các kết quả tìm kiếm cũ
					if (data.length > 0) {
						productList.append('<h3 class="mt-4">Kết quả tìm kiếm sản phẩm</h3>');
						data.forEach(function(product) {
							// Tạo và thêm các phần tử HTML cho từng kết quả tìm kiếm
							var listItem = 
								'<div class="card mb-3 mt-3">' +
								'<div class="row g-0">' +
								'<div class="col-md-4 hvr-buzz">' +
								'<a href="product_detailView.jsp?productId='+product.product_id +'"> <img class="w-100" style="max-width: 250px;" src="img/products/' + product.product_image + '" class="card-img-top"></a>' +
								'</div>' +
								'<div class="col-md-8">' +
								'<div class="card-body" style="font-family: \'Times New Roman\', Times, serif;">' +
								'<h2 class="card-title">' + product.product_name + '</h2>' +
								'<p class="card-text">' + product.product_info + '</p>' +
								'<p class="card-text price fs-4"><strike>' + product.price + 'đ</strike></p>' +
								'<p class="card-text price discount-price fs-3">' + product.discounted_price + 'đ</p>' +
								'<a href="product_detailView.jsp?productId='+product.product_id +'" class="btn btn-primary mt-4">Xem chi tiết</a>' +
								'</div>' +
								'</div>' +
								'</div>' +
								'</div>';
							productList.append(listItem);
						});
					} else {
						productList.append('<h3 class="mt-4 text-danger text-center">Không tìm thấy kết quả!!</h3>');
					}
				}

				function performSearch(searchKeyword) {
					// Gọi Ajax để lấy kết quả tìm kiếm sản phẩm từ ProductSearchServlet
					$.ajax({
						url: "ProductSearchServlet",
						type: "GET",
						data: {
							productName: searchKeyword
						},
						dataType: "json",
						success: function(data) {
							displaySearchResults(data);
						},
						error: function(jqXHR, textStatus, errorThrown) {
							console.log(textStatus, errorThrown);
						}
					});
				}

				// Xử lý tìm kiếm ngay khi tải trang (nếu có từ khóa tìm kiếm)
				var urlParams = new URLSearchParams(window.location.search);
				var productName = urlParams.get('productName');
				if (productName !== null && productName.trim() !== "") {
					performSearch(productName);
				}

				// Xử lý tìm kiếm khi người dùng submit form
				$("#searchForm").submit(function(event) {
					event.preventDefault();
					var searchKeyword = $(this).find("input[name='search']").val().trim();
					if (searchKeyword !== "") {
						performSearch(searchKeyword);
					} else {
					
					}
				});
			});
		</script>
	</main>
	<%@ include file="banner/footer.jsp"%>
</body>
</html>