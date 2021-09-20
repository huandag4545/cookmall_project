<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/admin/order_admin(css).css?after">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/admin/adminPage(css).css?after">
</head>
<body>


	<!-- 관리자 Topbar 영역 -->
	<!-- 관리자 Topbar 영역 -->
	<c:import url="${pageContext.request.contextPath }/inc_adminTopbar.jsp"/>


		<div class="admin_list_container">
			<ul class="admin_list_area">
				<li class="admin_list_area_list"><input type="submit"
					class="list_button" name="adminPageType" value="홈페이지정보"></li>
	
				<li>
					<div>
						<a href="${pageContext.request.contextPath}/admin/adminUser">회원
							관리</a>
					</div>
				</li>
					<li>
					<div>
						<a href="${pageContext.request.contextPath}/order/orderadmin">주문내역관리</a>
					</div>
				</li>
				<li>
					<div>
						<a href="${pageContext.request.contextPath}/product/product_add">제품
							등록</a>
					</div>
				</li>
				<li>
					<div>
						<a href="${pageContext.request.contextPath}/admin/adminProduct">제품
							관리</a>
					</div>
				</li>
				<li>
					<div>
						<a href="${pageContext.request.contextPath}/admin/adminCategory">카테고리
							관리</a>
					</div>
				</li>
				<li>
					<div>
						<a
							href="${pageContext.request.contextPath}/notice/notice_board?id=${sessionScope.user_id}">공지사항
							관리</a>
					</div>
				</li>
				<li>
					<div>
						<a
							href="${pageContext.request.contextPath}/notice/notice_board?id=${sessionScope.user_id}">QnA</a>
					</div>
				</li>
			</ul>
		</div>


		<div class="order_admin_area">
			<div class="title_box">
				주문관리페이지
			</div>
			<div class="order_list_box">
				<c:if test="${empty orderlist }">
					<div>주문내역이없습니다.</div>
				</c:if>
				<c:if test="${not empty orderlist }">
					<table id="list" border="1">
						<tr class="tr_box" id ="tr_area">
							<th class="td_box">주문번호</th>
							<th class="td_box">주문일자</th>
							<th class="td_box">주문자</th>
							<th class="td_box">제품명</th>
							<th class="td_box">제품개수</th>
							<th class="td_box">주소</th>
							<th class="td_box">주문삭제</th>
							<th class="td_box">주문상태변경</th>
						</tr>
						<c:forEach var="o" items="${orderlist }" varStatus="status">
							<tr class="tr_box">
								<td class="td_box">${o.o_num }</td>
								<td class="td_box">${o.o_date }</td>
								<td class="td_box">${o.user_id }</td>
								<td class="td_box">${o.p.p_name }</td>
								<td class="td_box">${o.o_quantity }</td>
								<td class="td_box">${o.o_postcode }<br> ${o.o_addr1 }<br>
									${o.o_addr2 }
								</td>
								<td class="td_box">
									<form
										action="${pageContext.request.contextPath }/order/delOrder"
										method="post">
										<input type="hidden" value="${o.o_num }" name="o_num">
										<input type="submit" value="주문삭제">
									</form>
								</td>
								<td class="td_box"><c:if test="${o.result == 0 }">
										<form action="${pageContext.request.contextPath }/order/resultChange" method="post">
											<input type="hidden" value="${o.o_num }" name="o_num">
											<select name="result">
												<option value="0">주문요청전</option>
												<option value="1">주문확정</option>
											</select> <input type="submit" value="주문상태 변경">
										</form>
									</c:if> 
									<c:if test="${o.result == 1 }">
									주문확정
									</c:if>
								</td>
							</tr>

						</c:forEach>
					</table>
				</c:if>
			</div>


		</div>
</body>
</html>