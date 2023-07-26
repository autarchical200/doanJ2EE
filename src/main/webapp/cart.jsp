<%@ page import="pxu.edu.vn.cart.CartItem"%>
<%@ page import="pxu.edu.vn.product.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<%@ include file="banner/header.jsp"%>
	<div class="container mt-5">
		<h2 class="mb-4">Giỏ hàng</h2>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>STT</th>
					<th>Tên sản phẩm</th>
					<th>Đơn giá</th>
					<th>Số lượng</th>
					<th>Tổng tiền</th>
					<th>Xóa</th>
				</tr>
			</thead>
			<tbody>
				<%
				Map<Integer, CartItem> cartMap = (Map<Integer, CartItem>) session.getAttribute("cart");
				int totalAmount = 0;
				if (cartMap != null) {
					int stt = 0;
					for (CartItem cartItem : cartMap.values()) {
						stt++;
						Product product = cartItem.getPro();
						int quantity = cartItem.getQuantity();
						long totalPrice = product.getDiscounted_price() > 0
						? product.getDiscounted_price() * quantity
						: product.getPrice() * quantity;
						totalAmount += totalPrice;
				%>
				<tr>
					<td><%=stt%></td>
					<td><%=product.getProduct_name()%></td>
					<td><%=product.getDiscounted_price() > 0 ? product.getDiscounted_price() : product.getPrice()%>
						đ</td>
					<td><%=quantity%></td>
					<td><%=totalPrice%> đ</td>
					<td>
						<form action="RemoveItemServlet" method="post">
							<input type="hidden" name="productId" value="<%=product.getProduct_id()%>">
							<button type="submit" class="btn btn-danger">Xóa</button>
						</form>
					</td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
		<h3 class="mt-4">
			Tổng số tiền:
			<%=totalAmount%>
			đ
		</h3>
		<h2 class="mt-4">Gửi hóa đơn qua email</h2>
		<form id="sendInvoiceForm" action="SendInvoiceServlet" method="post">
			<div class="mb-3">
				<label for="emailInput" class="form-label">Nhập địa chỉ
					email:</label> <input type="email" class="form-control" id="emailInput"
					name="email" required>
			</div>
			<button type="submit" class="btn btn-primary">Gửi hóa đơn</button>
		</form>
	</div>
	<%@ include file="banner/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
</body>
<!-- Trang cart.jsp -->

<%-- Save the total amount to the session --%>
<%
session.setAttribute("totalAmount", totalAmount);
%>

</html>
