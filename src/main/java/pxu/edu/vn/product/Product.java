package pxu.edu.vn.product;

public class Product {
	private int productID;
	private String productName;
	private int categoryID;
	private int brandID;
	private double price;
	private double discountedPrice;
	private String productImg;
	private String productInfo;

	public Product() {
		super();
	}

	public Product(int productID, String productName, int categoryID, int brandID, double price, double discountedPrice,
			String productImg, String productInfo) {
		super();
		this.productID = productID;
		this.productName = productName;
		this.categoryID = categoryID;
		this.brandID = brandID;
		this.price = price;
		this.discountedPrice = discountedPrice;
		this.productImg = productImg;
		this.productInfo = productInfo;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public int getBrandID() {
		return brandID;
	}

	public void setBrandID(int brandID) {
		this.brandID = brandID;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getDiscountedPrice() {
		return discountedPrice;
	}

	public void setDiscountedPrice(double discountedPrice) {
		this.discountedPrice = discountedPrice;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	@Override
	public String toString() {
		return "Product [productID=" + productID + ", productName=" + productName + ", categoryID=" + categoryID
				+ ", brandID=" + brandID + ", price=" + price + ", discountedPrice=" + discountedPrice + ", productImg="
				+ productImg + ", productInfo=" + productInfo + "]";
	}

}
