<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pxu.edu.vn.product.Product, pxu.edu.vn.product.ProductModel,pxu.edu.vn.category.Category,pxu.edu.vn.category.CategoryModel,java.util.*,com.google.gson.Gson"%>

<%
int categoryID = Integer.parseInt(request.getParameter("categoryID"));
    // Lấy categoryID từ tham số truyền vào

    // Lấy danh sách danh mục từ CategoryModel
    List<Category> categoryList = CategoryModel.getAll();
    String categoryName = "";

    // Tìm tên danh mục tương ứng với categoryID
    for (Category category : categoryList) {
        if (category.getCategory_id() == categoryID) {
            categoryName = category.getCategory_name();
            break;
        }
    }

    // Lấy danh sách sản phẩm từ model theo categoryID
    List<Product> products = ProductModel.getProductsByCategoryId(categoryID);

    // Tạo đối tượng chứa thông tin của category và danh sách sản phẩm
    Map<String, Object> dataMap = new HashMap<>();
    dataMap.put("categoryName", categoryName);
    dataMap.put("products", products);

    // Convert dữ liệu thành JSON
    Gson gson = new Gson();
    String json = gson.toJson(dataMap);

    // Trả về JSON
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);
%>
