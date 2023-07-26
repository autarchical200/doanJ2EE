package pxu.edu.vn.cart;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateCartItemServlet")
public class UpdateCartItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the product ID and updated quantity from the request
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Get the cart from the session
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cartMap = (Map<Integer, CartItem>) session.getAttribute("cart");

        // Check if the cart exists and the product is in the cart
        if (cartMap != null && cartMap.containsKey(productId)) {
            // Update the quantity of the product in the cart
            CartItem cartItem = cartMap.get(productId);
            cartItem.setQuantity(quantity);
            // Update the cart in the session
            session.setAttribute("cart", cartMap);
        }

        // Redirect the user back to the cart page
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}
