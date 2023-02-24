import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-num-days"
export default class extends Controller {
  static targets = [ "from", "until", "total", "price" ]
  // connect() {
  //   console.log("Hello")
  // }
  calculate(event) {
    const fromDate = new Date(this.fromTarget.value);
    const untilDate = new Date(this.untilTarget.value);

  if (!isNaN(fromDate) && !isNaN(untilDate)) {
    const timeDiff = Math.abs(untilDate - fromDate);
    const diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
    this.totalTarget.innerHTML = diffDays;
    this.priceTarget.innerText = diffDays * parseInt(this.priceTarget.dataset.originalPrice, 10)
  } else {
    this.totalTarget.innerHTML = "0";
  }
}
}
