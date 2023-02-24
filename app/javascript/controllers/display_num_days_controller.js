import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-num-days"
export default class extends Controller {
  static targets = [ "from", "until", "total" ]
  // connect() {
  //   console.log("Hello")
  // }
  calculate(event) {
    console.log("Hello")
    const fromDate = new Date(this.fromTarget.value);
    const untilDate = new Date(this.untilTarget.value);
    const timeDiff = Math.abs(untilDate - fromDate);
    const diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
    this.totalTarget.innerHTML = diffDays;
  }
}
