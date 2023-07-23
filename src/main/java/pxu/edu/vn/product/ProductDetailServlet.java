package pxu.edu.vn.product;

import java.io.IOException;
import java.io.PrintWriter;
import pxu.edu.vn.product.ProductModel;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/ProductDetailServlet")
public class ProductDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy productId từ request parameter
        int productId = Integer.parseInt(request.getParameter("productId"));

        // Giả định rằng bạn đã có phương thức để lấy thông tin sản phẩm từ cơ sở dữ liệu hoặc từ nguồn dữ liệu khác
        Product product;
		try {
			product = ProductModel.getProductById(String.valueOf(productId));
			 Gson gson = new Gson();
		        String json = gson.toJson(product);
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write(json);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Chuyển thông tin sản phẩm thành JSON và trả về cho client
   

    }
}