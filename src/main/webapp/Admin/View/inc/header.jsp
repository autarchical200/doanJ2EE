
<%
// Kiểm tra session, nếu đã tồn tại user thì kiểm tra role và điều hướng trang
if (session.getAttribute("username") != null) {
	String role = (String) session.getAttribute("role");
	if (role != null) {
		if (role.equals("customer")) {
	// Điều hướng đến trang admin
	response.sendRedirect("../../user/userView.jsp");
		}

	}
} else {
	// Nếu không tồn tại user, đưa về trang login
	response.sendRedirect("../../login/loginView.jsp");
}
%>




<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>


<%
// Kiểm tra session, nếu đã tồn tại user thì kiểm tra role và điều hướng trang
if (session.getAttribute("username") != null) {
	String role = (String) session.getAttribute("role");
	if (role != null) {
		if (role.equals("customer")) {
	// Điều hướng đến trang admin
	response.sendRedirect("../user/userView.jsp");
		}

	}
} else {
	// Nếu không tồn tại user, đưa về trang login
	response.sendRedirect("../login/loginView.jsp");
}
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Quản Lý</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
<!-- Font Awesome -->
<link rel="stylesheet"
	href="../../plugins/fontawesome-free/css/all.min.css" />
<!-- DataTables -->
<link rel="stylesheet"
	href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css" />
<link rel="stylesheet"
	href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css" />
<link rel="stylesheet"
	href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css" />
<!-- Theme style -->
<link rel="stylesheet"
	href="../../plugins/summernote/summernote-bs4.min.css">

<link rel="stylesheet" href="../../dist/css/adminlte.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.tiny.cloud/1/32tfdng4zr23jb6gjpzk301hd7a82if65rs6br8by9hvgqd6/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>
<!-- Thư viện SweetAlert2 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.min.css">

</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="#" role="button"> <i
						class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search" />
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>

				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
						<span class="badge badge-danger navbar-badge">3</span>
				</a></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button"> <i
						class="fas fa-expand-arrows-alt"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"
					role="button"> <i class="fas fa-th-large"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="#" class="brand-link"> <img
				src="../../dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: 0.8" />
				<span class="brand-text font-weight-light">AdminLTE 3</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="../../dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image" />
					</div>
					<div class="info">
						<%
						String username = (String) session.getAttribute("username");
						boolean isLoggedIn = (username != null);
						if (isLoggedIn) {
						%>
						<a href="#" class="d-block">Chào <%=username%>!
						</a>

						<%
						}
						%>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search" />
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item"><a href="Admin_index_View.jsp"
							class="nav-link"> <i class="nav-icon fas fa-tachometer-alt"></i>
								<p>Dashboard</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-laptop"></i>
								<p>
									Quản Lý Sản Phẩm <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="Brand_View.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Hãng Sản Phẩm</p>
								</a></li>
								<li class="nav-item"><a href="Category_View.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Loại Sản Phẩm</p>
								</a></li>
								<li class="nav-item"><a href="Product_View.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Sản phẩm</p>
								</a></li>

							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-money-bill"></i>
								<p>
									Quản Lý Hóa Đơn <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="Order_View.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Hóa Đơn</p>
								</a></li>
								<li class="nav-item"><a href="Order_detail_View.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Chi Tiết Hóa Đơn</p>
								</a></li>

							</ul></li>
						<li class="nav-item"><a href="Customer_View.jsp"
							class="nav-link"> <i class="nav-icon fas fa-users"></i>
								<p>Quản Lý Khách Hàng</p>
						</a></li>
						<li class="nav-item"><a href="Employee_View.jsp"
							class="nav-link"> <i class="nav-icon fas fa-user"></i>
								<p>Quản Lý Nhân Viên</p>
						</a></li>
						<li class="nav-item"><a href="Invengory_View.jsp"
							class="nav-link"> <i class="nav-icon fas fa-house"></i>
								<p>Quản Lý Kho</p>
						</a></li>
						<li>
							<p></p>

						</li>
						<li>
							<p></p>

						</li>

						<li class="nav-item"><a href="../../logout.jsp"
							class="nav-link"> <i class="fa-solid fa-right-from-bracket"></i>
								<p>Đăng Xuất</p>
						</a></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>