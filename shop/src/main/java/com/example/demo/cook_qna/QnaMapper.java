package com.example.demo.cook_qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaMapper {

	void insertQnA(Qna q);
	
	void editQnA(Qna q);
	
	void deleteQnA(int qna_num);
	
	// QnA 전체 선택
	List selectAllQnA();
	
	// QnA 타입으로 선택
	List selectQnAType(int qna_type);
	
	// QnA 시퀀스 번호로 선택
	Qna selectQnAByNum(int qna_num);
}
