import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["navbar"];
  connect() {

    window.addEventListener("scroll", () => {
      //  scrollTop = (window.pageYOffset !== undefined) ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;
      // const scrolled = window.scrollY;
      // if(scrolled > 0){
      //   this.navbarTarget.classList.add('active');
      // }
      // else {
      //   this.navbarTarget.classList.remove('active');
      // }
      // console.log(window.scrollY);
      // console.log(this.iffsetHeight)
      if (window.scrollY > 300) {
        // console.log(window.scrollY)
        this.navbarTarget.classList.add('fixed-top');
        // add padding top to show content behind navbar
        const navbar_height = this.offsetHeight;
        document.body.style.paddingTop = navbar_height + 'px';
      } else {
        this.navbarTarget.classList.remove('fixed-top');
         // remove padding top from body
        document.body.style.paddingTop = '0';
      }
    });
  }
}
