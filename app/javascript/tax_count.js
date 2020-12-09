function tax_count() {
  const priceText = document.getElementById("item-price");

  priceText.addEventListener("keyup", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxValue = Math.floor(priceText.value * 0.1);

    addTaxPrice.innerHTML = taxValue;
    profit.innerHTML = priceText.value - taxValue;

  });

};
window.addEventListener("load", tax_count);