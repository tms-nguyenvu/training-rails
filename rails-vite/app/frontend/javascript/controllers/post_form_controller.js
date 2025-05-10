import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener("turbo:submit-end", this.resetForm.bind(this))
  }

  resetForm() {
    this.element.reset()
  }
}
