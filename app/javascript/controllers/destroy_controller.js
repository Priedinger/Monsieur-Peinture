import { Controller } from "stimulus"

export default class extends Controller {
  delete() {
    this.element.closest('.card').remove();
  }
}