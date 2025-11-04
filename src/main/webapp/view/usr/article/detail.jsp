<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<div>상세보기</div>
		<table border="1">
			<tr>
				<th>번호</th>
				<td>${article.getId() }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${article.getRegDate() }</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>${article.getUpdateDate() }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${article.getTitle() }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${article.getContent() }</td>
			</tr>
			<tr>
				<td colspan="3">
					<button onclick="location.href='/usr/home/main'">홈</button>
					<button onclick="location.href='/usr/article/modify?id=${article.getId()}'">수정</button>
					<button onclick="history.back()">뒤로가기</button>
				</td>
			</tr>
		</table>
</body>
</html>