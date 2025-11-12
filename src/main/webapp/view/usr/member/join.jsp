<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	let validLoginId = null;
	
	const joinFormSubmit = function (form) {
		form.loginId.value = form.loginId.value.trim(); 
		form.loginPw.value = form.loginPw.value.trim(); 
		form.loginPwChk.value = form.loginPwChk.value.trim(); 
		form.name.value = form.name.value.trim(); 
		
		if(form.loginId.value.length == 0){
			alert('아이디는 필수 입력 정보 입니다.');
			form.loginId.focus();
			return false;
		}
		if(form.loginId.value != validLoginId){
			alert('[' +  form.loginId.value + ']는 사용할 수 없는 아이디 입니다.');
			form.loginId.value = '';
			form.loginId.focus();
			return false;
		}
		if(form.loginPw.value.length == 0){
			alert('비밀번호는 필수 입력 정보 입니다.');
			form.loginId.focus();
			return false;
		}
		if(form.loginPw.value != form.loginPwChk.value){
			alert('비밀번호가 일치하지 않습니다.');
			form.loginPw.value = '';
			form.loginPwChk.value = '';
			form.loginPw.focus();
			return false;
		}
		if(form.name.value.length == 0){
			alert('이름은 필수 입력 정보 입니다.');
			form.loginId.focus();
			return false;
		}
		return true;
	}

	const loginIdDupChk = function(el) {
		el.value = el.value.trim();
		
			let chkMsg = $('#chkMsg')
		if(el.value.length == 0){
			
			chkMsg.addClass('text-red-500');
			chkMsg.html('아이디는 필수 입력 정보입니다.');
			return;
		}
		
		$.ajax({
			url : '/usr/member/loginIdDupChk',
			type : 'get',
			data : {
				loginId : el.value
			},
			dataType : 'json',
			success : function(data) {
				
				if (data.success) {
					chkMsg.removeClass('text-red-500');
					chkMsg.addClass('text-green-500');
					chkMsg.html(`\${data.rsMsg}`);
					validLoginId = el.value;
				} else {
					chkMsg.removeClass('text-green-500');
					chkMsg.addClass('text-red-500');
					chkMsg.html(`\${data.rsMsg}`);
					validLoginId = null;
				}
				
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})
	}
</script>


<c:set var="pageTitle" value="회원가입"/>   
<%@ include file="/view/usr/common/header.jsp" %>
	<div class="text-center text-3xl p-7">회원가입</div>
	<div  class="container flex justify-center text-center">
		<section>
			<form action="/usr/member/doJoin" onsubmit="return joinFormSubmit(this)">
				<table border="1" class="w-250">
					<tr>
						<th>아이디</th>
						<td class="p-3">
							<input class="w-170 border-2" type="text" name="loginId" onblur="loginIdDupChk(this);"/>
							<div id="chkMsg" class="mt-2 h-5 text-sm"></div>									
						</td>
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