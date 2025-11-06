<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="pageTitle" value="회원가입"/>   
<%@ include file="/view/usr/common/header.jsp" %>
	<div class="text-center text-3xl p-7">회원가입</div>
	<div  class="container flex justify-center text-center">
		<section>
			<form action="/usr/member/doJoin">
				<table border="1" class="w-250">
					<tr>
						<th>아이디</th>
						<td class="p-3"><input class="w-170 border-2" type="text" name="loginId"/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td class="p-3"><input class="w-170 border-2" type="text" name="loginPw"/></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td class="p-3"><input class="w-170 border-2" type="text" name="loginPwChk"/></td>
					</tr>
					<tr>
						<th>이름</th>
						<td class="p-3"><input class="w-170 border-2" type="text" name="name"/></td>
					</tr>
					
					<tr class="border-none" >
						<th colspan="2" class="border-none">
							<button>회원가입</button>
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