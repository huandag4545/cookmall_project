package com.example.demo.cook_product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

	@Autowired
	private ProductMapper mapper;
	
	public void addProduct(Product p) {
		mapper.insert(p);
	}

	public Product selectByNum(int p_num) {
		return mapper.selectByNum(p_num);
	}
	
	public List AllList() {
		return mapper.selectAll();
	}
	
	public List SearchList(String p_name) {
		return mapper.selectByName(p_name);
	}
	
	public List PriceList(int min,int max) {
		Map map = new HashMap();
		map.put("min", min);
		map.put("max", max);
		return mapper.selectByPrice(map);
	}
	
	public List Cate1List(int ca1_num) {
		return mapper.selectByC1(ca1_num);
	}

	public List InfoList(String p_info) {
		return mapper.selectByInfo(p_info);
	}
	void update(Product p) {
		mapper.update(p);
	}
	
	void delete(int p_num) {
		mapper.delete(p_num);
	}
	
	int getNum() {
		return mapper.getNum();
	}
}
