<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="pageTitle" value="상세보기"/>   

<%@ include file="/view/usr/common/header.jsp" %>
	<div class="text-center text-3xl p-7">상세보기</div>
<div  class="container flex justify-center text-center ">	
	<section>
		<table class="w-200">
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
		</table>
		<div class="container text-right pt-5 text-xl">
			<a class="pl-2 pr-2 border-2 rounded-md" href="/usr/home/main">홈</a>
			<a class="pl-2 pr-2 border-2 rounded-md" href="/usr/article/write">작성</a>
			<a class="pl-2 pr-2 border-2 rounded-md" href="/usr/article/modify?id=${article.getId() }">수정</a>
			<a class="pl-2 pr-2 border-2 rounded-md" onclick="history.back()">뒤로가기</a>
			<a class="pl-2 pr-2 border-2 rounded-md" href="/usr/article/delete?id=${article.getId()}" onclick="if(confirm('정말 삭제 하겠습니까?') == false)return false">삭제</a>
		</div>
	</section>	
</div>			
<%@ include file="/view/usr/common/footer.jsp" %>
