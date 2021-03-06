package com.example.demo.cook_qna;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class QnaController {
	
	@Autowired private QnaService Qna_Service;
	
	@GetMapping(value="/qna/qna_List")
	public void qnaListForm() {
		
	}
	
	@GetMapping(value="/qna/qna_WritingForm")
	public void qnaWritingForm() {
		
	}
	
	                       
	
	//QnA등록
	@RequestMapping(value = "/qna/qna_Writing")
	
	public String addQnA(Qna q, RedirectAttributes redirect ,
			@RequestParam(value = "qna_type") int qna_type) {
		
		Qna_Service.addQna(q);
		
		redirect.addAttribute("qna_type", qna_type);
		
		return "redirect:/qna/mav_qna_list";
	}
	
	// DB에 저장된 데이터를 타입으로 구분해서 출력
	@RequestMapping(value = "/qna/mav_qna_list")
	public ModelAndView QnATypeList(@RequestParam(value = "qna_type") int qna_type) {
		
		ModelAndView mav = new ModelAndView("/qna/qna_List");
		ArrayList<Qna> QnAList = (ArrayList<Qna>) Qna_Service.getQnaType(qna_type);
		mav.addObject("QnAList", QnAList);
		
		return mav;
	}
	
	// 작성된 Content로 이동
	@RequestMapping(value = "/qna/mav_qna_content")
	public ModelAndView QnAContent(@RequestParam(value = "qna_num") int qna_num) {
		ModelAndView mav = new ModelAndView("/qna/qna_Content_View");
		
		Qna q = Qna_Service.getQnaByNum(qna_num);
		
		mav.addObject("q", q);
		
		return mav;
	}
	
	// Content에 있는 데이터를 가지고 EditForm으로 넘어간다
	@RequestMapping(value = "/qna/mav_qna_edit")
	public ModelAndView QnAEditForm(@RequestParam(value = "qna_num") int qna_num) {
		
		ModelAndView mav = new ModelAndView("/qna/qna_Edit");
		Qna q = Qna_Service.getQnaByNum(qna_num);
		
		mav.addObject("q", q);
		
		return mav;
	}
	
	// EditForm에서 수정 버튼을 클릭하면 실행되는 메소드
	@RequestMapping(value = "/qna/qna_edit")
	public String QnAContentEdit(Qna q, RedirectAttributes redirect, 
			@RequestParam(value = "qna_num") int qna_num, 
								 @RequestParam(value = "qna_type") int qna_type) {
		
		Qna_Service.updateQna(q);
		
		redirect.addAttribute("qna_num", qna_num);
		redirect.addAttribute("qna_type", qna_type);
		
		return "redirect:/qna/mav_qna_content";
	}
	

	


	
	
	// QnA Content 삭제 메소드
	@RequestMapping(value = "/qna/qna_delete")
	public String QnADelete(@RequestParam(value = "qna_num") int qna_num, @RequestParam(value = "qna_type") int qna_type, RedirectAttributes redirect) {
			
		Qna_Service.deleteQna(qna_num);
		
		redirect.addAttribute("qna_type", qna_type);
			
		return "redirect:/qna/mav_qna_list";
	}
	

	
}


