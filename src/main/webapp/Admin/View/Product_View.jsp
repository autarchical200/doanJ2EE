<%@page import="pxu.edu.vn.brand.brand"%>
<%@page import="pxu.edu.vn.category.category"%>
<%@page import="java.util.List"%>
<%@page import="pxu.edu.vn.*"%>
<%@page import="pxu.edu.vn.product.Product"%>
<%@page import="pxu.edu.vn.product.ProductModel"%>
<%@page import="pxu.edu.vn.category.categoryModel"%>
<%@page import="pxu.edu.vn.brand.brandModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.*"%>

<!-- Import lớp DAO -->

<jsp:include page="inc/header.jsp" />

<div class="content-wrapper">
    <!-- Thêm phần code hiển thị danh sách sản phẩm ở đây -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Danh sách sản phẩm</h1>
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
                                        <th>ID Sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Danh mục</th>
                                        <th>Thương hiệu</th>
                                        <th>Giá</th>
                                        <th>Giá giảm</th>
                                        <th>Hình ảnh</th>
                                        <th>Thông tin sản phẩm</th>
                                        <th>Sửa</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Lấy danh sách sản phẩm từ CSDL bằng ProductModel.getAll() --%>
                                    <%
                                    try {
                                        List<Product> lstProducts = ProductModel.getAll();

                                        // Duyệt và hiển thị dữ liệu lên bảng
                                        for (Product product : lstProducts) {
                                            // Lấy đối tượng Category và Brand từ CSDL bằng CategoryModel và BrandModel
                                            category category = categoryModel.getcategoryById(product.getCategory_id());
                                            brand brand = brandModel.getBrandById(product.getBrand_id());
                                    %>
                                    <tr>
                                        <td><%=product.getProduct_id()%></td>
                                        <td><%=product.getProduct_name()%></td>
                                        <td><%=category.getCategory_name()%></td>
                                        <td><%=brand.getBrand_name()%></td>
                                        <td><%=product.getPrice()%></td>
                                        <td><%=product.getDiscounted_price()%></td>
                                        <td>
                                            <!-- Hiển thị hình ảnh sản phẩm -->
                                            <%
                                            String imagePath = product.getProduct_image();
                                            %>
                                            <img src="<%=imagePath%>" width="100" height="100">
                                        </td>
                                        <td><%=product.getProduct_info()%></td>
                                        <td>
                                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#exampleModal">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-danger">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>
                                        </td>
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
