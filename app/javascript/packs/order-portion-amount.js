
const portionAmountControl = () => {
  let orderAmountInput = document.getElementById("order_amount_portion");

  let minusInput = document.getElementById('order-amount-minus-btn')
  let plusInput = document.getElementById('order-amount-plus-btn')

  minusInput.addEventListener('click', (e) => {
    let value = Number.parseInt(orderAmountInput.value)
    if (value > 0) {
      orderAmountInput.value = Number.parseInt(orderAmountInput.value) - 1
    }
  });

  plusInput.addEventListener('click', (e) => {
    orderAmountInput.value = Number.parseInt(orderAmountInput.value) + 1
  });
}

export { portionAmountControl };
