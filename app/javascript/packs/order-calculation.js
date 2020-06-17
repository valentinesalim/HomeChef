let hiddenTotalPrice = document.getElementById("hidden-order-total-price");
let hiddenAmount = document.getElementById("hidden_amount_portion");

let amount = document.getElementById("input_amount_portion");
let portionPrice = document.getElementById('price_per_portion');
let visibleTotalPrice = document.getElementById('total-price');

let minus = document.getElementById('minus-btn');
let plus = document.getElementById('plus-btn');

const orderTotalCalculation = () => {
  let amountNum = Number.parseInt(amount.innerText);
  let portionPriceNum = Number.parseInt(portionPrice.innerText);

  let totalPrice = amountNum * portionPriceNum;
  hiddenTotalPrice.value = totalPrice;
  visibleTotalPrice.innerText = totalPrice;
}

const portionAmountControl = () => {
  minus.addEventListener('click', (e) => {
    let value = Number.parseInt(amount.innerText)
    if (value > 0) {
      amount.innerText = Number.parseInt(amount.innerText) - 1
      hiddenAmount.value = amount.innerText
      orderTotalCalculation()
    }
  });

  plus.addEventListener('click', (e) => {
    amount.innerText = Number.parseInt(amount.innerText) + 1
    hiddenAmount.value = amount.innerText
    orderTotalCalculation()
  });

}

export { portionAmountControl };
