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
  static targets = ['row']
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

    const ajax = () => {
      Rails.ajax({
        type: 'patch',
        url: this.data.get('url').replace(":id", id),
        data: data
      })
    }

    const fetchFunction = () => {
      // on recup l'url de type /banners
      const url = this.data.get('url').replace(":id/move","");
      fetch(url, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        // on récupère l'élément sens les "/" : banners
        data[url.split("/").join("")].forEach(element => {
          const row = this.rowTargets.find(row => row.dataset.id == element.id)
          row.getElementsByTagName('th')[0].innerHTML = element.position
        })
      });
    }
    ajax();
    // c'est assez peu robuste... pas grave on fait avec
    setTimeout(fetchFunction, 1000)
  }

}
