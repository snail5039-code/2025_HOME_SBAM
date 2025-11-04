<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
	<div>리스트</div>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${articles }" var="article">
			<tr>
				<td>${article.getId() }</td>   
				<td><a href="/usr/article/detail?id=${article.getId() }">${article.getTitle() }</a></td>   
				<td>${article.getRegDate() }</td>   
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3">
				<button onclick="location.href='/usr/home/main'">홈</button>
				<button onclick="history.back()">뒤로가기</button>
			</td>
		</tr>
	</table>
</body>
</html>