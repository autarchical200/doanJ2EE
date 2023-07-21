package pxu.edu.vn.order_detail;

public class Order_Detail {
	private int order_detail_id;
	private int order_id;
	private int product_id;
	private int quantity;
	private double price;

	public Order_Detail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order_Detail(int order_detail_id, int order_id, int product_id, int quantity, double price) {
		super();
		this.order_detail_id = order_detail_id;
		this.order_id = order_id;
		this.product_id = product_id;
		this.quantity = quantity;
		this.price = price;
	}

	public int getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Order_Detail [order_detail_id=" + order_detail_id + ", order_id=" + order_id + ", product_id="
				+ product_id + ", quantity=" + quantity + ", price=" + price + "]";
	}

}
