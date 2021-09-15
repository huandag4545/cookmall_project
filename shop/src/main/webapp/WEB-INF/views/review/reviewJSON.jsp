<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
[
<c:forEach var="r" items="${reps }" varStatus="status">
	<c:if test="${not status.first }">
		,
	</c:if>
	{"review_num":${r.review_num}, "writer_id":"${r.writer_id }", "review_content":"${r.review_content }", "review_score":${r.review_score },"review_date":${r.review_date }}
</c:forEach>
]