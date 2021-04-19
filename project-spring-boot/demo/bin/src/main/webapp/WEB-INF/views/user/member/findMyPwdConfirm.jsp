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
		  padding-bottom: 120px;
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

		    <form action="/member/find/password/confirm" method="post">
		        <i class="bi-github" role="img" aria-label="GitHub"
		        style="font-size: 2rem; color: black;"></i>
			    <h1 class="h3 mb-3 fw-normal">비밀번호 초기화</h1>


		       	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        	<input type="hidden" name="id" value="${id}" />
	        	<input type="hidden" name="key" value="${key}" />

			    <div class="form-floating my-3">
			      <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password">
			      <label for="floatingPassword">비밀번호 입력</label>
			    </div>
			    <div class="form-floating my-3">
			      <input name="repassword" type="password" class="form-control" id="floatingPassword" placeholder="Password">
			      <label for="floatingPassword">비밀번호 재입력</label>
			    </div>


			    <button class="w-100 btn btn-lg btn-primary" type="submit">확인</button>



			  </form>
		</div>
	   	<div class="mt-3 mb-3 text-muted">© 2021 Tumblup Inc.</div>
	</main>




</body>
</html>


