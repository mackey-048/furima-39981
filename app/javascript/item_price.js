window.addEventListener('load', function() {
  const priceInput = document.getElementById('item-price');
  const feeResult = document.getElementById('add-tax-price');
  const profitResult = document.getElementById('profit');

  priceInput.addEventListener('input', function() {
    const inputValue = priceInput.value;
    // 金額の計算
    const price = parseFloat(inputValue) || 0;
    const fee = Math.floor(price * 0.1); // 手数料（10%）
    const profit = price - fee;

    // 結果の表示
    feeResult.innerHTML = fee ;
    profitResult.innerHTML = profit ;
  });
});