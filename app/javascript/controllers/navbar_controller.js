import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["navbar"];
  connect() {

    window.addEventListener("scroll", () => {
      //  scrollTop = (window.pageYOffset !== undefined) ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;
      const scrolled = window.scrollY;
      if(scrolled > 0){
        this.navbarTarget.classList.add('active');
      }
      else {
        this.navbarTarget.classList.remove('active');
      }
    });
  }
}
