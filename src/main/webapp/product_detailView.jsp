<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/reponsive.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <%-- Include the header and spanner --%>
    <%@ include file="banner/header.jsp"%>

    <!-- Product section -->
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6 col-sm-12">
                    <img class="card-img-detail mb-5 mb-md-0" src="img/products/<%= request.getParameter("img") %>" alt="Hình ảnh sản phẩm" id="productImage">
                </div>
                <div class="col-md-6 col-sm-12">
                    <h1 class="display-6 fw-bolder" id="productName"></h1>
                    <div class="fs-5 mb-5">
                        <span class="text-danger fs-3 fw-bold" id="productDiscountedPrice"></span>
                        <span class="text-decoration-line-through mx-3" id="productPrice"></span>
                        <p class="mt-3 fs-5" style="font-family:'Times New Roman', Times, serif;" id="productInfo"></p>
                    </div>
                    <div class="d-flex">
                        <button class="btn btn-outline-info flex-shrink-0">
                            <i class="bi bi-cart-fill me-1"></i>
                            Thêm vào giỏ
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-12">
                    <!-- Các phần khác của trang -->
                </div>
                <div class="col-md-4 col-sm-12">
                    <!-- Các phần khác của trang -->
                </div>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Lấy thông tin sản phẩm từ form POST
            var productName = decodeURIComponent('<%= request.getParameter("name") %>');
            var productInfo = decodeURIComponent('<%= request.getParameter("info") %>');
            var productPrice = decodeURIComponent('<%= request.getParameter("price") %>');
            var productDiscountedPrice = decodeURIComponent('<%= request.getParameter("discountedPrice") %>');

            // Hiển thị thông tin sản phẩm lên trang
            $('#productName').text(productName);
            $('#productInfo').text(productInfo);
            $('#productPrice').text(productPrice);
            if (productDiscountedPrice > 0) {
                $('#productDiscountedPrice').text(productDiscountedPrice);
            } else {
                $('#productDiscountedPrice').hide(); // Ẩn giá giảm nếu không có giá giảm
            }
        });
    </script>

    <%-- Include the footer --%>
    <%@ include file="banner/footer.jsp"%>
</body>
</html>
