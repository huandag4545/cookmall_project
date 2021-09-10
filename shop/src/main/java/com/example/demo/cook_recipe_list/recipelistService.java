package com.example.demo.cook_recipe_list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class recipelistService {

	@Autowired
	private recipelistMapper mapper;
		
	public void addrecipelist(recipelist r) {
		mapper.insertrecipelist(r);
	}
		
	public List selectAllrecipelist() {
		return mapper.selectAllrecipelist();
	}
		
	public recipelist selectrecipelistByNum(int rl_num) {
		return mapper.selectrecipelist(rl_num);
	}
		
	public void editrecipelist(recipelist r) {
		mapper.updaterecipelist(r);
	}
	
	public void delete(int rl_num) {
		mapper.deleterecipelist(rl_num);
	}
		
}
