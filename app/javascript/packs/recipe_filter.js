import Rails from "@rails/ujs";

console.log('Test: Hello from the recipe filter JS');

var checkBoxes = document.querySelectorAll(".form-check-input");
var form = document.querySelector('form');

const categorisationFilter = () => {
  for (const check of checkBoxes) {
    check.addEventListener('change', (e) => {
      console.log("Form change test", form);
      Rails.fire(form, 'submit');
    });
  }
}

export { categorisationFilter };
