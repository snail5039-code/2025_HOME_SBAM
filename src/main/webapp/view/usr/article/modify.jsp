<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="수정" />
<%@ include file="/view/usr/common/header.jsp"%>


<div>작성</div>
<form action="/usr/article/doModify" onsubmit="return submitForm(this);">
	<input type="hidden" name="id" value="${article.getId() }" />
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
			<td><input type="text" name="title"
				value="${article.getTitle() }" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" id="" cols="30" rows="10">${article.getContent() }</textarea></td>
		</tr>
		<tr>
			<td colspan="3">
				<button>수정</button>
				<button type="reset" onclick="alert('다시쓰기를 클릭 했습니다.')">다시쓰기</button>
				<button type="button" onclick="location.href='/usr/home/main'">홈</button>
			</td>
		</tr>
	</table>
</form>
<%@ include file="/view/usr/common/footer.jsp"%>
