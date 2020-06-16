import { Controller } from "stimulus"
import { portionAmountControl } from "../packs/order-portion-amount";
import { orderTotalCalculation } from "../packs/order-total";

export default class extends Controller {


  connect() {
    portionAmountControl();
    orderTotalCalculation();
  }
}
