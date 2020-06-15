import Rails from "@rails/ujs";

console.log('Test: Hello from the recipe filter JS');

var checkBoxes = document.querySelectorAll(".form-check-input");
// original:
// var form = document.querySelector('form');
// new
var form = document.getElementById("filter-recipes");

const categorisationFilter = () => {
  for (const check of checkBoxes) {
    check.addEventListener('change', (e) => {
      console.log("Form change test", form);
      Rails.fire(form, 'submit');
    });
  }
}

export { categorisationFilter };
