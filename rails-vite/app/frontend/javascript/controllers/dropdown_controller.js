import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];

  connect() {
    document.addEventListener("click", this.closeMenuOutside.bind(this));
  }

  disconnect() {
    document.removeEventListener("click", this.closeMenuOutside.bind(this));
  }

  toggle() {
    this.menuTarget.classList.toggle("hidden");
  }

  closeMenuOutside(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("hidden");
    }
  }
}
