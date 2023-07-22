
<%
// Kiểm tra session, nếu đã tồn tại user thì kiểm tra role và điều hướng trang
if (session.getAttribute("username") != null) {
	String role = (String) session.getAttribute("role");
	if (role != null) {
		if (role.equals("admin")) {
	// Điều hướng đến trang admin
	response.sendRedirect("../Admin/View/Admin_index_View.jsp");
		} else if (role.equals("customer")) {
	// Điều hướng đến trang người dùng
	response.sendRedirect("../user/userView.jsp");
		}
		// Nếu role khác admin hoặc customer thì xử lý trường hợp khác (nếu cần)
	}
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
<link rel="stylesheet" href="../css/reponsive.css">
<link rel="stylesheet" href="../css/index.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>
	<%@ include file="../banner/header.jsp"%>

	<form action="loginController.jsp" method="POST"
		onsubmit="return validateForm()">

		<section class="vh-80">
			<div class="container py-5 h-20">
				<div
					class="row d-flex justify-content-center align-items-center h-80">
					<div class="col-12 col-md-8 col-lg-6 col-xl-5">
						<div class="card bg text-white" style="border-radius: 0.5rem;">
							<div class="card-body p-5 text-center">

								<div class="pb-5">

									<h2 class="fw-bold mb-2 text-uppercase">ĐĂNG NHẬP</h2>
									<p class="text-white-30 mb-5">Xin hãy nhập tài khoản và mật
										khẩu !</p>
									<%
									if (session.getAttribute("error") != null) {
									%>
									<script>
                                            Swal.fire({
                                                icon: 'error',
                                                title: '',
                                                text: '<%=session.getAttribute("error")%>',
                                            });
                                        </script>
									<%
									session.removeAttribute("error");
									}
									if (session.getAttribute("success") != null) {
									%>
									<script>
                                            Swal.fire({
                                                icon: 'success',
                                                title: '',
                                                text: '<%=session.getAttribute("success")%>
										',
												});
									</script>
									<%
									session.removeAttribute("success");
									}
									%>
									<div class="form-outline form-white mb-4">
										<label class="form-label d-flex" for="typeEmailX">Tên
											tài khoản</label> <input type="text"
											class="form-control form-control-xl" name="username"
											id="username" placeholder="Nhập tên tài khoản của bạn..." />

									</div>

									<div class="form-outline form-white mb-4">
										<label class="form-label d-flex" for="typePasswordX">Mật
											khẩu</label> <input type="password" id="password"
											class="form-control form-control-xl" name="password"
											placeholder="Nhập mật khẩu của bạn..." />
									</div>
									<!-- Checkbox -->
									<div class="form-check d-flex justify-content-start mb-4">
										<input class="form-check-input" type="checkbox" value=""
											id="showPasswordCheckbox" /> <label
											class="form-check-label px-2"
											class="form-control form-control-xl"
											for="showPasswordCheckbox">Hiện Thị mật khẩu</label>
									</div>

									<p class="small mb-5 pb-lg-2">
										<a class="text-white-50" href="#!">Quên mật khẩu ?</a>
									</p>

									<button class="btn btn-outline-light btn-lg px-5 mb-3"
										type="submit">ĐĂNG NHẬP</button>

									<div class="d-flex justify-content-center text-center">
										<a href="#!" class="text-white"><i class="bi bi-facebook"></i></a>
										<a href="#!" class="text-white"><i class="bi bi-youtube"></i></a>
										<a href="#!" class="text-white"><i class="bi bi-tiktok"></i></a>
									</div>

								</div>

								<div>
									<%
									String signup = "../Register/Register_View.jsp";
									%>
									<p class="mb-0">
										Don't have an account? <a href="<%=signup%>"
											class="text-white-50 fw-bold">Sign Up</a>
									</p>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
	<%@ include file="../banner/footer.jsp"%>
</body>
<script>
	document.addEventListener('DOMContentLoaded',
			function() {
				var countElement = document
						.getElementById('count_shopping_cart_store');
				countElement.innerText = '0';
				var countValue = 0;
			});

	function validateForm() {
		var username = document.getElementById('username').value;
		var password = document.getElementById('password').value;

		if (username.trim() === '' || password.trim() === '') {
			Swal.fire({
				icon : 'warning',
				title : '',
				text : 'Vui lòng nhập đầy đủ thông tin!',
			});
			return false;
		}

		return true;
	}
</script>
<script>
	// Lấy reference đến các elements cần thao tác
	const passwordInput = document.getElementById('password');
	const showPasswordCheckbox = document
			.getElementById('showPasswordCheckbox');

	// Xử lý sự kiện khi checkbox thay đổi trạng thái
	showPasswordCheckbox.addEventListener('change', function() {
		// Nếu checkbox được chọn, hiển thị mật khẩu bằng cách thay đổi thuộc tính "type" sang "text"
		if (this.checked) {
			passwordInput.type = 'text';
		} else {
			// Nếu checkbox không được chọn, ẩn mật khẩu bằng cách đổi lại thuộc tính "type" về "password"
			passwordInput.type = 'password';
		}
	});
</script>

</html>

<style>
.bg {
	background-color: #2b80dd;
}
</style>
