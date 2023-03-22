import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"]

  close(event) {
    if (event.keyCode == 27 || event.type == "click" || event.type == "turbo:submit-end") {
      this.modalTarget.remove()
    }
  }
}