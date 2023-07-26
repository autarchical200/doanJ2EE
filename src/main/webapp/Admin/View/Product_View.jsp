<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<div class="row justify-content-center">
								<a href="Add_Product_View.jsp">
									<button class="btn btn-primary">
										<i class="fa-sharp fa-solid fa-plus"></i> Thêm Sản Phẩm
									</button>
								</a>
							</div>
							<!-- ... -->
							<table class="table table-bordered" id="productTable">
								<thead>
									<tr class="text-center">
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
								<tbody class="text-center"></tbody>
							</table>

							<!-- ... -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
    $(document).ready(function() {
      var brandMap = {};
      var categoryMap = {};

      function loadData() {
        $.ajax({
          url: "../Controller/Product_Controller.jsp",
          type: "GET",
          dataType: "json",
          success: function(data) {
            // Lưu trữ dữ liệu tạm thời để sử dụng trong hàm confirmDelete
            brandMap = {};
            categoryMap = {};
            for (var i = 0; i < data.length; i++) {
              var product = data[i];
              brandMap[product.brand_id] = product.brand_name;
              categoryMap[product.category_id] = product.category_name;
            }

            // Tạo bảng dữ liệu
            createProductTable(data);
          },
          error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
          },
        });
      }

      function createProductTable(data) {
        // Kiểm tra nếu bảng đã tồn tại thì hủy nó trước khi tạo mới
        if ($.fn.DataTable.isDataTable("#productTable")) {
          $("#productTable").DataTable().destroy();
        }

        // Tạo lại bảng dữ liệu
        $("#productTable").DataTable({
          data: data,
          columns: [
            { data: "product_id" },
            { data: "product_name" },
            {
              data: null,
              render: function(data, type, full, meta) {
                var categoryName = categoryMap[full.category_id];
                return categoryName;
              },
            },
            {
              data: null,
              render: function(data, type, full, meta) {
                var brandName = brandMap[full.brand_id];
                return brandName;
              },
            },
            { data: "price" },
            { data: "discounted_price" },
            {
              data: null,
              render: function(data, type, full, meta) {
                return '<img src="../../img/products/' + full.product_image + '" alt="Hình ảnh sản phẩm" style="max-width: 100px; max-height: 100px;">';
              },
            },
            { data: "product_info" },
            {
              data: null,
              render: function(data, type, full, meta) {
                return '<a href="Update_Product_View.jsp?product_id=' + full.product_id + '" class="btn btn-warning"><i class="fa-sharp fa-solid fa-pen-to-square"></i> Sửa</a>'
                ;
              },
            },
            {
                data: null,
                render: function(data, type, full, meta) {
                  return  '<a href="../Controller/Product_Controller.jsp?action=delete&productIds=' + full.product_id + '" class="btn btn-danger btn_delete"><i class="fa-sharp fa-solid fa-trash"></i> Xóa</a>';
                },
              },
          ],
        });
      }
      // Gán sự kiện click cho nút "Xóa" với class "btn_delete"
      $(document).on('click', '.btn_delete', function(e) {
        e.preventDefault(); // Ngăn chặn hành vi mặc định khi nhấp vào liên kết

        // Lấy URL xóa sản phẩm từ thuộc tính href của nút "Xóa"
        var deleteUrl = $(this).attr('href');

        // Hiển thị thông báo xác nhận
        Swal.fire({
          title: 'Bạn có muốn xóa sản phẩm này không?',
          text: "Nếu xóa, bạn không thể khôi phục lại!",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#d33',
          cancelButtonColor: '#3085d6',
          confirmButtonText: 'Xóa',
          cancelButtonText: 'Hủy',
        }).then((result) => {
          if (result.isConfirmed) {
            // Nếu người dùng đồng ý xóa, thực hiện yêu cầu xóa sản phẩm bằng Ajax
            $.ajax({
              url: deleteUrl,
              type: 'GET',
              success: function(response) {
                // Xử lý phản hồi từ máy chủ sau khi xóa sản phẩm thành công
                // Hiển thị thông báo thành công nếu cần thiết
                Swal.fire({
                  icon: 'success',
                  title: 'Đã xóa thành công!',
                  text: 'Sản phẩm đã được xóa khỏi danh sách.',
                });

                // Sau khi xóa thành công, cập nhật lại dữ liệu và load lại trang
                loadData();
              },
              error: function(error) {
                // Xử lý lỗi nếu có
                console.error('Error:', error);
                Swal.fire({
                  icon: 'error',
                  title: 'Lỗi',
                  text: 'Đã xảy ra lỗi trong quá trình xóa sản phẩm.',
                });
              },
            });
          }
        });
      });

      // Load dữ liệu ban đầu
      loadData();
    });
  </script>



<jsp:include page="inc/footer.jsp" />