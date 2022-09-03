window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  const addtaxprice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
    const addProfitDom  = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))

});

});



