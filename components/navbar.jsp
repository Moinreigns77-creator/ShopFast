<%@page import="com.shopfast.entities.User"%>
<%
User user1 = (User) session.getAttribute("user");
%>

<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">ShopFast</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>

			</ul>



			<ul class="navbar-nav ml-auto">
				<!-- 				cart btn link -->
				<li class="nav-item active">
				  <a href="#!" class="nav-link" data-toggle="modal" data-target="#cart-modal">
				   <i class="fa fa-cart-plus" style="font-size: 20px;"></i><span class="ml-2 cart-items">( 0 )</span>
				  </a>
				</li>
				
				
				<c:if test="${empty user}">
					<li class="nav-item active"><a href="login" class="nav-link">Login</a>
					</li>
					<li class="nav-item active"><a href="register"
						class="nav-link">Register</a></li>
				</c:if>



				<c:if test="${not empty user}">
					<li class="nav-item active"><a href="${user.userType.equals('admin')?'/Shopfast/admin':'/Shopfast/normal' }" class="nav-link">${user.userName}</a>
					</li>
					<li class="nav-item active"><a href="logout" class="nav-link">Logout</a>
					</li>
				</c:if>
			</ul>



		</div>
	</div>
</nav>
