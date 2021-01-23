// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Sortable from "sortablejs"
import Rails from '@rails/ujs';

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      ghostClass: "ghost",
      animation: 150,
      onEnd: this.end.bind(this)
    })
  }
  end(event) {
    let id = event.item.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)

    Rails.ajax({
      type: 'patch',
      url: this.data.get('url').replace(":id", id),
      data: data
    })


    // fetch('/banners', { headers: { accept: "application/json" } })
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data);
    //   });
  }
  
}
