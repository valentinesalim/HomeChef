let hiddenTotalPrice;
let hiddenAmount;

let amount;
let portionPrice;
let visibleTotalPrice;

let minus;
let plus;

const orderTotalCalculation = () => {
  let amountNum = Number.parseInt(amount.innerText);
  let portionPriceNum = Number.parseInt(portionPrice.innerText);

  let totalPrice = amountNum * portionPriceNum;
  hiddenTotalPrice.value = totalPrice;
  visibleTotalPrice.innerText = totalPrice;
}

const portionAmountControl = () => {
  console.log("Portion amount control mounted")
  hiddenTotalPrice = document.getElementById("hidden-order-total-price");
  hiddenAmount = document.getElementById("hidden_amount_portion");
  amount = document.getElementById("input_amount_portion");
  portionPrice = document.getElementById('price_per_portion');
  visibleTotalPrice = document.getElementById('total-price');
  minus = document.getElementById('minus-btn');
  plus = document.getElementById('plus-btn');
  console.log("Minus", minus)
  console.log("Plus", plus)
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
