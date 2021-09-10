<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
[
	<c:forEach var="i" items="${allProdList }" varStatus="status">
		<c:if test="${not status.first }">
			,
		</c:if>
		{"p_num":${i.p_num }, "p_name":"${i.p_name }", "p_price":"${i.p_price }", "p_info":"${i.p_info }"}
	</c:forEach>
]