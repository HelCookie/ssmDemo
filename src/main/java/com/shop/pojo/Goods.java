package com.shop.pojo;

public class Goods {
    private Integer gid;

    private String gname;

    private String des;

    private Integer price;

    private Integer stock;

    private String img;

  
  
    public Integer getGid() {
		return gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", gname=" + gname + ", des=" + des + ", price=" + price + ", stock=" + stock
				+ ", img=" + img + "]";
	}


    
    
}