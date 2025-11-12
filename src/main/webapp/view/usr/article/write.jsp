<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="작성"/>   
<%@ include file="/view/usr/common/header.jsp" %>
	<div class="text-center text-3xl p-7">작성하기</div>
	<div  class="container flex justify-center text-center">
		<section>
			<form action="/usr/article/doWrite" onsubmit="return submitForm(this);">
				<table border="1" class="w-200">
					<tr>
						<th>제목</th>
						<td class="p-3"><input class="w-170 border-2" type="text" name="title" placeholder="여기에 제목을 작성하세요"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="p-3"><textarea class="w-170 border-2" name="content" placeholder="여기에 제목을 작성하세요" ></textarea></td>
					</tr>
					<tr class="border-none" >
						<th colspan="2" class="border-none">
							<button>작성</button>
						</th>
					</tr>
				</table>
			</form>
			<div class="container text-right pt-5 text-xl">
				<a class="pl-2 pr-2 border-2 rounded-md" href="/usr/home/main">홈</a>
				<a class="pl-2 pr-2 border-2 rounded-md" onclick="history.back()">뒤로가기</a>
			</div>
		</section>
	</div>	
<%@ include file="/view/usr/common/footer.jsp" %>