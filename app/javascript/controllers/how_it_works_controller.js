import { Controller } from "@hotwired/stimulus"
import { Sortable } from "sortablejs"


export default class extends Controller {

  connect() {
    console.log("works connected");
    // console.log(this.element);
    Sortable.create(this.element, {
      ghostClass: "ghost",
      animation: 150
      // onEnd: (event) => {
      //   alert(`${event.oldIndex+1} moved to ${event.newIndex+1}`)
      // }
    })
  }
}
