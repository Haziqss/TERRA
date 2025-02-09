// Search Functionality
document.getElementById("searchSeed").addEventListener("input", function() {
    const searchText = this.value.toLowerCase();
    const products = document.querySelectorAll(".product-card");

    products.forEach(product => {
        const name = product.getAttribute("data-name").toLowerCase();
        product.style.display = name.includes(searchText) ? "block" : "none";
    });
});

// Filter Functionality
document.querySelectorAll(".dropdown-item").forEach(item => {
    item.addEventListener("click", function(event) {
        event.preventDefault(); // Prevent default link behavior
        const sortOrder = this.getAttribute("data-value"); // Use 'data-value' instead of 'value'
        const productsContainer = document.getElementById("productContainer");
        const products = Array.from(productsContainer.getElementsByClassName("product-card"));
        
        products.sort((a, b) => {
            const priceA = parseFloat(a.getAttribute("data-price"));
            const priceB = parseFloat(b.getAttribute("data-price"));
            return sortOrder === "lowToHigh" ? priceA - priceB : priceB - priceA;
        });

        // Clear and re-append sorted cards
        productsContainer.innerHTML = "";
        products.forEach(product => productsContainer.appendChild(product));
    });
});
