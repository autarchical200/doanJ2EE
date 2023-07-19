<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="pxu.edu.vn.product.Product" %>
<%@ page import="pxu.edu.vn.dao.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<title>Product Management</title>
<!-- Include CSS and JS libraries -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- Include your custom CSS here if needed -->
</head>
<body>
	<h1>Product Management</h1>

	<!-- DataTable to display the list of products -->
	<table id="ProductTable" class="display">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Category ID</th>
				<th>Brand ID</th>
				<th>Price</th>
				<th>Discounted Price</th>
				<th>Product Image</th>
				<th>Product Info</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

	<script type="text/javascript" src="script.js"></script>
</body>
</html>
