<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="../plugins/fontawesome-free/css/all.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="../plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>
</head>
<body
	class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__wobble" src="../dist/img/AdminLTELogo.png"
				alt="AdminLTELogo" height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-dark">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Home</a></li>

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
									placeholder="Search" aria-label="Search">
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
				src="../dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">AdminLTE 3</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="../dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">ADMIN DỤNG</a>
					</div>
				</div>
				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search">
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
						<li class="nav-item menu-open"><a href="#"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>Dashboard</p>
						</a></li>

						<li class="nav-item"><a href="#" class="nav-link"> <i
								class=" nav-icon fa-solid fa-laptop"></i>
								<p>
									Quản lý Sản Phẩm <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="Admin_Brand.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Hãng Sản Phẩm</p>
								</a></li>
								<li class="nav-item"><a
									href="" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Loại Sản Phẩm</p>
								</a></li>
								<li class="nav-item"><a href="#"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Sản Phẩm</p>
								</a></li>

							</ul></li>

						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-table"></i>

								<p>
									Quản lý Hóa Đơn <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Hóa Đơn</p>
								</a></li>
								<li class="nav-item"><a
									href="#" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>Chi Tiết Hóa Đơn</p>
								</a></li>


							</ul></li>

						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-users"></i>

								<p>
									Quản lý Khách Hàng</i>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fa-solid fas fa-user"></i>

								<p>
									Quản lý Nhân Sự</i>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-house"></i>
								<p>
									Quản lý Kho</i>
								</p>
						</a></li>
						<li>

							<p></p>
						</li>
						<li>

							<p></p>
						</li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fa-sharp fa-solid fa-right-from-bracket"></i>

								<p>
									Đăng Xuất</i>
								</p>
						</a></li>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Dashboard</h1>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- Info boxes -->
					<div class="row">
						<div class="col-12 col-sm-6 col-md-3">
							<div class="info-box">
								<span class="info-box-icon bg-info elevation-1"><i
									class="fas fa-money-bill"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Doanh Thu</span> <span
										class="info-box-number"> 10 <small>%</small>
									</span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-12 col-sm-6 col-md-3">
							<div class="info-box mb-3">
								<span class="info-box-icon bg-danger elevation-1"><i
									class="fas fa-solid fa-laptop"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Sản Phẩm</span> <span
										class="info-box-number">41,410</span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->

						<!-- fix for small devices only -->
						<div class="clearfix hidden-md-up"></div>

						<div class="col-12 col-sm-6 col-md-3">
							<div class="info-box mb-3">
								<span class="info-box-icon bg-success elevation-1"><i
									class="fas fa-solid fa-table"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Hóa Đơn</span> <span
										class="info-box-number">760</span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-12 col-sm-6 col-md-3">
							<div class="info-box mb-3">
								<span class="info-box-icon bg-warning elevation-1"><i
									class="fas fa-users"></i></span>

								<div class="info-box-content">
									<span class="info-box-text">Khách Hàng</span> <span
										class="info-box-number">2,000</span>
								</div>
								<!-- /.info-box-content -->
							</div>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title">Thống Kê Doanh Thu 2023</h5>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div class="row">
										<div class="col-md-8">
											<div class="chart">
												<!-- Sales Chart Canvas -->
												<canvas id="salesChart" height="180" style="height: 180px;"></canvas>
											</div>
											<!-- /.chart-responsive -->
										</div>
										<!-- /.col -->
										<div class="col-md-4">
											<p class="text-center">
												<strong>Mục Tiêu Hoàn Thành</strong>
											</p>
											<div class="progress-group">
												Tổng Doanh Thu <span class="float-right"><b>160</b>/200</span>
												<div class="progress progress-sm">
													<div class="progress-bar bg-primary" style="width: 80%"></div>
												</div>
											</div>
											<!-- /.progress-group -->

											<div class="progress-group">
												Tổng Hóa Đơn <span class="float-right"><b>310</b>/400</span>
												<div class="progress progress-sm">
													<div class="progress-bar bg-danger" style="width: 75%"></div>
												</div>
											</div>

											<!-- /.progress-group -->
											<div class="progress-group">
												<span class="progress-text">Tổng Khách Hàng</span> <span
													class="float-right"><b>480</b>/800</span>
												<div class="progress progress-sm">
													<div class="progress-bar bg-success" style="width: 60%"></div>
												</div>
											</div>

											<!-- /.progress-group -->
											<div class="progress-group">
												Tỏng Sản Phẩm Bán Ra <span class="float-right"><b>250</b>/500</span>
												<div class="progress progress-sm">
													<div class="progress-bar bg-warning" style="width: 50%"></div>
												</div>
											</div>
											<!-- /.progress-group -->
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
								</div>
								<!-- ./card-body -->
								<div class="card-footer">
									<div class="row">
										<div class="col-sm-3 col-6">
											<div class="description-block border-right">
												<h5 class="description-header">$35,210.43</h5>
												<span class="description-text">Tổng Doanh Thu</span>
											</div>
											<!-- /.description-block -->
										</div>
										<!-- /.col -->
										<div class="col-sm-3 col-6">
											<div class="description-block border-right">
												<h5 class="description-header">$10,390.90</h5>
												<span class="description-text">Kinh Phí</span>
											</div>
											<!-- /.description-block -->
										</div>
										<!-- /.col -->
										<div class="col-sm-3 col-6">
											<div class="description-block border-right">

												<h5 class="description-header">$24,813.53</h5>
												<span class="description-text">Tổng Lợi Nhuận</span>
											</div>
											<!-- /.description-block -->
										</div>
										<!-- /.col -->
										<div class="col-sm-3 col-6">
											<div class="description-block">
												<h5 class="description-header">1200</h5>
												<span class="description-text">GOAL COMPLETIONS</span>
											</div>
											<!-- /.description-block -->
										</div>
									</div>
									<!-- /.row -->
								</div>
								<!-- /.card-footer -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!--/. container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2014-2021 <a
				href="https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.2.0
			</div>
		</footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->
	<!-- jQuery -->
	<script src="../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/adminlte.js"></script>
	<!-- PAGE PLUGINS -->
	<!-- jQuery Mapael -->
	<script src="../plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
	<script src="../plugins/raphael/raphael.min.js"></script>
	<script src="../plugins/jquery-mapael/jquery.mapael.min.js"></script>
	<script src="../plugins/jquery-mapael/maps/usa_states.min.js"></script>
	<!-- ChartJS -->
	<script src="../plugins/chart.js/Chart.min.js"></script>

	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="../dist/js/pages/dashboard2.js"></script>
</body>
</html>