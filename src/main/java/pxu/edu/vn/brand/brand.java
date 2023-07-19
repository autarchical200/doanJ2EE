package pxu.edu.vn.brand;

import java.util.Date;

public class brand {
	private int brand_id;
	private String brand_name;
	private String brand_country;
	private Date brand_nsx;

	public brand() {
		super();
		// TODO Auto-generated constructor stub
	}

	public brand(int brand_id, String brand_name, String brand_country, Date brand_nsx) {
		super();
		this.brand_id = brand_id;
		this.brand_name = brand_name;
		this.brand_country = brand_country;
		this.brand_nsx = brand_nsx;
	}

	public int getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public String getBrand_country() {
		return brand_country;
	}

	public void setBrand_country(String brand_country) {
		this.brand_country = brand_country;
	}

	public Date getBrand_nsx() {
		return brand_nsx;
	}

	public void setBrand_nsx(Date brand_nsx) {
		this.brand_nsx = brand_nsx;
	}

	@Override
	public String toString() {
		return "Brand_Model [brand_id=" + brand_id + ", brand_name=" + brand_name + ", brand_country=" + brand_country
				+ ", brand_nsx=" + brand_nsx + "]";
	}

}
