import { Controller } from "stimulus"
import { categorisationFilter } from "../packs/recipe_filter";

export default class extends Controller {


  connect() {
    categorisationFilter();
    console.log("Hello from index-form_controller")
  }
}
