package pxu.edu.vn.cart;

import pxu.edu.vn.product.Product;
import pxu.edu.vn.product.ProductModel;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            Product product = ProductModel.getProductById(String.valueOf(productId));

            HttpSession session = request.getSession();
            Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

            if (cart == null) {
                cart = new HashMap<>();
            }

            if (product != null) {
                // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
                if (cart.containsKey(productId)) {
                    // Nếu đã tồn tại thì tăng số lượng sản phẩm lên 1
                    CartItem cartItem = cart.get(productId);
                    cartItem.setQuantity(cartItem.getQuantity() + 1);
                } else {
                    // Nếu chưa tồn tại thì thêm mới sản phẩm vào giỏ hàng
                    CartItem cartItem = new CartItem(product, 1);
                    cart.put(productId, cartItem);
                }

                session.setAttribute("cart", cart);

                // Gửi phản hồi về thành công cho Ajax
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"success\": true}");
            } else {
                // Gửi phản hồi về lỗi cho Ajax
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"success\": false}");
            }
        } catch (Exception e) {
            // Xử lý lỗi nếu có
            e.printStackTrace();
            // Gửi phản hồi về lỗi cho Ajax
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": false}");
        }
    }
}
