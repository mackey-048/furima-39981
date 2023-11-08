document.addEventListener('DOMContentLoaded', function () {
  const priceInput = document.getElementById('item-price');
  const feeSpan = document.getElementById('add-tax-price');
  const profitSpan = document.getElementById('profit');

  priceInput.addEventListener('input', function () {
    const price = parseFloat(priceInput.value) || 0;
    const fee = Math.floor(price * 0.1); 
    const profit = price - fee;

    feeSpan.textContent = fee;
    profitSpan.textContent = profit;
  });
});