<%@page import="pxu.edu.vn.category.categoryModel"%>
<%@page import="pxu.edu.vn.category.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*"%>
<%@ page
	import="pxu.edu.vn.brand.brandModel,pxu.edu.vn.product.ProductModel,java.util.*,com.google.gson.Gson, pxu.edu.vn.product.Product,pxu.edu.vn.brand.brand"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
// Lấy danh sách sản phẩm từ model
List<Product> products = ProductModel.getAll();

// Lấy danh sách hãng sản phẩm từ model (để lấy thông tin tên hãng)
List<brand> brands = brandModel.getAll();
Map<Integer, String> brandMap = new HashMap<>(); // Sử dụng Map để ánh xạ brand_id với tên hãng

// Tạo brandMap từ danh sách hãng
for (brand b : brands) {
	brandMap.put(b.getBrand_id(), b.getBrand_name());
}

// Gán tên hãng vào từng sản phẩm
for (Product p : products) {
	int brandId = p.getBrand_id();
	String brandName = brandMap.get(brandId);
	p.setBrand_name(brandName);
}

// Lấy danh sách danh mục sản phẩm từ model (để lấy thông tin tên danh mục)
List<Category> categories = categoryModel.getAll();
Map<Integer, String> categoryMap = new HashMap<>(); // Sử dụng Map để ánh xạ category_id với tên danh mục

// Tạo categoryMap từ danh sách danh mục
for (Category c : categories) {
	categoryMap.put(c.getCategory_id(), c.getCategory_name());
}

// Gán tên danh mục vào từng sản phẩm
for (Product p : products) {
	int categoryId = p.getCategory_id();
	String categoryName = categoryMap.get(categoryId);
	p.setCategory_name(categoryName);
}

// Convert danh sách sản phẩm thành JSON
Gson gson = new Gson();
String json = gson.toJson(products);

// Trả về JSON
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
response.getWriter().write(json);

if (request.getParameter("action") != null) {
	String action = request.getParameter("action");
	if (action.equals("edit")) {
		// Lấy đối tượng sản phẩm từ cơ sở dữ liệu bằng ID
		String id = request.getParameter("id");
		Product existingProduct = ProductModel.getProductById(id);
		// Kiểm tra xem người dùng đã tải lên ảnh mới hay chưa
		String imagePart = request.getParameter("image");

		String imagePath;
		if (imagePart != null && !imagePart.isEmpty()) {
	// Nếu có tải lên ảnh mới, lưu ảnh vào thư mục tùy chỉnh và cập nhật đường dẫn ảnh mới
	imagePath = "../../public/img/products/" + imagePart;
	// Code để lưu ảnh vào thư mục tùy chỉnh ở đây (sử dụng FileOutputStream và inputStream của Part)
		} else {
	// Nếu không có ảnh mới, giữ nguyên đường dẫn ảnh ban đầu từ đối tượng sản phẩm hiện tại
	imagePath = existingProduct.getProduct_image();
		}

		// Lấy các thông tin khác từ form
		int idd = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int categoryId = Integer.parseInt(request.getParameter("category"));
		int brandId = Integer.parseInt(request.getParameter("brand"));
		double price = Double.parseDouble(request.getParameter("price"));
		double discountedPrice = Double.parseDouble(request.getParameter("discounted"));
		String info = request.getParameter("info");

		// Tạo đối tượng sản phẩm và cập nhật vào cơ sở dữ liệu
		Product product = new Product(idd, name, categoryId, brandId, price, discountedPrice, imagePath, info);
		ProductModel productService = new ProductModel();
		productService.updateProduct(product);

		// Chuyển hướng về trang hiển thị danh sách sản phẩm sau khi cập nhật thành công
		response.sendRedirect("../View/Product_View.jsp");

	} else if (action.equals("add")) {
		String name = request.getParameter("name");
		int categoryId = Integer.parseInt(request.getParameter("category"));
		int brandId = Integer.parseInt(request.getParameter("brand"));
		double price = Double.parseDouble(request.getParameter("price"));
		double discountedPrice = Double.parseDouble(request.getParameter("discounted"));
		String imagePart = request.getParameter("image");
		String info = request.getParameter("info");

		// Lưu hình ảnh vào thư mục tùy chỉnh, ví dụ: /path/to/your/images
		String imagePath = "../../public/img/products/" + imagePart;
		// Tạo đối tượng sản phẩm và lưu vào cơ sở dữ liệu

		Product newProduct = new Product();
		newProduct.setProduct_name(name);
		newProduct.setCategory_id(categoryId);
		newProduct.setBrand_id(brandId);
		newProduct.setPrice(price);
		newProduct.setDiscounted_price(discountedPrice);
		newProduct.setProduct_image(imagePath);
		newProduct.setProduct_info(info);

		// Thêm sản phẩm
		ProductModel.insertProduct(newProduct);

		// Chuyển hướng về trang hiển thị danh sách sản phẩm sau khi thêm thành công
		response.sendRedirect("../View/Product_View.jsp");
	} else if (action.equals("delete")) {
		String[] productIds = request.getParameterValues("productIds");
		if (productIds != null && productIds.length > 0) {
	for (String productId : productIds) {
		int id = Integer.parseInt(productId);
		ProductModel.deleteProduct(id);
		response.sendRedirect("../View/Product_View.jsp");

	}
		}
	}
}
%>
