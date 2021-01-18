import { Controller } from "stimulus"

// Import UJS so we can access the Rails.ajax method
import Rails from "@rails/ujs";

export default class extends Controller {
  publish() {
    Rails.ajax({
      type: "patch",
      url: this.data.get('url'),
    })
    const onOffButton = () => {
      const currentButton = document.getElementById(this.data.scope.element.id);
      if (currentButton.innerText == "Hors ligne") {
        currentButton.innerText = "En ligne";
        currentButton.classList.add('btn-outline-success');
        currentButton.classList.remove('btn-outline-danger');
      } else {
        currentButton.innerText = "Hors ligne";
        currentButton.classList.remove('btn-outline-success');
        currentButton.classList.add('btn-outline-danger');
      }
    }
    onOffButton();
  }
}