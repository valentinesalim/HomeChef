console.log("Hello from order-total.js")

const orderTotalCalculation = () => {
  let pricePerPortion = document.getElementById('price_per_portion');
  console.log("Price per Portion: ", pricePerPortion)

  let portionAmount = document.getElementById('order_amount_portion');
  console.log("Amount of portion: ", portionAmount)

  portionAmount.addEventListener('change', (e) => {
    let amount = Number.parseInt(portionAmount.value)
    let price = Number.parseInt(portionAmount.value)
    let orderTotal = document.getElementById('order-total-price');
    console.log("Previuos Order total: ", orderTotal)

    orderTotal.value = amount * price
    console.log("Order total after amount change: ", Number.parseInt(orderTotal))
  });

}

export { orderTotalCalculation };
