package pxu.edu.vn.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/ProductSearchServlet")
public class ProductSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy giá trị product_name từ tham số trong URL
        String productName = request.getParameter("productName");

        // Giả định rằng bạn đã có phương thức để tìm kiếm sản phẩm từ cơ sở dữ liệu hoặc từ nguồn dữ liệu khác dựa vào productName
        List<Product> productList;
        try {
            productList = ProductModel.getProductsByName(productName);
            // Chuyển danh sách sản phẩm thành JSON và trả về cho client
            Gson gson = new Gson();
            String json = gson.toJson(productList);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}