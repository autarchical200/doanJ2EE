<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="pxu.edu.vn.brand.brandModel, java.util.*, com.google.gson.Gson, pxu.edu.vn.brand.brand"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
// Lấy danh sách hãng sản phẩm từ model
List<brand> brands = brandModel.getAll();

// Convert danh sách hãng sản phẩm thành JSON
Gson gson = new Gson();
String json = gson.toJson(brands);

// Trả về JSON
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
response.getWriter().write(json);
%>

<%-- Thêm chức năng thêm hãng sản phẩm --%>
<%
if (request.getParameter("action") != null) {
	String action = request.getParameter("action");
	if (action.equals("add")) {
		String brandName = request.getParameter("brandName");
		String brandCountry = request.getParameter("brandCountry");
		String brandNsxStr = request.getParameter("brandNsx");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date brandNsx = null;
		try {
	brandNsx = sdf.parse(brandNsxStr);
		} catch (Exception e) {
	e.printStackTrace();
		}

		brand newBrand = new brand();
		newBrand.setBrand_name(brandName);
		newBrand.setBrand_country(brandCountry);
		newBrand.setBrand_nsx(brandNsx);

		// Thêm hãng sản phẩm
		brandModel.insertBrand(newBrand);

		// Chuyển hướng người dùng quay lại trang brand_view.jsp
		response.sendRedirect("../View/Brand_View.jsp");
	} else if (action.equals("edit")) {
		int brandId = Integer.parseInt(request.getParameter("brandId"));
		String brandName = request.getParameter("brandName");
		String brandCountry = request.getParameter("brandCountry");
		String brandNsxStr = request.getParameter("brandNsx");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date brandNsx = null;
		try {
	brandNsx = sdf.parse(brandNsxStr);
		} catch (Exception e) {
	e.printStackTrace();
		}

		brand editBrand = brandModel.getBrandById(String.valueOf(brandId));
		editBrand.setBrand_name(brandName);
		editBrand.setBrand_country(brandCountry);
		editBrand.setBrand_nsx(brandNsx);

		brandModel.updateBrand(editBrand);
		response.sendRedirect("../View/Brand_View.jsp");

	} else if (action.equals("delete")) {
		String[] brandIds = request.getParameterValues("brandIds");
		if (brandIds != null && brandIds.length > 0) {
	for (String brandId : brandIds) {
		int id = Integer.parseInt(brandId);
		brandModel.deleteBrand(id);
	}
		}
		response.sendRedirect("../View/Brand_View.jsp");
	}
}
%>
