
const nav     = document.getElementById('nav');
const burger  = document.getElementById('navBurger');
const mobileMenu = document.getElementById('mobileMenu');


window.addEventListener('scroll', () => {
  nav.classList.toggle('scrolled', window.scrollY > 40);
});


burger?.addEventListener('click', () => {
  burger.classList.toggle('open');
  mobileMenu.classList.toggle('open');
  document.body.style.overflow = mobileMenu.classList.contains('open') ? 'hidden' : '';
});


document.querySelectorAll('#mobileMenu a').forEach(link => {
  link.addEventListener('click', () => {
    burger.classList.remove('open');
    mobileMenu.classList.remove('open');
    document.body.style.overflow = '';
  });
});


const currentPage = location.pathname.split('/').pop() || 'index.html';
document.querySelectorAll('.nav__links a, #mobileMenu a').forEach(a => {
  if (a.getAttribute('href') === currentPage) a.classList.add('active');
});


const observer = new IntersectionObserver((entries) => {
  entries.forEach(e => {
    if (e.isIntersecting) {
      e.target.classList.add('visible');
      observer.unobserve(e.target);
    }
  });
}, { threshold: 0.12 });

document.querySelectorAll('.fade-up, .timeline-item').forEach(el => observer.observe(el));


const lightbox   = document.getElementById('lightbox');
const lbImg      = document.getElementById('lbImg');
const lbClose    = document.getElementById('lbClose');
const lbPrev     = document.getElementById('lbPrev');
const lbNext     = document.getElementById('lbNext');
let   lbImages   = [];
let   lbIndex    = 0;

function openLightbox(src, arr, idx) {
  if (!lightbox) return;
  lbImages = arr;
  lbIndex  = idx;
  lbImg.src = src;
  lightbox.classList.add('open');
  document.body.style.overflow = 'hidden';
}

function closeLightbox() {
  lightbox?.classList.remove('open');
  document.body.style.overflow = '';
}

function lbNavigate(dir) {
  lbIndex = (lbIndex + dir + lbImages.length) % lbImages.length;
  lbImg.style.opacity = '0';
  setTimeout(() => {
    lbImg.src = lbImages[lbIndex];
    lbImg.style.opacity = '1';
  }, 150);
}

lbClose?.addEventListener('click', closeLightbox);
lbPrev?.addEventListener('click',  () => lbNavigate(-1));
lbNext?.addEventListener('click',  () => lbNavigate(1));
lightbox?.addEventListener('click', e => { if (e.target === lightbox) closeLightbox(); });

document.addEventListener('keydown', e => {
  if (!lightbox?.classList.contains('open')) return;
  if (e.key === 'Escape')    closeLightbox();
  if (e.key === 'ArrowLeft') lbNavigate(-1);
  if (e.key === 'ArrowRight')lbNavigate(1);
});

// Attach gallery items
const galleryItems = document.querySelectorAll('.gallery-item');
const galleryImgs  = Array.from(galleryItems).map(item => item.querySelector('img')?.src);

galleryItems.forEach((item, idx) => {
  item.addEventListener('click', () => {
    openLightbox(galleryImgs[idx], galleryImgs, idx);
  });
  item.setAttribute('tabindex', '0');
  item.setAttribute('role', 'button');
  item.setAttribute('aria-label', 'Agrandir la photo');
  item.addEventListener('keydown', e => { if (e.key === 'Enter') item.click(); });
});


function animateCounter(el) {
  const target = +el.dataset.target;
  const duration = 1800;
  const step = target / (duration / 16);
  let current = 0;
  const tick = () => {
    current = Math.min(current + step, target);
    el.textContent = Math.floor(current) + (el.dataset.suffix || '');
    if (current < target) requestAnimationFrame(tick);
  };
  requestAnimationFrame(tick);
}

const counters = document.querySelectorAll('[data-target]');
if (counters.length) {
  const counterObs = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        animateCounter(e.target);
        counterObs.unobserve(e.target);
      }
    });
  }, { threshold: 0.5 });
  counters.forEach(c => counterObs.observe(c));
}


document.querySelectorAll('.tab-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
    btn.classList.add('active');
    document.getElementById(btn.dataset.tab)?.classList.add('active');
  });
});


const contactForm = document.getElementById('contactForm');
contactForm?.addEventListener('submit', e => {
  e.preventDefault();
  let valid = true;

  // Validate each required field
  contactForm.querySelectorAll('[required]').forEach(field => {
    const group = field.closest('.form-group');
    const empty = !field.value.trim();
    const emailInvalid = field.type === 'email' && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(field.value.trim());
    if (empty || emailInvalid) {
      group.classList.add('has-error');
      valid = false;
    } else {
      group.classList.remove('has-error');
    }
  });

  if (valid) {
    const btn = contactForm.querySelector('button[type="submit"]');
    btn.textContent = 'Envoi en cours…';
    btn.disabled = true;
    // Simulate async send (replace with real endpoint)
    setTimeout(() => {
      contactForm.style.display = 'none';
      document.getElementById('formSuccess').style.display = 'block';
    }, 1200);
  }
});

// Remove error on input
contactForm?.querySelectorAll('input, textarea').forEach(el => {
  el.addEventListener('input', () => el.closest('.form-group')?.classList.remove('has-error'));
});


document.querySelectorAll('.filter-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    const filter = btn.dataset.filter;
    document.querySelectorAll('.gallery-item').forEach(item => {
      if (filter === 'all' || item.dataset.category === filter) {
        item.style.display = '';
        item.style.opacity = '1';
      } else {
        item.style.display = 'none';
      }
    });
  });
});


document.querySelectorAll('.stagger-children > *').forEach((child, i) => {
  child.style.animationDelay = `${i * 0.1}s`;
  child.classList.add('fade-up');
  observer.observe(child);
});


function loadVideo(wrapper) {
      const card    = wrapper.closest('[data-video-id]');
      const videoId = card?.dataset?.videoId;
      if (!videoId) return;

      const iframe           = document.createElement('iframe');
      iframe.src             = `https://www.youtube-nocookie.com/embed/${videoId}?autoplay=1&rel=0&modestbranding=1`;
      iframe.allow           = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share';
      iframe.allowFullscreen = true;
      iframe.title           = card.querySelector('h3')?.textContent || 'Vidéo OHB';

      wrapper.innerHTML      = '';
      wrapper.appendChild(iframe);
      wrapper.style.cursor   = 'default';
      wrapper.onclick        = null;
}