<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function delConfirm(key){
	var result = confirm("정말로 삭제할까요?");
	if(result){
	    location.href="http://13.209.93.8:8081/Project_semi/hhDeleteController?key=" + String(key)
	}else{
	    alert("취소 되었습니다.");
	}
}

function moveback(){
	location.href="${pageContext.request.contextPath }/hhSelectMonthController"
}
</script>
</head>
<body>
	<c:import url="/view/Menu.jsp" />
	
	<h3 align="center">${year}년 ${month}월 가계부 목록</h3>
	
	<c:import url="/household/householdWrite.jsp" /> <!-- 가계부 작성 폼 -->
	
	
	<br>
	<table border="1">
		<tr>
			<th>날짜</th><th>카테고리</th><th>내용</th><th>종류</th><th>금액</th><th>삭제</th>
		</tr>
		<c:forEach var="h" items="${h }">
			<c:if test="${h.type ne 3 }">
			<tr>
				<td>${h.getDate() }</td>
				<td>${h.getCategory() }</td>
				<td>${h.getContent() }</td>
				<td>
					<c:if test="${h.getType() eq 1 }"> <!-- 수입 -->
						수입
					</c:if>
					<c:if test="${h.getType() eq 0 }"> <!-- 지출 -->
						지출
					</c:if>
					<c:if test="${h.getType() eq 3 }"> <!-- 예시 -->						
					</c:if>
				</td>
				<td>${h.getPrice() }</td>
				<td>
					<a href="javascript:delConfirm(${h.getKey()})">삭제</a>
				</td>
			</tr>
			</c:if>
		</c:forEach>
	
	</table>
	<br>
	<table style="margin-left: auto;margin-right: auto;">
		<tr>
			<td>
				<input type="button" value="월 목록 이동" onclick="javscript:moveback()" >
			</td>
		</tr>
	</table>	
</body>
</html>