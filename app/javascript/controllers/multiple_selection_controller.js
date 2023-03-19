import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox", "deleteButton"]
  static values = ["ids", "allChecked"]

  connect() {
    this.allCheckedValue = false
    console.log("Selectable")
  }

  toggleSelection(event) {
    console.log('Toggle Selection', event.target.value)
    this.updateButtonState()
  }

  toggleAll() {
    this.allCheckedValue = !this.allCheckedValue
    this.checkboxTargets.forEach(checkbox => checkbox.checked = this.allCheckedValue)
  }

  updateButtonState() {
    const selectedCheckboxes = this.checkboxTargets.filter(checkbox => checkbox.checked)
    this.deleteButtonTarget.disabled = selectedCheckboxes.length === 0
  }

  deleteUsers(event) {
    event.preventDefault()
    console.log("YESSS!")
  }
}
