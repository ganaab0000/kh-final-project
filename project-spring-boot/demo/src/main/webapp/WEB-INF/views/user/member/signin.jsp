<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<jsp:include page="/WEB-INF/views/user/common/head.jsp"></jsp:include>
	<style>
		html,
		body {
		  height: 100%;
		}

		body {
		  display: flex;
		  align-items: center;
		  padding-top: 40px;
		  padding-bottom: 40px;
		  background-color: rgb(255, 255, 255);
		}

		.form-signin-border {
		  border: 1px solid rgb(228, 228, 228);
		  border-radius: 5px;
		  width: 100%;
		  max-width: 400px;
		  padding: 35px;
		  padding-bottom: 80px;
		  margin: auto;
		}

		.form-signin {
		  width: 100%;
		  max-width: 400px;
		  margin: auto;
		}

		.form-signin .checkbox {
		  font-weight: 400;
		}

		.form-signin .form-floating:focus-within {
		  z-index: 2;
		}

		.form-signin input[type="email"] {
		  margin-bottom: -1px;
		  border-bottom-right-radius: 0;
		  border-bottom-left-radius: 0;
		}

		.form-signin input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
</head>
<body class="text-center">

	<main class="form-signin">
		<div class="form-signin-border">

	    <form action="/member/signin" method="post">
	        <i class="bi-github" role="img" aria-label="GitHub"
	        style="font-size: 2rem; color: black;"></i>
		    <h1 class="h3 mb-3 fw-normal">로그인</h1>

			<c:if test="${empty MEMBER_SIGNIN_EXCEPTION and not empty SPRING_SECURITY_LAST_EXCEPTION}">
			    <font color="red">
			        <p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
			        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
			    </font>
			</c:if>
			<c:if test="${not empty MEMBER_SIGNIN_EXCEPTION}">
			    <font color="red">
			        <p>${MEMBER_SIGNIN_EXCEPTION}</p>
			        <c:remove var="MEMBER_SIGNIN_EXCEPTION" scope="session"/>
			    </font>
			</c:if>



		   	<p>
	        	<a href="/oauth2/authorization/google" class="w-100 btn btn-lg btn-outline-dark" role="button">구글 아이디로 로그인</a>
		   	</p>
		   	<p>
				<a href="/oauth2/authorization/naver" class="w-100 btn btn-lg btn-outline-dark" role="button">네이버 아이디로 로그인</a>
		   	</p>
			<hr>

	       	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		    <div class="form-floating my-3">
		      <input name="email" type="email" class="form-control" id="floatingInput" placeholder="name@example.com" required>
		      <label for="floatingInput">이메일 주소 입력</label>
		    </div>
		    <div class="form-floating my-3">
		      <input name="pwd" type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
		      <label for="floatingPassword">비밀번호 입력</label>
		    </div>

		    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
		    <div class="checkbox my-3">
		      <label>
		        <input type="checkbox" name="remember-me"> 자동 로그인
		      </label>
		    </div>
		  </form>
	   	<div style="color:gray;">
		   	아직 텀블업 계정이 없으신가요?
		   	<a href="/member/signup">가입하기</a>
	   	</div>
	   	<hr>

	   	<a href="/member/find/password/submit">혹시 비밀번호를 잊으셨나요?</a>
		</div>

	   	<div class="mt-3 mb-3 text-muted">© 2021 Tumblup Inc.</div>
	</main>




</body>
</html>