package com.example.demo.cook_qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {
	
	@Autowired
	private QnaMapper mapper;
	
	public void addQna(Qna q) {
		mapper.insertQnA(q);
	}
	
	public void updateQna(Qna q) {
		mapper.editQnA(q);
	}
	
	public void deleteQna(int qna_num) {
		mapper.deleteQnA(qna_num);
	}
	
	public List getQnaType(int qna_type) {
		return mapper.selectQnAType(qna_type);
	}
	
	public List getAllQna() {
		return mapper.selectAllQnA();
	}

	public Qna getQnaByNum(int qna_num) {
		return mapper.selectQnAByNum(qna_num);
	}
}
