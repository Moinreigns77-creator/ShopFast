<%@page import="com.shopfast.entities.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>Admin - ShopFast</title>
<%@ include file="/WEB-INF/components/common_css_js.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/components/navbar.jsp"%>
	<div class="container admin">

		<!-- 	message -->
		<div class="container-fluid mt-3">
			<%@include file="/WEB-INF/components/message.jsp"%>
		</div>

		<!-- 		end message -->

		<!-- 		first row -->
		<div class="row mt-3">
			<!-- 			1st row:col 1 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<img alt="img-icon" style="max-width: 125px;"
							class="img-fluid img-responsive"
							src="<c:url value="/resources/images/users.png" /> ">
						<h1>${userCount }</h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			<!-- 			1st row :col 2 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<img alt="img-icon" style="max-width: 125px;"
							class="img-fluid img-responsive"
							src="<c:url value="/resources/images/categories.png" /> ">
						<h1>${categoryCount }</h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<!-- 			1st row : col 3 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<img alt="img-icon" style="max-width: 125px;"
							class="img-fluid img-responsive"
							src="<c:url value="/resources/images/products.png" /> ">
						<h1>${productCount }</h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>

		<!-- 		second row -->
		<div class="row mt-3">
			<!-- 		2nd row : 1st col -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">
						<img alt="img-icon" style="max-width: 125px;"
							class="img-fluid img-responsive"
							src="<c:url value="/resources/images/add-category.png" /> ">
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
			<!-- 			2nd row : 2nd col -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<img alt="img-icon" style="max-width: 125px;"
							class="img-fluid img-responsive"
							src="<c:url value="/resources/images/add-product.png" /> ">
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 	add-Category modal -->

	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title text-uppercase text-white"
						id="exampleModalLongTitle">Fill in the category details :</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="add-category" method="post">
						<div class="form-group">
							<input type="text" name="categoryTitle" class="form-control"
								placeholder="Enter Category Title" required />
						</div>

						<div class="form-group">
							<textarea rows="5" name="categoryDescription"
								class="form-control" placeholder="Enter Category Description"
								required></textarea>
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-success">Add
								Category</button>
							<button type="button" class="btn btn-outline-warning"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- end add-Category modal -->






	<!-- 	add-Product modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title text-uppercase text-white"
						id="exampleModalLongTitle">Fill in the product details :</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<!-- 						form -->
					<form action="add-product" method="post"
						enctype="multipart/form-data">
						<!-- 						product title -->
						<div class="form-group">
							<input type="text" name="productTitle" class="form-control"
								placeholder="Enter Product Title" required />
						</div>
						<!-- product description -->
						<div class="form-group">
							<textarea rows="5" name="productDescription" class="form-control"
								placeholder="Enter Product Description" required></textarea>
						</div>
						<!-- product price  -->
						<div class="form-group">
							<input type="number" name="productPrice" class="form-control"
								placeholder="Enter Product Price" required />
						</div>
						<!-- product discount -->
						<div class="form-group">
							<input type="number" name="productDiscount" class="form-control"
								placeholder="Enter Product Discount" required />
						</div>
						<!-- product quantity -->
						<div class="form-group">
							<input type="number" name="productQuantity" class="form-control"
								placeholder="Enter Product Quantity" required />
						</div>
						<!-- product category -->
						<div class="form-group">
							<label>Select the category:</label> <select name="categoryId"
								class="form-control">
								<c:forEach items="${categories}" var="cat">
									<option value="${cat.categoryId}">
										<c:out value="${cat.categoryTitle}" />
									</option>
								</c:forEach>
							</select>
						</div>
						<!-- product picture -->
						<div class="form-control">
							<label>Select Product Picture</label> <input type="file"
								name="file" class="form-control" required />
						</div>

						<div class="container text-center mt-2">
							<button type="submit" class="btn btn-outline-success">Add
								Product</button>
							<button type="button" class="btn btn-outline-warning"
								data-dismiss="modal">Close</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>



	<!-- End add-Product modal -->
	
	<%@ include file="/WEB-INF/components/checkout_modal.jsp" %>
	

</body>
</html>