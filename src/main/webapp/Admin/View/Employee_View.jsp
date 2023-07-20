<%@page import="java.util.List"%>
<%@page import="pxu.edu.vn.*"%>
<%@page import="pxu.edu.vn.employee.employee"%>
<%@page import="pxu.edu.vn.employee.EmployeeModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.*"%>

<!-- Import lớp DAO -->

<jsp:include page="inc/header.jsp" />

<div class="content-wrapper">
    <!-- Thêm phần code hiển thị danh sách nhân viên ở đây -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Danh sách nhân viên</h1>
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
                                        <th>Tên nhân viên</th>
                                        <th>Email</th>
                                        <th>Điện thoại</th>
                                        <th>Giới tính</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Lấy danh sách nhân viên từ CSDL bằng EmployeeModel.getAll() --%>
                                    <%
                                    try {
                                        List<employee> lstEmployees = EmployeeModel.getAll();

                                        // Duyệt và hiển thị dữ liệu lên bảng
                                        for (employee employee : lstEmployees) {
                                    %>
                                    <tr>
                                        <td><%=employee.getUser_id()%></td>
                                        <td><%=employee.getFull_name()%></td>
                                        <td><%=employee.getEmail()%></td>
                                        <td><%=employee.getPhone()%></td>
                                        <td><%=employee.getRole()%></td>
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
