<%@page import="java.util.List"%>
<%@page import="pxu.edu.vn.*"%>
<%@page import="pxu.edu.vn.inventory.Inventory"%>
<%@page import="pxu.edu.vn.inventory.InventoryModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.*"%>

<!-- Import lớp DAO -->

<jsp:include page="inc/header.jsp" />

<div class="content-wrapper">
    <!-- Thêm phần code hiển thị danh sách kho hàng ở đây -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Danh sách kho hàng</h1>
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
                                        <th>ID Kho</th>
                                        <th>ID Sản phẩm</th>
                                        <th>Ngày thêm</th>
                                        <th>Số lượng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Lấy danh sách kho hàng từ CSDL bằng InventoryModel.getAll() --%>
                                    <%
                                    try {
                                        List<Inventory> lstInventories = InventoryModel.getAll();

                                        // Duyệt và hiển thị dữ liệu lên bảng
                                        for (Inventory inventory : lstInventories) {
                                    %>
                                    <tr>
                                        <td><%=inventory.getInventory_id()%></td>
                                        <td><%=inventory.getProduct_id()%></td>
                                        <td><%=inventory.getDate_add()%></td>
                                        <td><%=inventory.getQuantity()%></td>
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
