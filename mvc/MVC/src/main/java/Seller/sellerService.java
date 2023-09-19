package Seller;

import java.util.ArrayList;

public class sellerService {
	
	goodsDAO dao = new goodsDAO();
	
	// 전체 조회
	public ArrayList<Goods> selectAll(){
		return dao.selectAll();
	}
	
	// 추가(등록)
	public void RegisterGoods(Goods g) {
		dao.RegisterGoods(g);
	}
	
	// 수정
	public void alterGoods(Goods g) {
		dao.aleterGoods(g);
	}
	
	// 삭제
	public void deleteGoods (String goodsCode) {
		dao.deleteOne(goodsCode);
	}
	
	public int getTotalCnt() {
		return dao.getTotalCnt();
	}
	
	// 페이징을 겸한 전체 조회
	public  ArrayList<Goods> getListPage(int page, int pageSize){
		return dao.getListPage(page, pageSize);
	}
	
	public static void main(String[] args) {
		sellerService s = new sellerService();
		ArrayList<Goods> result = s.selectAll();
		for (Goods goods : result) {
		    System.out.println(goods);
		}
	}

}
