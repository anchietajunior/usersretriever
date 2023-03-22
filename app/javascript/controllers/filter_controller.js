import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "genderInput", "ageInput"]

  autoSubmit() {
    this.formTarget.submit()
  }
}