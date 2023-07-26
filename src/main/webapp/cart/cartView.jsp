<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <%@ include file="../banner/header.jsp"%>
    <div class="container mt-5">
        <h2 class="mb-4 pd-4" style="border-bottom: 3px solid black; color:green;">Giỏ hàng</h2>
        <!-- Hiển thị thông tin giỏ hàng tại đây -->
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên sản phẩm</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <!-- Cart items will be dynamically added here -->
            </tbody>
        </table>
        <h3 class="fw-bold mt-4 d-flex justify-content-end">
            Tổng số tiền:
            <span class="text-danger total-amount"></span>
        </h3>
        <!-- Modal for sending invoice -->
        <div class="text-center mt-4">
            <button class="btn btn-success fw-3" data-bs-toggle="modal" data-bs-target="#sendInvoiceModal">
                <i class="bi bi-receipt"></i>Thanh Toán
            </button>
        </div>

        <!-- Modal -->
        <form id="sendInvoiceForm" action="../SendInvoiceServlet" method="post">
            <div class="modal fade" id="sendInvoiceModal" tabindex="-1" aria-labelledby="emailModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="emailModalLabel">Thông Tin Thanh Toán</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="nameInput" class="form-label">Họ và Tên Người Nhận</label>
                                <input type="text" class="form-control" id="nameInput" name="user_name" placeholder="Nhập Tên" required>
                            </div>
                            <div class="mb-3">
                                <label for="emailInput" class="form-label">Nhập địa chỉ email:</label>
                                <input type="email" class="form-control" id="emailInput" name="email"  placeholder="Nhập địa chỉ email" required>
                            </div>
                            <div class="mb-3">
                                <label for="phoneInput" class="form-label">Số Điện Thoại</label>
                                <input type="tel" class="form-control" id="phoneInput" name="phone" placeholder="Nhập Số Điện Thoại" required>
                            </div>
                            <div class="mb-3">
                                <label for="addressInput" class="form-label">Địa chỉ (số nhà/huyện(Phường), tỉnh(Tp))</label>
                                <input type="text" class="form-control" id="addressInput" name="address" placeholder="Nhập Địa chỉ" required>
                            </div>
                            <div class="mb-3">
                                <label for="paymentMethodInput" class="form-label">Phương Thức Thanh Toán</label>
                                <select class="form-select text-capitalize" id="paymentMethodInput" name="payment_method" aria-label="Default select example">
                                    <option selected>Chọn phương thức thanh toán</option>
                                    <option value="1">Chuyển Tiền Qua Momo</option>
                                    <option value="2">Chuyển Tiền Qua Thẻ</option>
                                    <option value="3">Thanh Toán Khi Nhận hàng</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-success">Thanh Toán</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <%@ include file="../banner/footer.jsp"%>
    <!-- Thêm các script cần thiết ở đây -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        // Sử dụng AJAX để gọi cartController.jsp và nhận dữ liệu thông tin giỏ hàng
        $.ajax({
            url: "cartController.jsp",
            type: "GET",
            dataType: "json",
            success: function(data) {
                // Xử lý dữ liệu và hiển thị thông tin giỏ hàng trên trang
                var cartItemList = data.cartItemList;
                var totalAmount = data.totalAmount;

                var cartTableBody = $("tbody");
                cartTableBody.empty();

                cartItemList.forEach(function(cartItem) {
                    var row = '<tr>' +
                        '<td>' + cartItem.stt + '</td>' +
                        '<td>' + cartItem.productName + '</td>' +
                        '<td>' + cartItem.price + ' đ</td>' +
                        '<td>' + cartItem.quantity + '</td>' +
                        '<td><span class="total-price">' + cartItem.totalPrice + '</span> đ</td>' +
                        '<td>' +
                        '<form action="../RemoveItemServlet" method="post">' +
                        '<input type="hidden" name="productId" value="' + cartItem.productId + '">' +
                        '<button type="submit" class="btn btn-danger">Xóa</button>' +
                        '</form>' +
                        '</td>' +
                        '</tr>';

                    cartTableBody.append(row);
                });

                // Set the totalAmount in the session after calculating it from the AJAX response
                
                
                $(".total-amount").text(totalAmount + ' đ');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Error: " + textStatus + " - " + errorThrown);
            }
        });
    });
</script>

   
</body>
</html>
