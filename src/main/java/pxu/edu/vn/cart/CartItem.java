package pxu.edu.vn.cart;

import pxu.edu.vn.product.Product;

public class CartItem {
	private Product pro;
	private int quantity;

	public CartItem() {
		super();
	}

	public CartItem(Product pro, int quantity) {
		super();
		this.pro = pro;
		this.quantity = quantity;
	}

	public Product getPro() {
		return pro;
	}

	public void setPro(Product pro) {
		this.pro = pro;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartBean [pro=" + pro + ", quantity=" + quantity + "]";
	}

}
