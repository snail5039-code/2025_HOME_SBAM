<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="pageTitle" value="목록"/>   
<%@ include file="/view/usr/common/header.jsp" %>
	<div class="text-center text-3xl p-7">리스트 보기</div>
<div  class="container flex justify-center text-center ">
	<section>	
		<table class="w-200">
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
		</table>
		<div class="container text-right pt-5 text-xl">
			<a class="pl-2 pr-2 border-2 rounded-md" href="/usr/home/main">홈</a>
			<a class="pl-2 pr-2 border-2 rounded-md" href="/usr/article/write">작성</a>
			<a class="pl-2 pr-2 border-2 rounded-md" onclick="history.back()">뒤로가기</a>
		</div>
	</section>
</div>
<%@ include file="/view/usr/common/footer.jsp" %>