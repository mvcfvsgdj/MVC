package goods;

public class Goods {
	
	String goodsCode;
	String goodsBrand;
	String goodsName;
	int goodsPrice;
	int goodsStock;
	
	public Goods() {
		// TODO Auto-generated constructor stub
	}

	public Goods(String goodsCode, String goodsBrand, String goodsName, int goodsPrice, int goodsStock) {
		super();
		this.goodsCode = goodsCode;
		this.goodsBrand = goodsBrand;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsStock = goodsStock;
	}

	public String getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}

	public String getGoodsBrand() {
		return goodsBrand;
	}

	public void setGoodsBrand(String goodsBrand) {
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

	@Override
	public String toString() {
		return "goods [goodsCode=" + goodsCode + ", goodsBrand=" + goodsBrand + ", goodsName=" + goodsName
				+ ", goodsPrice=" + goodsPrice + ", goodsStock=" + goodsStock + "]";
	}
	
	
}
