import { Controller } from "stimulus"
import { portionAmountControl } from "../packs/order-calculation";

export default class extends Controller {


  connect() {
    portionAmountControl();
  }
}
