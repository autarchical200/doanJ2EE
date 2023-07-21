package pxu.edu.vn.product;

import java.util.Arrays;

public class Product {
	private int product_id;
	private String product_name;
	private int category_id;
	private int brand_id;
	private double price;
	private double discounted_price;
	private String product_image;
	private String product_info;
	private String brand_name; // Thêm trường brand_name vào lớp Product
	private String category_name; // Thêm trường brand_name vào lớp Product

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Product(int product_id, String product_name, int category_id, int brand_id, double price,
			double discounted_price, String product_image, String product_info) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.category_id = category_id;
		this.brand_id = brand_id;
		this.price = price;
		this.discounted_price = discounted_price;
		this.product_image = product_image;
		this.product_info = product_info;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public int getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getDiscounted_price() {
		return discounted_price;
	}

	public void setDiscounted_price(double discounted_price) {
		this.discounted_price = discounted_price;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", product_name=" + product_name + ", category_id=" + category_id
				+ ", brand_id=" + brand_id + ", price=" + price + ", discounted_price=" + discounted_price
				+ ", product_image=" + product_image + ", product_info=" + product_info + "]";
	}

}
