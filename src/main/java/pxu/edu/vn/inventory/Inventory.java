package pxu.edu.vn.inventory;

import java.sql.Date;

public class Inventory {
	private int inventory_id;
	private int product_id;
	private Date date_add;
	private int quantity;

	public Inventory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Inventory(int inventory_id, int product_id, Date date_add, int quantity) {
		super();
		this.inventory_id = inventory_id;
		this.product_id = product_id;
		this.date_add = date_add;
		this.quantity = quantity;
	}

	public int getInventory_id() {
		return inventory_id;
	}

	public void setInventory_id(int inventory_id) {
		this.inventory_id = inventory_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public Date getDate_add() {
		return date_add;
	}

	public void setDate_add(Date date_add) {
		this.date_add = date_add;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Inventory [inventory_id=" + inventory_id + ", product_id=" + product_id + ", date_add=" + date_add
				+ ", quantity=" + quantity + "]";
	}

}
