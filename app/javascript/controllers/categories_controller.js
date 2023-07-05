import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const search = document.querySelector('.search');


    search.addEventListener('click', function() {
      const names = document.querySelectorAll('.category-name-name');
      const searchInput = document.querySelector('.search-input');
      searchInput.classList.toggle('search-input-visible')
      searchInput.addEventListener('keyup', function() {
        names.forEach(name => {
          if (!name.textContent.toLocaleLowerCase().includes(searchInput.value.toLowerCase())) {
            name.parentElement.parentElement.parentElement.parentElement.classList.add('not-show');
          }
        })
        if (searchInput.value === '') {
          names.forEach(name => {
            name.parentElement.parentElement.parentElement.parentElement.classList.remove('not-show');
          })
        }
      })
    });
  }
}

