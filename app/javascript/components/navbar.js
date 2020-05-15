// app/javascript/components/navbar.js
const initUpdateNavbarOnScroll = () => {
  const navbar = document.getElementById('custom-navbar');
  const container = document.querySelector('.home-banner');
  const searchbar = document.getElementById('search-container');

  document.addEventListener('wheel', () => {
    let rect = container.getBoundingClientRect()
    console.log(rect.y);

    if (rect.y < -(window.innerHeight)) {
      searchbar.classList.remove("d-none");
      navbar.classList.add("navbar-white");
    } else {
      searchbar.classList.add("d-none");
      navbar.classList.remove("navbar-white");
    }
  })
}


export { initUpdateNavbarOnScroll };
