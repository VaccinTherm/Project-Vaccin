// Modifica o cabeçalho e o logotipo de acordo com a posição do scroll
document.addEventListener('scroll', function () {
  const scrollY = window.scrollY;
  const header = document.getElementById('header');
  const logo = document.getElementById('logo');
  
  if (scrollY >= 25) {
    header.classList.add('scroll');
    logo.setAttribute('src', './assets/images/logo-alt.svg');
  } else {
    header.classList.remove('scroll');
    logo.setAttribute('src', './assets/images/logo.svg');
  }
});

// Função para definir o valor do scroll
function scrollToSection(to) {
  window.scrollTo(0, to);
};

// API - Animação dos elementos ao rolar a página
ScrollReveal({ distance: '60px' });
ScrollReveal().reveal('header', {
  interval: 0,
  duration: 1000,
  reset: true,
  origin: 'top'
});

ScrollReveal().reveal('#introduction', {
  duration: 1000,
  reset: true,
  origin: 'left'
});

ScrollReveal().reveal('#objective', {
  duration: 1000,
  reset: true,
  origin: 'right'
});

ScrollReveal().reveal('#about', {
  duration: 1000,
  reset: true,
  origin: 'left'
});

