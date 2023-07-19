<%@page import="pxu.edu.vn.customer.CustomerModel"%>
<%@page import="pxu.edu.vn.customer.Customer"%>
<%@page import="java.util.List"%>
<%@page import="pxu.edu.vn.*"%>
<%@page import="pxu.edu.vn.order.Order"%>
<%@page import="pxu.edu.vn.order.OrderModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.*"%>

<!-- Import lớp DAO -->

<jsp:include page="inc/header.jsp" />

<div class="content-wrapper">
    <!-- Thêm phần code hiển thị danh sách đơn đặt hàng ở đây -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Danh sách đơn đặt hàng</h1>
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
                                        <th>ID Đơn hàng</th>
                                        <th>Tên Khách hàng</th>
                                        <th>Ngày đặt hàng</th>
                                        <th>Tổng số tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Lấy danh sách đơn đặt hàng từ CSDL bằng OrderModel.getAll() --%>
                                    <%
                                    try {
                                        List<Order> lstOrders = OrderModel.getAll();

                                        // Duyệt và hiển thị dữ liệu lên bảng
                                        for (Order order : lstOrders) {
                                            Customer customer = CustomerModel.getCustomerById(order.getUser_id());

                                    %>
                                    <tr>
                                        <td><%=order.getOrder_id()%></td>
                                        <td><%=customer.getFull_name()%></td>
                                        <td><%=order.getOrder_date()%></td>
                                        <td><%=order.getTotal_amount()%></td>
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
