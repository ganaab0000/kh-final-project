<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse bg-white">

  <div class="position-sticky pt-3">
    <ul class="nav flex-column">

	    <li class="mb-1 nav-item"">

	      <div class="btn align-items-center rounded" data-bs-toggle="collapse" data-bs-target="#collapse-el-1" aria-expanded="true">
	        <div class="nav-link" aria-current="page" href="/admin">
	          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
	          	대시보드
	        </div>
	      </div>

	      <div class="collapse collapse-el" id="collapse-el-1" style="">
	        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	          <li><a href="/admin" class="link-dark rounded d-block px-4 d-block px-4">전체</a></li>
	          <li><a href="/admin" class="link-dark rounded d-block px-4">주간</a></li>
	          <li><a href="/admin" class="link-dark rounded d-block px-4">월간</a></li>
	          <li><a href="/admin" class="link-dark rounded d-block px-4">연간</a></li>
	        </ul>
	      </div>
	    </li>

	    <li class="mb-1">
	      <div class="btn align-items-center rounded" data-bs-toggle="collapse" data-bs-target="#collapse-el-2" aria-expanded="true">
	        <div class="nav-link" aria-current="page" href="/admin">
	          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
          	 	계정 관리
	        </div>
	      </div>
	      <div class="collapse collapse-el" id="collapse-el-2" style="">
	        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	          <li><a href="/admin/member" class="link-dark rounded d-block px-4">전체</a></li>
	        </ul>
	      </div>
	    </li>

	    <li class="mb-1">
	      <div class="btn align-items-center rounded" data-bs-toggle="collapse" data-bs-target="#collapse-el-3" aria-expanded="true">
	        <div class="nav-link" aria-current="page" href="/admin">
	          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
          		프로젝트 관리
	        </div>
	      </div>
	      <div class="collapse collapse-el" id="collapse-el-3" style="">
	        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	          <li><a href="#" class="link-dark rounded d-block px-4">전체</a></li>
	          <li><a href="#" class="link-dark rounded d-block px-4">심사</a></li>
	          <li><a href="#" class="link-dark rounded d-block px-4">마감</a></li>
	          <li><a href="#" class="link-dark rounded d-block px-4">신고</a></li>
	        </ul>
	      </div>
	    </li>
	    <li class="mb-1">
	      <div class="btn align-items-center rounded" data-bs-toggle="collapse" data-bs-target="#collapse-el-4" aria-expanded="true">
	        <div class="nav-link" aria-current="page" href="/admin">
          		<i class="bi bi-wallet"></i>
          	주문 관리
	        </div>
	      </div>
	      <div class="collapse collapse-el" id="collapse-el-4" style="">
	        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	          <li><a href="#" class="link-dark rounded d-block px-4">전체</a></li>
	        </ul>
	      </div>
	    </li>
	    <li class="mb-1">
	      <div class="btn align-items-center rounded" data-bs-toggle="collapse" data-bs-target="#collapse-el-5" aria-expanded="true">
	        <div class="nav-link" aria-current="page" href="/admin">
	          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
         	고객 관리
	        </div>
	      </div>
	      <div class="collapse collapse-el" id="collapse-el-5" style="">
	        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	          <li><a href="${pageContext.request.contextPath}/admin/noticeList" class="link-dark rounded d-block px-4">공지사항</a></li>
	          <li><a href="${pageContext.request.contextPath}/admin/faqList" class="link-dark rounded d-block px-4">FAQ</a></li>
	          <li><a href="${pageContext.request.contextPath}/admin/qnaList" class="link-dark rounded d-block px-4">QNA</a></li>
	        </ul>
	      </div>
	    </li>
	    <li class="border-top mt-3"></li>

	    <li class="mb-1">
	      <div class="btn align-items-center rounded" data-bs-toggle="collapse" data-bs-target=".collapse-el" aria-expanded="true">
	          <a class="nav-link" href=""><i class="bi bi-arrow-down-up"></i>
	          	펼침 / 접기
	       	 </a>
	      </div>
	    </li>

	    <li class="mb-1">
	      <div class="btn align-items-center rounded" data-bs-toggle="collapse" data-bs-target=".collapse-el" aria-expanded="true">
	          <a class="nav-link" href=""><i class="feather feather-layers bi bi-wrench"></i>
	          	설정
	       	 </a>
	      </div>
	    </li>


    </ul>


  </div>
</nav>
