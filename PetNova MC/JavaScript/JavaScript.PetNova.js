/* =============================================================================
   PET NOVA – script.js
   -----------------------------------------------------------------------------
   Estructura (mismo orden que la página):

    00. Utilidades
    01. Menú móvil
    02. Aparición al hacer scroll (reveal) + reveal escalonado
    03. Hero: título letra por letra + parallax con el mouse
    04. Decoraciones de "Raised with love"
    05. Funciones: acordeón (hover, teclado, inclinación 3D + foco de luz con el cursor, auto-play)
    06. Tarjetas: brillo que sigue al mouse
    07. Contadores de estadísticas
    08. Pet Map: cambiar de zona
    09. Pet Moments: abanico (flechas, puntos, swipe, auto-play)
    10. FAQ
    11. Formulario de contacto
    12. Scroll: barra de progreso, volver arriba, navbar y parallax
    13. Menú: resaltar la sección actual
    14. Botones: efecto magnético y ripple
    15. Huellas que siguen al cursor
    16. Imágenes y logos con respaldo
    17. Banda de olas con arte real

   Cada bloque va dentro de safe(): si uno falla, los demás siguen funcionando.
   ============================================================================= */
(function () {
  'use strict';

  /* ===========================================================================
     00. UTILIDADES
     =========================================================================== */
  const $ = (sel, ctx) => (ctx || document).querySelector(sel);
  const $$ = (sel, ctx) => Array.from((ctx || document).querySelectorAll(sel));

  const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  const canHover = window.matchMedia('(hover: hover) and (pointer: fine)').matches;
  const hasIO = 'IntersectionObserver' in window;

  const safe = (name, fn) => {
    try { fn(); } catch (err) { console.error('[Pet Nova] "' + name + '" falló:', err); }
  };

  // Referencias que usan varios bloques
  const navWrap = $('.nav-wrap');
  const navLinks = $('#navLinks');


  /* ===========================================================================
     01. MENÚ MÓVIL
     =========================================================================== */
  safe('menu', () => {
    const toggle = $('#menuToggle');
    if (!toggle || !navLinks) return;

    const setOpen = (open) => {
      navLinks.classList.toggle('open', open);
      toggle.setAttribute('aria-expanded', String(open));
      toggle.innerHTML = open ? '&#10005;' : '&#9776;';
    };

    toggle.addEventListener('click', () => setOpen(!navLinks.classList.contains('open')));
    navLinks.querySelectorAll('a').forEach((a) => a.addEventListener('click', () => setOpen(false)));
    document.addEventListener('keydown', (e) => { if (e.key === 'Escape') setOpen(false); });
    document.addEventListener('click', (e) => {
      if (!navLinks.contains(e.target) && !toggle.contains(e.target)) setOpen(false);
    });
  });


  /* ===========================================================================
     02. APARICIÓN AL HACER SCROLL
     =========================================================================== */
  safe('reveal', () => {
    const items = $$('.reveal');

    if (!hasIO) {
      items.forEach((el) => el.classList.add('show'));
      return;
    }

    const observer = new IntersectionObserver((entries) => {
      entries.forEach((e) => {
        if (e.isIntersecting) {
          e.target.classList.add('show');
          observer.unobserve(e.target);
        }
      });
    }, { threshold: 0.15 });

    items.forEach((el) => observer.observe(el));
  });

  // Las tarjetas de cada grid aparecen una tras otra
  safe('reveal-stagger', () => {
    if (!hasIO) return;

    const clearDelay = new IntersectionObserver((entries) => {
      entries.forEach((e) => {
        if (e.isIntersecting) {
          setTimeout(() => (e.target.style.transitionDelay = ''), 1800);
          clearDelay.unobserve(e.target);
        }
      });
    }, { threshold: 0.15 });

    $$('.mvv-grid, .steps-grid, .testi-grid').forEach((grid) => {
      $$('.reveal', grid).forEach((el, i) => {
        el.style.transitionDelay = i * 140 + 'ms';
        clearDelay.observe(el);
      });
    });
  });


  /* ===========================================================================
     03. HERO
     =========================================================================== */
  safe('hero', () => {
    const title = $('.hero h1');
    const hero = $('.hero');
    const content = $('.hero-content');

    // 3.1 Letras que suben una por una
    if (title && !reduceMotion) {
      const text = title.textContent;
      title.setAttribute('aria-label', text.trim());
      title.textContent = '';
      Array.from(text).forEach((ch, i) => {
        const s = document.createElement('span');
        s.textContent = ch;
        s.style.setProperty('--i', i);
        s.setAttribute('aria-hidden', 'true');
        title.appendChild(s);
      });
    }

    // 3.2 El contenido se mueve ligeramente con el mouse
    if (hero && content && canHover && !reduceMotion) {
      hero.addEventListener('mousemove', (e) => {
        const x = e.clientX / window.innerWidth - 0.5;
        const y = e.clientY / window.innerHeight - 0.5;
        content.style.translate = x * -34 + 'px ' + y * -22 + 'px';
      });
      hero.addEventListener('mouseleave', () => (content.style.translate = ''));
    }
  });


  /* ===========================================================================
     04. DECORACIONES DE "RAISED WITH LOVE"
     =========================================================================== */
  safe('raised', () => {
    const section = $('.raised');
    if (!section) return;

    if (!hasIO) { section.classList.add('in'); return; }

    new IntersectionObserver((entries, obs) => {
      if (entries[0].isIntersecting) {
        section.classList.add('in');
        obs.disconnect();
      }
    }, { threshold: 0.15 }).observe(section);
  });


  /* ===========================================================================
     05. FUNCIONES: ACORDEÓN
     =========================================================================== */
  safe('accordion', () => {
    const acc = $('#accordion');
    if (!acc) return;

    const items = $$('.panel', acc);
    if (!items.length) return;

    let hovering = false;
    let inView = false;
    let hoverTimer;
    let current = Math.max(0, items.findIndex((p) => p.classList.contains('active')));

    const setActive = (i) => {
      current = (i + items.length) % items.length;
      items.forEach((p, k) => {
        const on = k === current;
        p.classList.toggle('active', on);
        p.setAttribute('aria-expanded', String(on));
      });
    };

    /* ---- Movimiento que sigue al cursor --------------------------------------
       Al pasar el mouse por un panel pasan 4 cosas a la vez, cada una a distinta
       "profundidad" para que se sienta 3D:
         1. El panel se inclina hacia el cursor (rx / ry).
         2. La foto se desplaza al lado contrario (px / py).
         3. El texto flota en sentido opuesto a la foto (ix / iy).
         4. Un foco de luz sigue al cursor (mx / my / glow) y la sombra se mueve.
       Los valores no saltan: se suavizan frame a frame (lerp) y el bucle se
       detiene solo cuando todo está en reposo.                                   */
    const fx = canHover && !reduceMotion;
    const KEYS = ['px', 'py', 'rx', 'ry', 'ix', 'iy', 'sx', 'sy', 'glow'];
    const UNIT = { px: 'px', py: 'px', rx: 'deg', ry: 'deg', ix: 'px', iy: 'px', sx: 'px', sy: 'px', glow: '' };
    const zero = () => ({ px: 0, py: 0, rx: 0, ry: 0, ix: 0, iy: 0, sx: 0, sy: 0, glow: 0 });
    const clamp = (v, lo, hi) => Math.min(hi, Math.max(lo, v));

    const motion = items.map(() => ({ cur: zero(), tgt: zero() }));
    let raf = null;

    const tick = () => {
      let moving = false;
      items.forEach((p, i) => {
        const m = motion[i];
        KEYS.forEach((k) => {
          const d = m.tgt[k] - m.cur[k];
          if (Math.abs(d) > 0.01) { m.cur[k] += d * 0.12; moving = true; }
          else m.cur[k] = m.tgt[k];
          p.style.setProperty('--' + k, m.cur[k].toFixed(2) + UNIT[k]);
        });
      });
      raf = moving ? requestAnimationFrame(tick) : null;
    };
    const kick = () => { if (!raf) raf = requestAnimationFrame(tick); };

    items.forEach((p, i) => {
      p.tabIndex = 0;
      p.setAttribute('role', 'button');

      // Activar con clic, foco o mouse (con una espera mínima para evitar parpadeos)
      p.addEventListener('click', () => setActive(i));
      p.addEventListener('focus', () => setActive(i));
      p.addEventListener('mouseenter', () => {
        hovering = true;
        clearTimeout(hoverTimer);
        hoverTimer = setTimeout(() => setActive(i), 100);
      });
      p.addEventListener('mouseleave', () => clearTimeout(hoverTimer));

      if (fx) {
        p.addEventListener('pointermove', (e) => {
          if (e.pointerType === 'touch') return;
          const r = p.getBoundingClientRect();
          const nx = clamp((e.clientX - r.left) / r.width - 0.5, -0.5, 0.5);   // -0.5 … 0.5
          const ny = clamp((e.clientY - r.top) / r.height - 0.5, -0.5, 0.5);
          const k = p.classList.contains('active') ? 1 : 0.5;                   // los cerrados se mueven menos
          const t = motion[i].tgt;

          t.ry = nx * 9 * k;     t.rx = -ny * 7 * k;       // inclinación hacia el cursor
          t.px = -nx * 40 * k;   t.py = -ny * 40 * k;      // foto al lado contrario
          t.ix = nx * 18;        t.iy = ny * 12;           // texto flota
          t.sx = -nx * 30 * k;   t.sy = -ny * 20 * k;      // sombra opuesta
          t.glow = 1;

          // El foco de luz sigue al cursor sin retraso
          p.style.setProperty('--mx', e.clientX - r.left + 'px');
          p.style.setProperty('--my', e.clientY - r.top + 'px');
          kick();
        });

        p.addEventListener('pointerleave', () => {
          Object.assign(motion[i].tgt, zero());   // vuelve suavemente al centro
          kick();
        });
      }

      // Teclado
      p.addEventListener('keydown', (e) => {
        if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); setActive(i); }
        if (e.key === 'ArrowRight' || e.key === 'ArrowDown') { e.preventDefault(); setActive(i + 1); items[current].focus(); }
        if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') { e.preventDefault(); setActive(i - 1); items[current].focus(); }
      });
    });

    acc.addEventListener('mouseleave', () => (hovering = false));

    if (hasIO) {
      new IntersectionObserver((es) => (inView = es[0].isIntersecting), { threshold: 0.3 }).observe(acc);
    }

    setActive(current);

    // Si nadie lo toca, sigue avanzando solo (se detiene con el foco del teclado)
    if (!reduceMotion) {
      setInterval(() => {
        const focusInside = acc.contains(document.activeElement);
        if (!hovering && !focusInside && inView && !document.hidden) setActive(current + 1);
      }, 4500);
    }
  });


  /* ===========================================================================
     06. TARJETAS: BRILLO QUE SIGUE AL MOUSE
     =========================================================================== */
  safe('card-glow', () => {
    $$('.mvv-card, .step').forEach((el) => {
      el.addEventListener('mousemove', (e) => {
        const r = el.getBoundingClientRect();
        el.style.setProperty('--x', e.clientX - r.left + 'px');
        el.style.setProperty('--y', e.clientY - r.top + 'px');
      });
    });
  });


  /* ===========================================================================
     07. CONTADORES DE ESTADÍSTICAS
     (el "+" o "%" los pone el CSS con ::after; aquí solo va el número)
     =========================================================================== */
  safe('counters', () => {
    const counters = $$('[data-count]');

    const animateCount = (el) => {
      const target = Number(el.dataset.count);
      if (reduceMotion) { el.textContent = target.toLocaleString('en-US'); return; }

      const start = performance.now();
      const duration = 2000;
      const tick = (now) => {
        const p = Math.min((now - start) / duration, 1);
        el.textContent = Math.floor(p * target).toLocaleString('en-US');
        if (p < 1) requestAnimationFrame(tick);
      };
      requestAnimationFrame(tick);
    };

    if (!hasIO) { counters.forEach(animateCount); return; }

    const counterObserver = new IntersectionObserver((entries) => {
      entries.forEach((e) => {
        if (e.isIntersecting) {
          animateCount(e.target);
          counterObserver.unobserve(e.target);
        }
      });
    }, { threshold: 0.5 });

    counters.forEach((c) => counterObserver.observe(c));
  });


  /* ===========================================================================
     08. PET MAP
     =========================================================================== */
  safe('pet-map', () => {
    const frame = $('#mapFrame');
    const prev = $('#mapPrev');
    const next = $('#mapNext');
    if (!frame || !prev || !next) return;

    const base = 'https://www.openstreetmap.org/export/embed.html?layer=mapnik&bbox=';
    const places = [
      { name: 'Panama City · Vía España', bbox: '-79.5290%2C8.9880%2C-79.5140%2C9.0000' },
      { name: 'La Chorrera',              bbox: '-79.7900%2C8.8740%2C-79.7740%2C8.8870' },
      { name: 'Costa del Este',           bbox: '-79.4720%2C8.9950%2C-79.4560%2C9.0100' }
    ];

    // Etiqueta visible que dice en qué zona estás
    const label = document.createElement('div');
    label.className = 'map-label';
    label.setAttribute('aria-live', 'polite');
    label.textContent = places[0].name;
    frame.parentNode.appendChild(label);

    let m = 0;
    const goMap = (dir) => {
      m = (m + dir + places.length) % places.length;
      frame.src = base + places[m].bbox;
      frame.title = 'Pet Map – ' + places[m].name;
      label.textContent = places[m].name;
    };

    next.addEventListener('click', () => goMap(1));
    prev.addEventListener('click', () => goMap(-1));
  });


  /* ===========================================================================
     09. PET MOMENTS: ABANICO
     =========================================================================== */
  safe('fan', () => {
    const fan = $('#fan');
    const dotsBox = $('#dots');
    const fanPrev = $('#fanPrev');
    const fanNext = $('#fanNext');
    if (!fan || !dotsBox) return;

    const cards = $$('figure', fan);
    if (!cards.length) return;

    const total = cards.length;
    const half = Math.floor(total / 2);
    let active = half;
    let timer = null;
    let paused = false;
    let swiped = false;

    // Puntos (accesibles con teclado)
    const dots = cards.map((_, i) => {
      const dot = document.createElement('span');
      dot.setAttribute('role', 'button');
      dot.tabIndex = 0;
      dot.setAttribute('aria-label', 'Show photo ' + (i + 1));
      dot.addEventListener('click', () => { go(i); resetAuto(); });
      dot.addEventListener('keydown', (e) => {
        if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); go(i); resetAuto(); }
      });
      dotsBox.appendChild(dot);
      return dot;
    });

    function render() {
      const spacing = window.innerWidth < 900 ? 90 : 165;

      cards.forEach((card, i) => {
        // Posición circular para que el abanico dé la vuelta
        let offset = (((i - active) % total) + total) % total;
        if (offset > half) offset -= total;

        const abs = Math.abs(offset);
        const x = offset * spacing;
        const y = abs * abs * 10;
        const rot = offset * 9;
        const scale = offset === 0 ? 1.05 : 1 - abs * 0.04;

        // La foto que "da la vuelta" por detrás salta sin cruzar todo el abanico
        const jump = card._offset !== undefined && Math.abs(offset - card._offset) > half;
        if (jump) card.style.transition = 'none';

        card.style.transform = 'translate(' + x + 'px, ' + y + 'px) rotate(' + rot + 'deg) scale(' + scale + ')';
        card.style.zIndex = 10 - abs;
        card.style.opacity = abs > 3 ? 0 : 1;
        card._offset = offset;

        if (jump) { void card.offsetWidth; card.style.transition = ''; }
      });

      dots.forEach((d, i) => {
        d.classList.toggle('on', i === active);
        d.setAttribute('aria-current', String(i === active));
      });
    }

    function go(i) { active = ((i % total) + total) % total; render(); }
    const next = () => go(active + 1);
    const prev = () => go(active - 1);

    // Auto-play: se pausa con el mouse, con el foco y si la pestaña está oculta
    const startAuto = () => {
      if (reduceMotion) return;
      clearInterval(timer);
      timer = setInterval(() => { if (!paused && !document.hidden) next(); }, 3500);
    };
    const resetAuto = () => { clearInterval(timer); startAuto(); };

    if (fanNext) fanNext.addEventListener('click', () => { next(); resetAuto(); });
    if (fanPrev) fanPrev.addEventListener('click', () => { prev(); resetAuto(); });
    cards.forEach((c, i) => c.addEventListener('click', () => { if (!swiped) { go(i); resetAuto(); } }));

    fan.addEventListener('mouseenter', () => (paused = true));
    fan.addEventListener('mouseleave', () => (paused = false));
    fan.addEventListener('focusin', () => (paused = true));
    fan.addEventListener('focusout', () => (paused = false));

    // Teclado
    fan.tabIndex = 0;
    fan.setAttribute('role', 'group');
    fan.setAttribute('aria-label', 'Pet photos');
    fan.addEventListener('keydown', (e) => {
      if (e.key === 'ArrowLeft') { e.preventDefault(); prev(); resetAuto(); }
      if (e.key === 'ArrowRight') { e.preventDefault(); next(); resetAuto(); }
    });

    // Deslizar con el dedo o arrastrar con el mouse
    let startX = null;
    fan.addEventListener('pointerdown', (e) => (startX = e.clientX));
    window.addEventListener('pointerup', (e) => {
      if (startX === null) return;
      const dx = e.clientX - startX;
      startX = null;
      if (Math.abs(dx) > 50) {
        swiped = true;
        if (dx < 0) next(); else prev();
        resetAuto();
        setTimeout(() => { swiped = false; }, 60);
      }
    });

    // Recalcular separación al cambiar el tamaño de la ventana
    let resizeTimer;
    window.addEventListener('resize', () => {
      clearTimeout(resizeTimer);
      resizeTimer = setTimeout(render, 120);
    });

    render();
    startAuto();
  });


  /* ===========================================================================
     10. FAQ
     =========================================================================== */
  safe('faq', () => {
    const faqItems = $$('.faq-item');
    if (!faqItems.length) return;

    const setFaq = (item, open) => {
      const answer = $('.faq-a', item);
      const btn = $('.faq-q', item);
      item.classList.toggle('open', open);
      answer.style.maxHeight = open ? answer.scrollHeight + 'px' : '0px';
      if (btn) btn.setAttribute('aria-expanded', String(open));
    };

    faqItems.forEach((item, i) => {
      const btn = $('.faq-q', item);
      const answer = $('.faq-a', item);
      if (!btn || !answer) return;

      answer.id = 'faq-a-' + i;
      btn.setAttribute('aria-controls', answer.id);
      const icon = $('span', btn);
      if (icon) icon.setAttribute('aria-hidden', 'true');

      setFaq(item, item.classList.contains('open'));

      btn.addEventListener('click', () => {
        const willOpen = !item.classList.contains('open');
        faqItems.forEach((other) => setFaq(other, false));
        setFaq(item, willOpen);
      });
    });

    // Si cambia el ancho, el texto cambia de altura: recalcular la respuesta abierta
    window.addEventListener('resize', () => {
      faqItems.forEach((item) => {
        if (item.classList.contains('open')) {
          const answer = $('.faq-a', item);
          answer.style.maxHeight = answer.scrollHeight + 'px';
        }
      });
    });
  });


  /* ===========================================================================
     11. FORMULARIO DE CONTACTO (solo front-end)
     =========================================================================== */
  safe('contact-form', () => {
    const form = $('#contactForm');
    const ok = $('#formOk');
    if (!form || !ok) return;

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      // TODO: aquí conecta tu servicio real (Formspree, EmailJS, tu backend…)
      ok.classList.add('show');
      form.reset();
      setTimeout(() => ok.classList.remove('show'), 5000);
    });
  });


  /* ===========================================================================
     12. SCROLL: PROGRESO, VOLVER ARRIBA, NAVBAR Y PARALLAX
     =========================================================================== */
  safe('scroll', () => {
    // Barra de progreso
    const progressBar = document.createElement('div');
    progressBar.className = 'scroll-progress';
    progressBar.setAttribute('aria-hidden', 'true');
    document.body.appendChild(progressBar);

    // Botón "volver arriba" (huella)
    const toTop = document.createElement('button');
    toTop.type = 'button';
    toTop.className = 'to-top';
    toTop.setAttribute('aria-label', 'Back to top');
    toTop.innerHTML = '<svg viewBox="0 0 100 100" aria-hidden="true"><use href="#paw"/></svg>';
    toTop.addEventListener('click', () =>
      window.scrollTo({ top: 0, behavior: reduceMotion ? 'auto' : 'smooth' }));
    document.body.appendChild(toTop);

    // Elementos con parallax
    const parallaxItems = [
      ['.flower-1', -0.08],
      ['.flower-2', 0.1],
      ['.blob-left', 0.12],
      ['.blob-right', -0.1]
    ]
      .map(([sel, speed]) => ({ el: $(sel), speed }))
      .filter((p) => p.el);

    let lastY = window.scrollY;
    let ticking = false;
    let lockHide = false;

    // Al pulsar un enlace del menú, la barra no se oculta mientras se desplaza
    $$('.nav-links a, .brand').forEach((a) => {
      a.addEventListener('click', () => {
        lockHide = true;
        if (navWrap) navWrap.classList.remove('hide');
        setTimeout(() => (lockHide = false), 1500);
      });
    });

    const onScroll = () => {
      const y = window.scrollY;
      const max = document.documentElement.scrollHeight - window.innerHeight;
      progressBar.style.width = (max > 0 ? (y / max) * 100 : 0) + '%';
      toTop.classList.toggle('show', y > 600);

      // Estas clases se conservan; el CSS las neutraliza porque la barra no es fija
      if (navWrap) {
        const menuOpen = navLinks && navLinks.classList.contains('open');
        navWrap.classList.toggle('scrolled', y > 60);
        navWrap.classList.toggle('hide', y > lastY && y > 300 && !menuOpen && !lockHide);
      }
      lastY = y;

      if (!reduceMotion) {
        parallaxItems.forEach(({ el, speed }) => {
          const r = el.parentElement.getBoundingClientRect();
          const offset = (r.top + r.height / 2 - window.innerHeight / 2) * speed;
          el.style.translate = '0 ' + offset + 'px';
        });
      }
      ticking = false;
    };

    window.addEventListener('scroll', () => {
      if (!ticking) { requestAnimationFrame(onScroll); ticking = true; }
    }, { passive: true });
    onScroll();
  });


  /* ===========================================================================
     13. MENÚ: RESALTAR LA SECCIÓN ACTUAL
     =========================================================================== */
  safe('menu-spy', () => {
    if (!hasIO) return;
    const menuLinks = $$('.nav-links a');

    const spy = new IntersectionObserver((entries) => {
      entries.forEach((e) => {
        if (!e.isIntersecting) return;
        menuLinks.forEach((a) => {
          const on = a.getAttribute('href') === '#' + e.target.id;
          a.classList.toggle('active', on);
          if (on) a.setAttribute('aria-current', 'true');
          else a.removeAttribute('aria-current');
        });
      });
    }, { rootMargin: '-45% 0px -50% 0px' });

    ['home', 'about', 'functions', 'contact', 'privacy'].forEach((id) => {
      const s = document.getElementById(id);
      if (s) spy.observe(s);
    });
  });


  /* ===========================================================================
     14. BOTONES: EFECTO MAGNÉTICO Y RIPPLE
     =========================================================================== */
  safe('buttons', () => {
    // Magnético
    if (canHover && !reduceMotion) {
      $$('.btn-cta, .login, .circle').forEach((el) => {
        el.addEventListener('mousemove', (e) => {
          const r = el.getBoundingClientRect();
          const dx = (e.clientX - r.left - r.width / 2) * 0.25;
          const dy = (e.clientY - r.top - r.height / 2) * 0.25;
          el.style.translate = dx + 'px ' + dy + 'px';
        });
        el.addEventListener('mouseleave', () => (el.style.translate = ''));
      });
    }

    // Ripple al hacer clic
    $$('.btn-cta, .contact-form button').forEach((btn) => {
      btn.addEventListener('click', (e) => {
        const r = btn.getBoundingClientRect();
        const s = document.createElement('span');
        s.className = 'ripple';
        s.style.left = e.clientX - r.left + 'px';
        s.style.top = e.clientY - r.top + 'px';
        btn.appendChild(s);
        setTimeout(() => s.remove(), 700);
      });
    });
  });


  /* ===========================================================================
     15. HUELLAS QUE SIGUEN AL CURSOR
     =========================================================================== */
  safe('paw-prints', () => {
    if (!canHover || reduceMotion) return;

    let lastX = 0;
    let lastPawY = 0;
    let left = false;

    document.addEventListener('mousemove', (e) => {
      const dx = e.clientX - lastX;
      const dy = e.clientY - lastPawY;
      if (Math.hypot(dx, dy) < 80) return;

      const angle = (Math.atan2(dy, dx) * 180) / Math.PI + 90;
      lastX = e.clientX;
      lastPawY = e.clientY;
      left = !left;

      const print = document.createElement('div');
      print.className = 'paw-print';
      print.setAttribute('aria-hidden', 'true');
      print.style.left = e.clientX + (left ? -10 : 10) + 'px';
      print.style.top = e.clientY + 'px';
      print.style.setProperty('--rot', angle + 'deg');
      print.innerHTML = '<svg viewBox="0 0 100 100"><use href="#paw"/></svg>';
      document.body.appendChild(print);
      setTimeout(() => print.remove(), 1400);
    });
  });


  /* ===========================================================================
     16. IMÁGENES Y LOGOS CON RESPALDO
     =========================================================================== */
  safe('fallbacks', () => {
    // Fotos del abanico: si img/petN.jpg no existe, usa la foto de respaldo
    $$('img[data-fallback]').forEach((img) => {
      const useBackup = () => {
        const fb = img.dataset.fallback;
        if (!fb) return;
        delete img.dataset.fallback;
        img.src = fb;
      };
      img.addEventListener('error', useBackup, { once: true });
      if (img.complete && img.naturalWidth === 0) useBackup();
    });

    // Logos: si img/logo.png no existe, se muestra el logo de texto
    $$('.brand-logo, .footer-logo-img').forEach((img) => {
      const holder = img.closest('.brand, .footer-logo');
      const showText = () => holder && holder.classList.add('no-logo');
      img.addEventListener('error', showText, { once: true });
      if (img.complete && img.naturalWidth === 0) showText();
    });
  });


  /* ===========================================================================
     17. BANDA DE OLAS CON ARTE REAL (solo si la imagen carga)
     =========================================================================== */
  safe('waves', () => {
    const url = 'https://static.wixstatic.com/media/11062b_010acd29e7244c6cb351a4b9b8fdf2f5~mv2.png';
    const bands = $$('.waves');
    if (!bands.length) return;

    const art = new Image();
    art.onload = () => {
      bands.forEach((band) => {
        band.style.setProperty('--wave-img', "url('" + url + "')");
        band.classList.add('img-ok');
      });
    };
    art.src = url;
  });


  // Avisa al respaldo del HTML de que este archivo cargó bien
  window.__petnovaOK = true;
})();