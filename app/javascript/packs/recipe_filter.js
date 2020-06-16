import Rails from "@rails/ujs";

const categorisationFilter = () => {
  let checkBoxes = document.querySelectorAll(".form-check-input");
  let form = document.getElementById("filter-recipes");
  for (const check of checkBoxes) {
    check.addEventListener('change', (e) => {
      console.log("Form change test", form);
      Rails.fire(form, 'submit');
    });
  }
}

export { categorisationFilter };
