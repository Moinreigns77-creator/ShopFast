

//adding product to cart
function add_product_cart(pId, pTitle, pPrice) {
	let cart = localStorage.getItem("cart");

	if (cart == null) {
		let products = [];
		let product = { productId: pId, productTitle: pTitle, productQuantity: 1, productPrice: pPrice }
		products.push(product)
		localStorage.setItem("cart", JSON.stringify(products))
		console.log("product added 1st time")
		showToast('<i class="fa fa-check-circle" style="font-size:24px;color:green;"></i>'+" "+productTitle+' item added to cart')
	}
	else {
		let pcart = JSON.parse(cart);
		let oldProduct = pcart.find((item) => item.productId == pId)
		if (oldProduct) {
			//increase the quantity of the product
			oldProduct.productQuantity = oldProduct.productQuantity + 1;
			pcart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product quantity increased")
			showToast('<i class="fa fa-check-circle" style="font-size:24px;color:green;"></i>'+" "+oldProduct.productTitle+' quntity increased, Quantity='+oldProduct.productQuantity);
		} else {
			//we have to add new product
			let newProduct = { productId: pId, productTitle: pTitle, productQuantity: 1, productPrice: pPrice }
			pcart.push(newProduct)
			localStorage.setItem("cart", JSON.stringify(pcart))
			console.log(" new product added")
			showToast('<i class="fa fa-check-circle" style="font-size:24px;color:green;"></i>'+" "+newProduct.productTitle+' item added to cart')

		}

	}

	updateCart();

}




//update cart
function updateCart() {


	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {

		console.log("cart is empty");
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>Cart does not have any items</h3>");
		$(".checkout-btn").attr('disabled',true);

	} else {

		//items in the cart
		console.log(cart);
		$(".cart-items").html(`(${cart.length})`);
		let table = `
	  			<table class='table table-hover'>
	  			 <thead >
	  				<tr>
	  				<th scope="col">Product Name</th>
	  				<th scope="col">Price</th>
	  				<th scope="col">Quantity</th>
	  				<th scope="col">Total Price</th>
	  				<th scope="col">Action</th>
	  				</tr
	  			</thead>
	  			
	  			<tbody>
	             `;
		let totalPrice = 0;
		cart.map((item) => {
			table += `
					 	<tr>
					 	  <td>${item.productTitle}</td>
					 	  <td>&#8377;${item.productPrice}</td>
					 	  <td>${item.productQuantity}</td>
					 	  <td>&#8377;${item.productQuantity * item.productPrice}</td>
					 	  <td> <button onClick='deleteFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button> </td>
					 	</tr> 
					 	`
			totalPrice += item.productQuantity * item.productPrice;
		})


		table = table + `
	       <tr >
	      	<td colspan='5' class='font-weight-bold text-right'> Total Price: &#8377;${totalPrice}/- </td> 
	       </tr>
	       </tbody >
	       </table>`

		$(".cart-body").html(table);
				
		$(".checkout-btn").attr('disabled',false);


	}

}


//delete product from cart
function deleteFromCart(pId) {

	let cart = JSON.parse(localStorage.getItem('cart'));

	let newCart = cart.filter((item) => item.productId != pId);

	localStorage.setItem('cart', JSON.stringify(newCart));

	updateCart();
	
	showToast('<i class="fa fa-check-circle" style="font-size:24px;color:green;"></i>'+' item removed from cart')
}






//updating when document is ready
$(document).ready(function() {
	updateCart();
})





//toast content js
function showToast(content) {
	$('#toast').addClass('display');
	$('#toast').html(content);

	setTimeout(() => {
		$('#toast').removeClass('display');
	},3000)
}


//checout btn navigation script
function checkout(){
	
	var contextPath = window.location.pathname.split('/')[1]; // Get the context path
	window.location.href="/"+contextPath+"/checkout";
}
