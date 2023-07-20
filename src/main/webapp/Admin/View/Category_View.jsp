<%@page import="pxu.edu.vn.category.categoryModel"%>
<%@page import="pxu.edu.vn.category.category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.*"%>
<!-- Import lớp DAO -->

<jsp:include page="inc/header.jsp" />

<div class="content-wrapper">
	<!-- Các mã HTML khác ở đây -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Danh sách các category</h1>
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
										<th>ID CATEGORY</th>
										<th>TÊN CATEGORY</th>
										<!-- Thêm các cột khác của category nếu cần -->
										<th>Sửa</th>
										<th>Xóa</th>
									</tr>
								</thead>
								<tbody>
									<%
									try {
										// Gọi phương thức getAll() từ lớp DAO để lấy danh sách các category
										List<category> lstCategories = categoryModel.getAll();

										// Duyệt và hiển thị dữ liệu lên bảng
										for (category category : lstCategories) {
									%>
									<tr>
										<td><%=category.getCategory_id()%></td>
										<td><%=category.getCategory_name()%></td>
										<!-- Thêm các cột khác của category nếu cần -->
										<td>
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#exampleModal">
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
