<%@ page import="pxu.edu.vn.cart.CartItem"%>
<%@ page import="pxu.edu.vn.product.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.gson.Gson"%>

<%
// Xử lý logic giỏ hàng tại đây
Map<Integer, CartItem> cartMap = (Map<Integer, CartItem>) session.getAttribute("cart");
int totalAmount = 0;
List<Map<String, Object>> cartItemList = new ArrayList<>();

 session.setAttribute("totalAmount", totalAmount); 

if (cartMap != null) {
	int stt = 0;
	for (CartItem cartItem : cartMap.values()) {
		stt++;
		Product product = cartItem.getPro();
		int quantity = cartItem.getQuantity();
		long totalPrice = product.getDiscounted_price() > 0 ? product.getDiscounted_price() * quantity
		: product.getPrice() * quantity;
		totalAmount += totalPrice;

		// Tạo một map chứa thông tin sản phẩm trong giỏ hàng
		Map<String, Object> cartItemInfo = new HashMap<>();
		cartItemInfo.put("stt", stt);
		cartItemInfo.put("productName", product.getProduct_name());
		cartItemInfo.put("price",
		product.getDiscounted_price() > 0 ? product.getDiscounted_price() : product.getPrice());
		cartItemInfo.put("quantity", quantity);
		cartItemInfo.put("totalPrice", totalPrice);

		cartItemList.add(cartItemInfo);
	}
}

// Convert cartItemList to JSON format
Gson gson = new Gson();
String jsonCartItemList = gson.toJson(cartItemList);

// Write JSON data to response
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
response.getWriter().write("{\"cartItemList\":" + jsonCartItemList + ",\"totalAmount\":" + totalAmount + "}");
%>
