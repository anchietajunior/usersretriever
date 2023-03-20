import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox", "deleteButton", "idsHiddenField", "bulkDeleteForm"]
  static values = ["allChecked"]

  connect() {
    this.allCheckedValue = false
  }

  toggleSelection() {
    this.updateSelectedIds()
  }

  toggleAll() {
    this.allCheckedValue = !this.allCheckedValue
    this.checkboxTargets.forEach(checkbox => checkbox.checked = this.allCheckedValue)
    this.updateSelectedIds()
  }

  updateSelectedIds() {
    const selectedCheckboxes = this.checkboxTargets.filter(checkbox => checkbox.checked)
    this.idsHiddenFieldTarget.value = selectedCheckboxes.map(checkbox => checkbox.value)
  }

  deleteUsers(event) {
    event.preventDefault()

    if (this.idsHiddenFieldTarget.value == []) {
      alert("You must select at least one user.")
    } else {
      this.bulkDeleteFormTarget.submit()
    }
  }
}
