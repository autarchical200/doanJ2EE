<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// Lấy đường dẫn cơ bản tới file header
String headerBasePath = request.getContextPath();
// Kiểm tra xem đã có session và username hay chưa
String username = (String) session.getAttribute("username");
boolean isLoggedIn = (username != null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Link_thuvien -->
</head>
<body>
	<header>
		<div class="container">
			<div class="navbar align-items-center justify-content-between">
				<div class="navbar__logo hvr-buzz">
					<a href="<%=headerBasePath%>/index.jsp"> <img
						alt="laptopaz.com chuyên laptop cũ, bán laptop cũ uy tín Hà Nội và toàn quốc"
						src="<%=headerBasePath%>/img/icons/icon.png" class="img-fluid">
					</a>
				</div>
				<div class="navbar__cart align-items-center flex-column">
					<a href="<%=headerBasePath%>/cart.php"> <i
						class="bi bi-cart-fill"></i>
					</a> <a href="<%=headerBasePath%>/cart.php">Giỏ hàng</a> <span
						class="cart-quantity-counter" id="count_shopping_cart_store">0</span>
				</div>
				<div class="navbar__search-form">
					<!-- Form tìm kiếm theo tên sản phẩm -->
					<form class="input-group" id="searchForm">
						<input type="search" class="form-control rounded" name="search"
							placeholder="Bạn muốn tìm kiếm gì..." aria-label="Search"
							aria-describedby="search-addon">
						<button type="submit" class="btn">
							<i class="bi bi-search"></i>
						</button>
					</form>

				</div>
				<div
					class="navbar__hotline align-items-center flex-column hide-mobile hide-tablet">
					<p class="m-0 text-danger text-center">HOTLINE</p>
					<p>0825 233 233</p>
				</div>
			</div>
		</div>
		<!-- end_container -->
		<div class="menu">
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<button type="button" class="navbar-toggler"
						data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
						<i class="bi bi-list menu__toggler"></i>
					</button>
					<div class="collapse navbar-collapse container" id="navbarCollapse">
						<div class="navbar-nav">
							<a href="#" class="nav-item nav-link me-2"><i
								class="bi bi-laptop"></i> LAPTOP MỚI</a> <a href="#"
								class="nav-item nav-link me-2"><i class="bi bi-windows"></i>
								SURFACE</a> <a href="#" class="nav-item nav-link me-2"><i
								class="bi bi-laptop"></i> LAPTOP LIKE NEW</a> <a href="#"
								class="nav-item nav-link me-2"><i class="bi bi-fire"></i>
								KHUYẾN MÃI</a> <a href="#" class="nav-item nav-link me-2"><i
								class="bi bi-cash-coin"></i> TRẢ GÓP</a>
						</div>
						<div class="navbar-nav ms-auto">
							<%
							if (isLoggedIn) {
							%>
							<!-- Hiển thị chào username và nút đăng xuất -->
							<span class="nav-item nav-link me-4 text-light">Chào <%=username%>
								<i class="bi bi-person-check"></i></span> <a
								href="<%=headerBasePath%>/logout.jsp"
								class="nav-item nav-link me-4"> <i
								class="bi bi-box-arrow-right"></i> Đăng xuất
							</a>
							<%
							} else {
							%>
							<!-- Hiển thị nút đăng nhập và đăng ký -->
							<a href="<%=headerBasePath%>/login/loginView.jsp"
								class="nav-item nav-link me-4" data-toggle="modal"
								data-target="#modalLoginForm"> <i
								class="bi bi-box-arrow-in-left"></i> Đăng nhập
							</a> <a href="<%=headerBasePath%>/Register/Register_View.jsp"
								class="nav-item nav-link me-4"> <i
								class="bi bi-box-arrow-right"></i> Đăng ký
							</a>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</nav>
		</div>
		<!-- end_menu -->
	</header>

	<!-- Script xử lý tìm kiếm sản phẩm -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	
		$("#searchForm").submit(function(event) {
		    event.preventDefault();
		    var searchKeyword = $(this).find("input[name='search']").val().trim();
		    
		    if (searchKeyword === "") {
		    	Swal.fire({
					icon : 'warning',
					title : '',
					text : 'Hãy nhập từ khóa tìm kiếm!',
				});
		        return; // Dừng việc submit form
		    }

		    // Chuyển hướng đến trang product_search.jsp với từ khóa tìm kiếm là tham số productName trên URL
		    var searchURL = "<%=headerBasePath%>/product_search.jsp?productName=" + encodeURIComponent(searchKeyword);
		    window.location.href = searchURL;
		});
	</script>
</body>
</html>
