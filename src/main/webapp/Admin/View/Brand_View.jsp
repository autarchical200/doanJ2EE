<%@page import="java.util.ArrayList"%>
<%@page import="pxu.edu.vn.brand.brandModel"%>
<%@page import="pxu.edu.vn.brand.brand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="pxu.edu.vn.*"%>
<!-- Import lớp DAO -->

<jsp:include page="inc/header.jsp" />

<div class="content-wrapper">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Danh sách các hãng sản phẩm</h1>
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
										<th>ID HÃNG</th>
										<th>TÊN HÃNG</th>
										<th>Quốc Gia</th>
										<th>Ngày Thành Lập</th>
										<th>Sửa</th>
										<th>Xóa</th>

									</tr>
								</thead>
								<tbody>
									</tr>
							        <%-- Lấy danh sách hãng sản phẩm từ request --%>
							        <% ArrayList<brand> brandList = (ArrayList<brand>) request.getAttribute("brandList"); %>
							        <%-- Lặp qua danh sách hãng sản phẩm và hiển thị thông tin --%>
							        <% for (brand Brand : brandList) { %>
							            <tr>
							                <td><%= Brand.getBrand_id() %></td>
							                <td><%= Brand.getBrand_name() %></td>
							                <td><%= Brand.getBrand_country() %></td>
							                <td><%= Brand.getBrand_nsx() %></td>
							            </tr>
							        <% } %>
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