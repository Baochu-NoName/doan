const allTabEl = document.getElementById("all_products");
const getTabIdEl = document.getElementById("all");

let xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function()  {
    if(this.readyState == 4 && this.status == 200){
        let myProductArr = JSON.parse(this.responseText);
        getProductJsonArr(myProductArr);
    }
}

xhttp.open("GET", "/products.json", true);
xhttp.send();

allTabEl.addEventListener("click", (e)=>{
    e.preventDefault();
    xhttp.onreadystatechange;
});

let products = [];
function getProductJsonArr(productArr){
    products = productArr;
    products.forEach((product)=>{
        getTabIdEl.insertAdjacentHTML("beforeend", `
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <a href="${product.product_url}" class="">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img class="img-thumbnail" src="${product.image_url}", alt="${product.name}" />
                            <h2>$${product.new_price}</h2>
                            <p>${product.name}</p>
                            <a href="${product.product_url}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>View Product</a>
                        </div>
                    </div>
                    </a>
                </div>
            </div>
        `);
    });
}
