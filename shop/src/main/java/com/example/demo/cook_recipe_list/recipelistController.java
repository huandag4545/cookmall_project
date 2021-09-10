package com.example.demo.cook_recipe_list;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class recipelistController {

	@Autowired
	private recipelistService recipelistService;
	
	//레시피 폼으로 이동 (정보를 받는 곳)
	@GetMapping(value="/recipelist/recipelist_writing")
	public void recipelistForm() {
	}
	
	//레시피 작성
	@RequestMapping(value="/recipelist/recipelist_writing")
	public String insert(recipelist r) {
		recipelistService.addrecipelist(r);
		return "redirect:/recipelist/recipelist_board";
	}
	
	//컨텐츠로 이동
	@RequestMapping(value="recipelist/recipelist_contentView")//이름 수정 recipelist_contentView
	public ModelAndView content(@RequestParam(value="rl_num")int rl_num) {
		ModelAndView mav=new ModelAndView("/recipelist/recipelist_contentView");
		recipelist r=recipelistService.selectrecipelistByNum(rl_num);
		mav.addObject("r",r);
		return mav;
	}
	
	//레시피 전체 출력
	@RequestMapping(value="/recipelist/recipelist_board")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView("/recipelist/recipelist_board");
		ArrayList<recipelist> list=(ArrayList<recipelist>)recipelistService.selectAllrecipelist();
		mav.addObject("list",list);
		return mav;
	}
	
	//레시피 수정
	@RequestMapping(value="/recipelist/recipelist_edit")
	public String edit(recipelist r) {
		recipelistService.editrecipelist(r);
		return "redirect:/recipelist/recipelist_board";
	}
	
	//레시피 삭제
	@RequestMapping(value="/recipelist/recipelist_delete")
	public String delete(@RequestParam(value="rl_num")int rl_num) {
		recipelistService.delete(rl_num);
		return "redirect:/recipelist/recipelist_board";
	}
	
}
