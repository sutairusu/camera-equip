import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    window.addEventListener("scroll",() => {
      const scrolled = window.scrollY;
      if(scrolled > 0){
        // console.log('andil');
         document.querySelector('header').classList.add('active');
      }
      else {
        // console.log('malla');
        document.querySelector('header').classList.remove('active');
      }

    });
  }
}
