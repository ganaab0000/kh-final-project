<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<header class="p-3 border-bottom">
  <div class="container">

    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
      <a href="/"
        class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
        <i class="bi-github" role="img" aria-label="GitHub"
        style="font-size: 2rem; color: black;"></i>
        <span class="nav-link px-2 link-secondary"></span>
      </a>
    </ul>

    </div>
  <div class="container">


    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

<!--
	        <i class="bi-list" role="img"
	        style="font-size: 11rem; "></i> -->

      <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        <li>

	        <a href="" class="nav-link px-2 link-dark fw-bold" data-bs-toggle="modal" data-bs-target="#navModal">
				프로젝트 둘러보기
			</a>
        </li>
        <li><a href="#" class="nav-link px-2 link-dark fw-bold">프로젝트 올리기</a></li>
      </ul>




      <form action="/project/list" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
        <input type="search" name="keyword" class="form-control" placeholder="Search...">
      </form>

      <security:authorize access="isAuthenticated()">
        <div class="dropdown text-end">
          <a href="#"
            class="d-block link-dark text-decoration-none dropdown-toggle"
            id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="${member.profileImgUrl}" alt="mdo" width="32"
            height="32" class="rounded-circle">
          </a>

          <ul class="dropdown-menu text-small"
            aria-labelledby="dropdownUser1" style="">
            <security:authorize access="hasRole('ROLE_MEMBER') && !hasRole('ROLE_MEMBER_MAIL')">
              <li><a class="dropdown-item" href="/member/auth/mail/submit">이메일 인증</a></li>
            </security:authorize>
	        <security:authorize access="hasRole('ROLE_ADMIN')">
	          <li><a class="dropdown-item" href="/admin">관리자</a></li>
	        </security:authorize>
            <li><a class="dropdown-item" href="#">메시지</a></li>
            <li><a class="dropdown-item" href="#">후원현황</a></li>
            <li><a class="dropdown-item" href="/project/liked">좋아하는 프로젝트</a></li>
            <li><a class="dropdown-item" href="#">내가 만든 프로젝트</a></li>
            <!--
            <li><a class="dropdown-item" href="/member">내 정보</a></li>
             -->

            <li><a class="dropdown-item" href="/member/edit/info">설정</a></li>


            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/member/signout">로그아웃</a></li>
          </ul>
        </div>
      </security:authorize>
      <security:authorize access="!isAuthenticated()">
        <div class="text-end">
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
			        <li><a href="/member/signin" class="nav-link px-2 link-secondary">로그인</a></li>
			        <li><a href="/member/signup" class="nav-link px-2 link-dark">회원가입</a></li>
			      </ul>
        </div>
      </security:authorize>
    </div>
  </div>

	<!-- Modal -->
	<div class="modal fade" id="navModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modalHeaderContainer">
						<button type="button" class="btn-close modalClose" data-bs-dismiss="modal" aria-label="Close"></button>
						<span>프로젝트 둘러보기</span>
					</div>
				</div>
				<div class="modal-body">
					<div class="modalSearchContainer">
						<div class="modalSearchTitle">프로젝트 검색</div>
						<form action="/project/list" method="get" style="width: 100%;">
							<div class="input-group mb-3">
								<input type="text" name="keyword" class="form-control" placeholder="검색어를 입력해주세요" aria-label="Example text with button addon" aria-describedby="button-addon1">
								<button class="btn btn-outline-secondary" type="submit" id="button-addon1">검색</button>
							</div>
						</form>
					</div>
					<div class="modalDivider"></div>
					<div class="modelMenuItemContainer">
						<div class="modelMenuItem"><a href="/project/list">모든 프로젝트</a></div>
						<div class="modelMenuItem"><a href="/project/list?status=1&minRate=75&maxRate=99">성공 임박 프로젝트</a></div>
						<div class="modelMenuItem"><a href="/project/list?status=3">공개 예정 프로젝트</a></div>
					</div>
					<div class="modalDivider"></div>
					<div class="modalCategoryContainer">
						<div class="modalCategoryTitle">카테고리</div>
						<div class="modalCategoryWrapper"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
