<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

    
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 테일윈드, daisyUI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<link rel="stylesheet" href="/resource/css/common.css"/>
<script src="/resource/js/common.js"></script> 

<meta charset="UTF-8">
<title>${pageTitle }</title>
</head>
<body>
<div class="container text-3xl pt-10 flex relative justify-center">
	<i class="fa-regular fa-pen-to-square absolute left-10"></i>
	<div>
		<a class="pr-10 pl-10 hover:underline" href="/usr/home/main">홈</a>
		<a class="pr-10 pl-10 hover:underline" href="/usr/article/list">리스트</a>
			<c:if test="${sessionScope.loginedMemberId == null }">
				<a class="pr-10 pl-10 hover:underline" href="/usr/member/join">회원가입</a>
				<a class="pr-10 pl-10 hover:underline" href="/usr/member/login">로그인</a>
			</c:if>
			<c:if test="${sessionScope.loginedMemberId != null }">
				<a class="pr-10 pl-10 hover:underline" href="/usr/member/logout">로그아웃</a>
			</c:if>
	</div>
</div>