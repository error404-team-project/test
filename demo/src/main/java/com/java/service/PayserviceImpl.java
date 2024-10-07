package com.java.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.dto.Cart;
import com.java.dto.Porder;
import com.java.mapper.PayMapper;

@Service
public class PayserviceImpl implements PayService{
	@Autowired PayMapper pmapper;

	@Override
	public void orderInsert(Porder order) {
	//System.out.println(order.getOrder_date());
	//System.out.println(order.getCarry_zip());
	//System.out.println(order.getOrder_status());
	//System.out.println(order.getOrder_no());
	//System.out.println(order.getP_num());
//	System.out.println(order.getUser_seq());
	
		pmapper.orderInsert(order);
		pmapper.deletecart(order);
	
		
	}

	    @Override
	    @Transactional // 트랜잭션 관리
	    public void updateState(List<Long> p_nums) throws Exception {
	        for (Long p_num : p_nums) {
	            // 상품의 상태를 '1'로 업데이트
	            int updatedCount = pmapper.updateStateByPNum(p_num, "1");
	            if (updatedCount == 0) {
	                throw new Exception("상품 ID " + p_num + "을(를) 찾을 수 없습니다."); // 해당 상품이 없는 경우 예외 발생
	            }
	        }
	    }

		@Override
		public ArrayList<Cart> cartview(int user_seq) {
			ArrayList<Cart> cartlist = pmapper.cartview(user_seq);
			return cartlist;
		}

		@Override  // 결제 중 취소 했을때 state 1 이였던 상품들 0으로 되돌리는 기능 
		public void state_return() {
			pmapper.state_return();
		}
	





	

}
