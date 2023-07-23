<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng Ký</title>
<!-- Thư viện CSS và JS Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
<!-- Thư viện Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- CSS tùy chỉnh -->
<link rel="stylesheet" href="../css/reponsive.css">
<link rel="stylesheet" href="../css/index.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<%@ include file="../banner/header.jsp"%>
    <div class="login-form">
        <form action="../send_mail_check" method="post" onsubmit="return validateForm()">
            <section class="vh-80">
                <div class="container py-5 h-20">
                    <div class="row d-flex justify-content-center align-items-center h-80">
                        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                            <div class="card text-white" style="border-radius: 0.5rem;background-color: #2b80dd;">
                                <div class="card-body p-5 text-center">

                                    <div class="pb-5">
                                        <h2 class="fw-bold mb-2 text-uppercase">Kiểm Tra Tài Khoản</h2>
                                        <p class="text-white-30 mb-5">Vui nhập mã xác minh</p>

                                        <div class="form-outline form-white mb-4">
                                            <label class="form-label d-flex" for="typeEmailX">Mã xác minh</label>
                                            <input type="text" class="form-control form-control-xl" name="confirmation_code" id="confirmation_code" placeholder="Nhập mã xác minh của bạn..." />
                                        </div>

                                        <!-- Checkbox -->

                                        <button class="btn btn-outline-light btn-lg px-5 mb-3" type="submit">Xác Nhận</button>

                                        <div class="d-flex justify-content-center text-center">
                                            <a href="#!" class="text-white"><i class="bi bi-facebook"></i></a>
                                            <a href="#!" class="text-white"><i class="bi bi-youtube"></i></a>
                                            <a href="#!" class="text-white"><i class="bi bi-tiktok"></i></a>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>

    </div>
	<%@ include file="../banner/footer.jsp"%>
    <script>
    function validateForm() {
        var confirmationCode = document.getElementById("confirmation_code").value;

        if (confirmationCode.trim() === "") {
            alert("Vui lòng nhập mã xác minh.");
            return false;
        }

        return true;
    }
</script>
</body>
</html>
