import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
    static targets = ["button"]

    connect() {

    }

    confirm(event) {
        if (!window.confirm("Are you sure you want to delete this category?")) {
        event.preventDefault();
        }
    }
}