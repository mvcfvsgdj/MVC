package Seller;

public class Goods {
	
	int num;
	String goodsCode;
	int goodsBrand;
	String goodsName;
	int goodsPrice;
	int goodsStock;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}
	public int getGoodsBrand() {
		return goodsBrand;
	}
	public void setGoodsBrand(int goodsBrand) {
		this.goodsBrand = goodsBrand;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsStock() {
		return goodsStock;
	}
	public void setGoodsStock(int goodsStock) {
		this.goodsStock = goodsStock;
	}
	//
	
	@Override
	public String toString() {
		return "member [num=" + num + ", goodsCode=" + goodsCode + ", goodsBrand=" + goodsBrand + ", goodsName=" + goodsName
				+ ", goodsPrice=" + goodsPrice + ", goodsStock=" + goodsStock + "]";
	}
	public Goods(int num, String goodsCode, int goodsBrand, String goodsName, int goodsPrice, int goodsStock) {
		super();
		this.num = num;
		this.goodsCode = goodsCode;
		this.goodsBrand = goodsBrand;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsStock = goodsStock;
	}
	public Goods(String goodsCode, int goodsBrand, String goodsName, int goodsPrice, int goodsStock) {
		super();
		this.goodsCode = goodsCode;
		this.goodsBrand = goodsBrand;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsStock = goodsStock;
	}
	public Goods(int goodsBrand, String goodsName, int goodsPrice, int goodsStock, String goodsCode) {
		super();
		this.goodsBrand = goodsBrand;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsStock = goodsStock;
		this.goodsCode = goodsCode;
	}
	public Goods() {}
	
	 
}
