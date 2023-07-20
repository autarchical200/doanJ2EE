<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
</head>
<body>
    <div class="container">
        <h2>Danh sách sản phẩm</h2>

        <table class="table table-bordered" id="productTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>ID danh mục</th>
                    <th>ID thương hiệu</th>
                    <th>Giá</th>
                    <th>Giá giảm</th>
                    <th>Ảnh sản phẩm</th>
                    <th>Thông tin sản phẩm</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            // Gọi Ajax để lấy danh sách sản phẩm từ "ProductController.jsp"
            $.ajax({
                url: "ProductController.jsp",
                type: "GET",
                dataType: "json",
                success: function(data) {
                    // Xử lý dữ liệu và hiển thị trong bảng
                    var productTable = $('#productTable').DataTable({
                        "data": data,
                        "columns": [
                            { "data": "productID" },
                            { "data": "productName" },
                            { "data": "categoryID" },
                            { "data": "brandID" },
                            { "data": "price" },
                            { "data": "discountedPrice" },
                            { "data": "productImg" },
                            { "data": "productInfo" }
                        ]
                    });
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(textStatus, errorThrown);
                }
            });
        });
    </script>
</body>
</html>
