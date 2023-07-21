<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="my-4">Danh sách sản phẩm</h2>

        <div class="row" id="productContainer">
            <!-- Đây là nơi dữ liệu JSON sẽ được hiển thị -->
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            var categoryIDs = [1, 2, 3, 4, 5]; // Các categoryID bạn muốn hiển thị
            var productContainer = $('#productContainer');

            categoryIDs.forEach(function(categoryID) {
                // Gọi Ajax để lấy dữ liệu JSON từ "controller.jsp" cho từng categoryID
                $.ajax({
                    url: "ProductController.jsp?categoryID=" + categoryID,
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        // Xử lý dữ liệu JSON và hiển thị trong bảng cho từng categoryID
                        var categoryName = ""; // Biến để lưu tên của category
                        data.forEach(function(product) {
                            // Lưu tên category vào biến categoryName
                            if (categoryName === "") {
                                categoryName = product.categoryName; // Giả sử productName chứa tên category
                                productContainer.append('<h3 class="my-4">' + categoryName + '</h3>');
                            }

                            var card = '<div class="col-md-3">' +
                                '<div class="card">' +
                                '<img src="img/products/' + product.productImg + '" class="card-img-top" alt="Product Image">' +
                                '<div class="card-body">' +
                                '<h5 class="card-title">' + product.productName + '</h5>' +
                                '<p class="card-text">' + product.productInfo + '</p>' +
                                '<div class="">' +
                                (product.discountedPrice > 0 ? '<p class="card-text text-danger">' + product.discountedPrice + '</p>' : '') +
                                '<p>' + product.price + '</p>' +
                                '</div>' +
                                '<a href="#" class="btn btn-primary">Mua hàng</a>' +
                                '</div>' +
                                '</div>' +
                                '</div>';

                            productContainer.append(card);
                        });
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }
                });
            });
        });
    </script>
</body>
</html>
