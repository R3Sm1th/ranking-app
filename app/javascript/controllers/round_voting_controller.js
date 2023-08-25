import { Controller } from "@hotwired/stimulus"
import { Sortable } from "sortablejs"

// Connects to data-controller="round-voting"
export default class extends Controller {
    static targets = ['movie']

  connect() {
    console.log("connected");
    Sortable.create(this.element, {
      ghostClass: "ghost",
      animation: 150
      // onEnd: (event) => {
      //   alert(`${event.oldIndex+1} moved to ${event.newIndex+1}`)
      // }
    })
  }

  obtainOrder() {
    console.log(this.movieTarget);
    const finalList = this.movieTarget;
    // console.log(finalList.firstElementChild.dataset.imdbid)
    console.log(finalList.children);
    const tags = Array.from(finalList.children).map(movie => movie.dataset.imdbid)
    console.log(tags);
  }
}
