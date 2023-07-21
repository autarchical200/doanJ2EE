package pxu.edu.vn.order;

import java.util.Date;

public class Order {
	private int order_id;
	private int user_id;
	private Date order_date;
	private double total_amount;
	private String status;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Order(int order_id, int user_id, Date order_date, double total_amount, String status) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_date = order_date;
		this.total_amount = total_amount;
		this.status = status;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date + ", total_amount="
				+ total_amount + ", status=" + status + "]";
	}

}
