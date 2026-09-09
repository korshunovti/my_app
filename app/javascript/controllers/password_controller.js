import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["password", "confirmation", "message"]
    static values = { mismatch: String }

    check() {
        const pwd = this.passwordTarget.value
        const conf = this.confirmationTarget.value

        // Молчим, пока подтверждение не начали вводить
        if (conf === "") {
            this.messageTarget.textContent = ""
            this.confirmationTarget.classList.remove("is-invalid")
            return
        }

        const same = pwd === conf
        this.messageTarget.textContent = same ? "" : this.mismatchValue
        this.confirmationTarget.classList.toggle("is-invalid", !same)
    }
}
