import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'content', 'table']

  connect() {
    console.log(this.tableTarget)
    this.tableTarget.classList.remove('hidden-admin-table')
    document.getElementById('default-active').classList.add('active');
  }

  display() {
    event.preventDefault();
    console.log(event.target)

    const buttons = document.querySelectorAll('.list-group-item')
    buttons.forEach(button => {
      if (button.classList.contains('active')) {
        button.classList.remove('active');
      }
    });

    event.target.classList.add('active');
    
    this.tableTargets.forEach(table => {
      if (!table.classList.contains('hidden-admin-table')) {
        table.classList.add('hidden-admin-table');
      }
    })
    const table = document.getElementById(event.target.dataset.id)
    table.classList.remove('hidden-admin-table');
  }

  // test qui ne fonctionne pas mais que je veux bien garder pour y retravailler plus tard si possible !
  // show() {
  //   event.preventDefault();
  //   fetch('/banners', { headers: { accept: "application/json" } })
  //     .then(response => response.json())
  //     .then((data) => {
  //       console.log(data);
  //       this.contentTarget.innerHTML = `<%= j render partial: 'shared/banners_row', locals: {all_banners: ${data}} %>`
  //     });

  // }

}