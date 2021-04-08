<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>



<link rel="icon" href="/favicon.ico">

	<style type="text/css">
	body {
	  /* font-size: .875rem; */
	}

	.feather {
	  width: 16px;
	  height: 16px;
	  vertical-align: text-bottom;
	}

	/*
	 * Sidebar
	 */

	.sidebar {
	  position: fixed;
	  top: 0;
	  /* rtl:raw:
	  right: 0;
	  */
	  bottom: 0;
	  /* rtl:remove */
	  left: 0;
	  z-index: 100; /* Behind the navbar */
	  padding: 48px 0 0; /* Height of navbar */
	  /*
	  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1); */
	}

	@media (max-width: 767.98px) {
	  .sidebar {
	    top: 5rem;
	  }
	}

	.sidebar-sticky {
	  position: relative;
	  top: 0;
	  height: calc(100vh - 48px);
	  padding-top: .5rem;
	  overflow-x: hidden;
	  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
	}

	.sidebar .nav-link {
	  font-weight: 500;
	  color: #333;
	}

	.sidebar .nav-link .feather {
	  margin-right: 4px;
	  color: #727272;
	}

	.sidebar .nav-link.active {
	  color: #007bff;
	}

	.sidebar .nav-link:hover .feather,
	.sidebar .nav-link.active .feather {
	  color: inherit;
	}

	.sidebar-heading {
	  font-size: .75rem;
	  text-transform: uppercase;
	}

	/*
	 * Navbar
	 */

	.navbar-brand {
	  padding-top: .75rem;
	  padding-bottom: .75rem;
	  font-size: 1rem;
	   /*background-color: rgba(0, 0, 0, .25);

	  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25); */
	}
/*
	.navbar .navbar-toggler {
	  top: 0.9rem;
	  left: 1rem;
	}
 */
	.navbar .form-control {
	  padding: .75rem 1rem;
	  border-width: 0;
	  border-radius: 0;
	}

	.form-control-dark {
	  color: #fff;
	  background-color: rgba(255, 255, 255, .1);
	  border-color: rgba(255, 255, 255, .1);
	}

	.form-control-dark:focus {
	  border-color: transparent;/*
	  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25); */
	}

	/*side bar nav*/

/* body {
  display: flex;
  flex-wrap: nowrap;
  height: 100vh;
  height: -webkit-fill-available;
  overflow-x: auto;
  overflow-y: hidden;
}
body > * {
  flex-shrink: 0;
  min-height: -webkit-fill-available;
} */

.b-example-divider {
  width: 1.5rem;
  height: 100%;
  background-color: rgba(0, 0, 0, .1);
  border: solid rgba(0, 0, 0, .15);
  border-width: 1px 0;
  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
}

.bi {
  vertical-align: -.125em;
  pointer-events: none;
  fill: currentColor;
}

.dropdown-toggle { outline: 0; }

.nav-flush .nav-link {
  border-radius: 0;
}

.btn-toggle {
  display: inline-flex;
  align-items: center;
  padding: .25rem .5rem;
  font-weight: 600;
  color: rgba(0, 0, 0, .65);
  background-color: transparent;
  border: 0;
}
.btn-toggle:hover,
.btn-toggle:focus {
  color: rgba(0, 0, 0, .85);
  background-color: #d2f4ea;
}

.btn-toggle::before {
  width: 1.25em;
  line-height: 0;

  /*

  content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
  */

  transition: transform .35s ease;
  transform-origin: .5em 50%;
}

.btn-toggle[aria-expanded="true"] {
  color: rgba(0, 0, 0, .85);
}
.btn-toggle[aria-expanded="true"]::before {
  transform: rotate(90deg);
}

.btn-toggle-nav a {
  display: inline-flex;
  padding: .1875rem .5rem;
  margin-top: .125rem;
  margin-left: 1.25rem;
  text-decoration: none;
}
.btn-toggle-nav a:hover,
.btn-toggle-nav a:focus {
  background-color: #d2f4ea;
}

.scrollarea {
  overflow-y: auto;
}

.fw-semibold { font-weight: 600; }
.lh-tight { line-height: 1.25; }

	</style>