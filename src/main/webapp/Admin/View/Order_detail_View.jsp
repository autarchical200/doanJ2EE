<%@page import="pxu.edu.vn.product.ProductModel"%>
<%@page import="pxu.edu.vn.product.Product"%>
<%@page import="pxu.edu.vn.order_detail.Order_Detail_Model"%>
<%@page import="pxu.edu.vn.order_detail.Order_Detail"%>
<%@page import="java.util.List"%>
<%@page import="pxu.edu.vn.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.*"%>

<!-- Import lớp DAO -->

<jsp:include page="inc/header.jsp" />

<div class="content-wrapper">
    <!-- Thêm phần code hiển thị danh sách chi tiết đơn đặt hàng ở đây -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Danh sách chi tiết đơn đặt hàng</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>ID Chi tiết đơn hàng</th>
                                        <th>ID Đơn hàng</th>
                                        <th>Tên Sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Lấy danh sách chi tiết đơn đặt hàng từ CSDL bằng Order_DetailModel.getAll() --%>
                                    <%
                                    try {
                                        List<Order_Detail> lstOrderDetails = Order_Detail_Model.getAll();

                                        // Duyệt và hiển thị dữ liệu lên bảng
                                        for (Order_Detail orderDetail : lstOrderDetails) {
                                            Product product = ProductModel.getProductById(orderDetail.getProduct_id());

                                    %>
                                    <tr>
                                        <td><%=orderDetail.getOrder_detail_id()%></td>
                                        <td><%=orderDetail.getOrder_id()%></td>
                                        <td><%=product.getProduct_name()%></td>
                                        <td><%=orderDetail.getQuantity()%></td>
                                        <td><%=orderDetail.getPrice()%></td>
                                    </tr>
                                    <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                        // Xử lý lỗi ở đây nếu cần thiết
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<jsp:include page="inc/footer.jsp" />
