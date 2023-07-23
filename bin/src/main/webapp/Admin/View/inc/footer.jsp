
<footer class="main-footer">
	<div class="float-right d-none d-sm-block">
		<b>Version</b> 3.2.0
	</div>
	<strong>Copyright &copy; 2014-2021 <a
		href="https://adminlte.io">AdminLTE.io</a>.
	</strong> All rights reserved.
</footer>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
	<!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<!-- Bootstrap 4 -->
<!-- Thư viện jQuery (đã khai báo trong mã của bạn) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Thư viện SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.min.js"></script>

<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script
	src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
	src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script
	src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script
	src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="../../plugins/summernote/summernote-bs4.min.js"></script>

<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<!-- Page specific script -->
<script>
	$(function() {
		$("#example1").DataTable({
			responsive : true,
			lengthChange : false,
			autoWidth : false,
			buttons : [ "copy", "csv", "excel", "pdf", "print", "colvis" ],
		}).buttons().container().appendTo("#example1_wrapper .col-md-6:eq(0)");
		$("#example2").DataTable({
			paging : true,
			lengthChange : false,
			searching : false,
			ordering : true,
			info : true,
			autoWidth : false,
			responsive : true,
		});
	});
</script>

</body>
</html>