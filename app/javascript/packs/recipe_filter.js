// import Rails from "@rails/ujs";
// window.Rails = Rails;
// require("modal-confirm");
// if(Rails.fire(document, "rails:attachBindings")) {
//   Rails.start();
// }

console.log('Test: Hello from the recipe filter JS');

var checkBoxes = document.querySelectorAll(".form-check-input");
var form = document.querySelector('form');

for (const check of checkBoxes) {
  check.addEventListener( 'change', function() {
  Rails.fire(form, 'submit');
  });
}
