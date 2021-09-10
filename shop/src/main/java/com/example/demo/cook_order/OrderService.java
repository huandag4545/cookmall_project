package com.example.demo.cook_order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class OrderService {
	
	@Autowired
	private OrderMapper mapper;
	
	void orderAdd(Order o) {
		mapper.insertOrder(o);
	}
	Order OrderDetail(int o_num) {
		return mapper.selectOrder(o_num);
	} //�ֹ�������

	List orderList(String user_id) {
		return mapper.selectAllOrder(user_id);
	} //�ֹ�����Ʈ 

	void orderSucess(Order o) {
		mapper.updateOrder(o);
	} // �ֹ���������

	void orderDel(int o_num) {
		mapper.deleteOrder(o_num);;
	}
	
	List selectAdmin() {
		return mapper.selectAdmin();
	}
}
