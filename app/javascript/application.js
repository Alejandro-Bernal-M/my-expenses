// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener('turbo:load', function() {
  // Select the notice element
  const popup = document.querySelector('.popup');
  const menu = document.querySelector('.menu');
  const closeMenu = document.querySelector('.close-popup');
  const noticeElement = document.querySelector('.notice');
  const alertElement = document.querySelector('.alert');
  
  // Check if the notice element exists
  if (noticeElement) {
    // Set a timer to hide the notice after 5 seconds (5000 milliseconds)
    setTimeout(function() {
      noticeElement.style.display = 'none';
    }, 3000);
  }

  // Check if the alert element exists
  if (alertElement) {
    // Set a timer to hide the alert after 5 seconds (5000 milliseconds)
    setTimeout(function() {
      alertElement.style.display = 'none';
    }, 3000);
  }

  if (menu) {
    menu.addEventListener('click', function() {
      popup.classList.add('visible');
    });
  }
  
  if (closeMenu) {
    closeMenu.addEventListener('click', function() {
      popup.classList.remove('visible');
    });
  }
});

