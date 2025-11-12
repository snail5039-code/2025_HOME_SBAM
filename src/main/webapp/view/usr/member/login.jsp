<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<script>
	const loginFormSubmit = function (form) {
		form.loginId.value = form.loginId.value.trim(); 
		form.loginPw.value = form.loginPw.value.trim(); 
		
		if(form.loginId.value.length == 0){
			alert('아이디는 필수 입력 정보 입니다.');
			form.loginId.focus();
			return;
		}
		if(form.loginPw.value.length == 0){
			alert('비밀번호는 필수 입력 정보 입니다.');
			form.loginId.focus();
			return;
		}
		
		let validLoginInfoMsg = $('#validLoginInfoMsg');
		
		$.ajax({
			url : '/usr/member/validLoginInfo',
			type : 'get',
			data : {
				loginId : form.loginId.value,
				loginPw : form.loginPw.value	
			},
			dataType : 'json',
			success : function(data) {
				if(data.fail) {
					validLoginInfoMsg.addClass('text-red-500');
					validLoginInfoMsg.html(`\${data.rsMsg}`);
				} else {
					validLoginInfoMsg.removeClass('text-red-500');
					validLoginInfoMsg.empty();
					
					$(form).append(`<input type='hidden'  name='loginedMemberId' value='\${data.rsData}'/>`);
					form.submit();
				}
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})
		
	}
</script>


<c:set var="pageTitle" value="로그인"/>   
<%@ include file="/view/usr/common/header.jsp" %>
	<div class="text-center text-3xl p-7">로그인</div>
	<div  class="container flex justify-center text-center">
		<section>
			<form action="/usr/member/doLogin" onsubmit="loginFormSubmit(this); return false;">
				<table border="1" class="w-250">
					<tr>
						<th>아이디</th>
						<td class="p-3">
							<input class="w-170 border-2" type="text" name="loginId"/>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td class="p-3"><input class="w-170 border-2" type="text" name="loginPw"/></td>
					</tr>
					<tr class="border-none" >
						<th colspan="2" class="border-none">
							<div id="validLoginInfoMsg" class="mb-2 text-sm h-5"></div>
							<button class="submitBtn">로그인</button>
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