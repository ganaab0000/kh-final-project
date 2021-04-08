<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<header class="bg-white navbar navbar-dark sticky-top flex-md-nowrap p-0" style="border-bottom: 1px solid #dee2e6;">
	<div class="container-fluid my-2 " style="display: inline-block !important;">
		<div class="row">
			<div class="col">

				<a class=" d-md-none collapsed" style="background-color:white; color:black; line-height: 2.9rem;"
					type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
					aria-controls="sidebarMenu" aria-expanded="false"
					aria-label="Toggle navigation" >
					<span class="mx-3 fs-4"><i class="bi bi-list"></i></span>
				</a>

			</div>
			<div class="col text-center">

				<a href="/admin"
					class="">
					<i class="bi-github" role="img" aria-label="GitHub"
					style="font-size: 2rem; color: black;"></i>
				</a>

			</div>
			<div class="col text-end mx-3 fs-4">
				<a class="text-dark px-2"
				href="/" style="line-height: 2.9rem;"><i class="bi bi-house-door-fill"></i></a>
				<a class="text-dark px-2"
				href="/member/signout" style="line-height: 2.9rem;"><i class="bi bi-unlock-fill"></i></a>
			</div>
		</div>
	</div>

</header>
