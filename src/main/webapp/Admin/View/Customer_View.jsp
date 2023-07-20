<%@page import="java.util.List"%>
<%@page import="pxu.edu.vn.*"%>
<%@page import="pxu.edu.vn.customer.Customer"%>
<%@page import="pxu.edu.vn.customer.CustomerModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.*"%>

<!-- Import lớp DAO -->

<jsp:include page="inc/header.jsp" />

<div class="content-wrapper">
    <!-- Thêm phần code hiển thị danh sách khách hàng ở đây -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Danh sách khách hàng</h1>
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
                                        <th>ID</th>
                                        <th>Tên khách hàng</th>
                                        <th>Email</th>
                                        <th>Điện thoại</th>
                                        <th>Giới tính</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Lấy danh sách khách hàng từ CSDL bằng CustomerModel.getAll() --%>
                                    <%
                                    try {
                                        List<Customer> lstCustomers = CustomerModel.getAll();

                                        // Duyệt và hiển thị dữ liệu lên bảng
                                        for (Customer customer : lstCustomers) {
                                    %>
                                    <tr>
                                        <td><%=customer.getUser_id()%></td>
                                        <td><%=customer.getFull_name()%></td>
                                        <td><%=customer.getEmail()%></td>
                                        <td><%=customer.getPhone()%></td>
                                        <td><%=customer.getRole()%></td>
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
