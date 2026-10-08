:root {
  --purple: #8567d9;
  --dark: #524078;
  --deep: #4a2c8f;
  --cyan: #0bc1e0;
  --cyan-light: #28c8e6;
  --maroon: #5c0a2a;
}

* { box-sizing: border-box; margin: 0; padding: 0; }
html { scroll-behavior: smooth; }
body { font-family: 'Nunito', Arial, sans-serif; color: #222; overflow-x: hidden; background: #fff; }
img { max-width: 100%; display: block; }
a { color: inherit; text-decoration: none; }
section { position: relative; }

/* ===== NAVBAR ===== */
.nav-wrap { position: fixed; top: 0; left: 0; right: 0; z-index: 50; padding: 36px 38px 0; }
.navbar {
  background: #fff; border-radius: 40px; height: 88px; padding: 0 30px;
  display: flex; align-items: center; justify-content: space-between; gap: 20px;
  box-shadow: 0 0 40px rgba(133, 103, 217, .55);
}
.brand { display: flex; align-items: center; gap: 8px; color: var(--deep); }
.brand-dog, .footer-logo svg { fill: none; stroke: #8f7bb8; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }
.brand-dog { width: 64px; height: 64px; }
.brand-text { display: flex; flex-direction: column; line-height: 1; }
.brand-text b { font-family: 'Archivo Black', sans-serif; font-size: 1.5rem; color: #4a2c8f; }
.brand-text small { font-size: .6rem; font-weight: 700; margin-top: 4px; }

.nav-links { display: flex; gap: 34px; list-style: none; }
.nav-links a { display: flex; align-items: center; gap: 10px; font-weight: 700; font-size: 1.2rem; color: #3d3d5c; transition: color .3s, transform .3s; }
.nav-links a:hover { color: var(--purple); transform: translateY(-2px); }
.nav-links svg { width: 32px; height: 32px; fill: none; stroke: currentColor; stroke-width: 1.8; stroke-linejoin: round; stroke-linecap: round; }

.login { display: flex; align-items: center; gap: 14px; text-decoration: underline; color: #4a3b78; font-size: 1.15rem; }
.login i { width: 44px; height: 44px; border-radius: 50%; background: #54387f; transition: transform .3s; }
.login:hover i { transform: scale(1.15); }
.menu-toggle { display: none; background: none; border: none; font-size: 2rem; color: var(--deep); cursor: pointer; }

/* ===== HERO ===== */
.hero {
  min-height: 100vh; display: flex; align-items: flex-end; padding: 0 80px 70px;
  background:
    linear-gradient(rgba(90, 50, 150, .35), rgba(35, 15, 55, .6)),
    url('https://static.wixstatic.com/media/84770f_9ed1787e51b2400aa73151c1674b8a4e~mv2.jpg/v1/fill/w_1600,h_900,al_c,q_85/hero.jpg') center / cover,
    url('https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=1600&auto=format&fit=crop&q=80') center / cover;
  animation: heroZoom 18s ease-in-out infinite alternate;
  background-size: cover;
}
@keyframes heroZoom { from { background-position: 50% 50%; } to { background-position: 55% 45%; } }
.hero-content { color: #fff; max-width: 920px; }
.paw { fill: var(--maroon); stroke: #5a4aa8; stroke-width: 6; paint-order: stroke; }
.paw-hero { width: 140px; height: 140px; margin-left: 260px; margin-bottom: -50px; animation: wiggle 3s ease-in-out infinite; }
.hero h1 { font-family: 'Poppins', sans-serif; font-weight: 800; font-size: clamp(5rem, 14vw, 12.5rem); line-height: 1; letter-spacing: -4px; }
.hero p { font-size: 1.6rem; line-height: 1.5; text-align: justify; max-width: 900px; margin-top: 30px; font-weight: 400; }

/* ===== RAISED WITH LOVE ===== */
.raised { background: #fff; min-height: 920px; padding: 150px 20px 100px; text-align: center; overflow: hidden; }
.raised h2 { font-family: 'Poppins', sans-serif; font-weight: 800; color: var(--cyan); font-size: clamp(2.6rem, 6.5vw, 6rem); line-height: 1.15; letter-spacing: -2px; max-width: 1150px; margin: 0 auto; position: relative; z-index: 2; }
.note {
  position: relative; z-index: 2; max-width: 800px; margin: 90px auto 0;
  background: #8567d9; color: #fff; padding: 36px 40px; border-radius: 12px;
  transform: rotate(2deg); font-size: 1.6rem; line-height: 1.5; text-align: justify;
}
.note::before, .note::after {
  content: ''; position: absolute; top: 0; bottom: 0; width: 28px;
  background: radial-gradient(circle at 50% 50%, #8567d9 13px, transparent 14px) 0 0 / 28px 52px repeat-y;
}
.note::before { left: -14px; }
.note::after { right: -14px; }
.paw-note { position: absolute; width: 90px; height: 90px; top: -50px; right: -30px; fill: var(--maroon); stroke: #9fd0f2; stroke-width: 8; transform: rotate(8deg); }

.blob {
  position: absolute; width: 340px; height: 420px; background: var(--cyan); z-index: 1;
  border-radius: 60% 40% 50% 70% / 60% 50% 50% 40;
}
.blob::after {
  content: ''; position: absolute; inset: 0; border-radius: inherit;
  background: radial-gradient(circle, #5b3fd0 10px, transparent 11px) 0 0 / 38px 38px;
  -webkit-mask-image: linear-gradient(135deg, #000 0%, transparent 65%);
          mask-image: linear-gradient(135deg, #000 0%, transparent 65%);
}
.blob-left { left: -90px; top: 110px; animation: drift 9s ease-in-out infinite alternate; }
.blob-right { right: -120px; bottom: 60px; transform: scaleX(-1); animation: drift2 10s ease-in-out infinite alternate; }

.flower { position: absolute; width: 300px; z-index: 1; animation: spin 25s linear infinite; }
.flower-1 { right: -20px; top: 70px; width: 320px; }
.flower-2 { left: 90px; bottom: 150px; width: 300px; animation-direction: reverse; }

/* ===== FEATURES ===== */
.features { background: var(--purple); padding: 60px 56px 80px; }
.features::before { content: ''; position: absolute; inset: 0 0 auto 0; height: 160px; background: linear-gradient(#cfc6ea, transparent); }
.features-head {
  position: relative; background: var(--dark); color: #fff; border-radius: 55px;
  padding: 34px 36px 50px; box-shadow: 0 20px 40px rgba(0, 0, 0, .25); margin-bottom: 90px;
}
.features-head h2 { font-size: clamp(2rem, 4.8vw, 4.3rem); font-weight: 800; line-height: 1.15; letter-spacing: -1px; }
.features-head p { font-size: 1.15rem; margin-top: 16px; }

.accordion { display: flex; gap: 12px; height: 560px; max-width: 1760px; margin: 0 auto; }
.panel {
  position: relative; flex: 1; border-radius: 18px; overflow: hidden; cursor: pointer;
  background: linear-gradient(rgba(60, 40, 120, .55), rgba(10, 5, 30, .8)), var(--img) center / cover;
  border: 1px solid rgba(255, 255, 255, .25);
  transition: flex .7s cubic-bezier(.2, .8, .2, 1);
}
.panel.active { flex: 6; cursor: default; }
.label {
  position: absolute; bottom: 140px; left: 50%; writing-mode: vertical-rl; transform: translateX(-50%);
  font-family: Arial, sans-serif; font-weight: 800; letter-spacing: 1px; text-transform: uppercase; color: #e9e3f7; font-size: 1.2rem;
  transition: opacity .3s;
}
.panel.active .label { opacity: 0; }
.panel-info {
  position: absolute; left: 24px; bottom: 24px; max-width: 480px; color: #fff; font-family: Arial, sans-serif;
  opacity: 0; transform: translateY(20px); transition: opacity .5s .2s, transform .5s .2s;
}
.panel.active .panel-info { opacity: 1; transform: none; }
.panel-info svg { width: 34px; height: 34px; fill: none; stroke: var(--cyan); stroke-width: 2; margin-bottom: 10px; }
.panel-info h3 { font-size: 2rem; font-weight: 900; margin-bottom: 10px; }
.panel-info p { font-size: 1.15rem; line-height: 1.4; }

/* ===== PET MAP ===== */
.connect { background: linear-gradient(var(--cyan-light), var(--cyan)); padding: 100px 52px 0; text-align: center; overflow: hidden; }
.connect::before { content: ''; position: absolute; inset: 0 0 auto 0; height: 100px; background: linear-gradient(#5b9be0, transparent); opacity: .5; }
.connect h2 { position: relative; font-family: 'Poppins', sans-serif; font-weight: 800; color: #fff; font-size: clamp(2.4rem, 5.6vw, 5.2rem); line-height: 1.15; letter-spacing: -2px; max-width: 1200px; margin: 0 auto 70px; }
.map-card {
  position: relative; background: var(--cyan); border-radius: 22px; padding: 24px 24px 24px;
  display: flex; flex-direction: column; text-align: left; box-shadow: 0 10px 30px rgba(0, 0, 0, .15);
}
.map-text { max-width: 980px; font-family: 'Poppins', sans-serif; color: #524078; }
.map-text h3 { font-size: clamp(3rem, 6vw, 5.4rem); font-weight: 600; line-height: 1.1; }
.map-text p { font-size: clamp(1.1rem, 2.2vw, 2rem); line-height: 1.4; font-weight: 300; margin-top: 6px; }
.map-box { position: relative; margin-top: 40px; height: 690px; overflow: visible; }
.map-box iframe { width: 100%; height: 100%; border: 0; display: block; }
.circle {
  position: absolute; bottom: -30px; width: 68px; height: 68px; border-radius: 50%; border: none;
  background: #fff; font-size: 2rem; color: #555; cursor: pointer; box-shadow: 0 4px 14px rgba(0, 0, 0, .25); transition: transform .3s;
}
.circle:hover { transform: scale(1.12); }
.circle.prev { left: -40px; }
.circle.next { left: 60px; }

.waves {
  height: 130px; margin: 80px -52px 0; position: relative;
  background: repeating-linear-gradient(100deg, #8567d9 0 3px, var(--cyan) 3px 9px);
  clip-path: polygon(0 55%, 8% 40%, 16% 62%, 25% 35%, 33% 55%, 41% 30%, 50% 5%, 58% 48%, 66% 36%, 75% 58%, 84% 30%, 92% 50%, 100% 38%, 100% 100%, 0 100%);
  background-size: 200% 100%; animation: waveMove 14s linear infinite;
}

/* ===== PET MOMENTS ===== */
.moments {
  min-height: 1000px; text-align: center; overflow: hidden; padding: 170px 20px 80px;
  background: linear-gradient(rgba(74, 44, 143, .35), rgba(30, 15, 50, .65)),
    url('https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=1600&auto=format&fit=crop&q=80') center / cover;
}
.waves-top { position: absolute; top: 0; left: 0; right: 0; margin: 0; transform: scaleY(-1); background-color: #8567d9; }
.moments-text { position: relative; max-width: 1200px; margin: 0 auto; }
.moments h2 { font-family: 'Poppins', sans-serif; font-weight: 800; color: var(--cyan); font-size: clamp(4rem, 11vw, 10rem); letter-spacing: -6px; line-height: 1; }
.moments-text p { color: #fff; font-family: 'Poppins', sans-serif; font-weight: 300; font-size: 1.8rem; line-height: 1.4; max-width: 1150px; margin: 24px auto 0; text-align: justify; padding: 0 20px; }

.fan { position: relative; height: 480px; margin-top: 140px; }
.fan figure {
  position: absolute; left: 50%; top: 0; width: 290px; height: 410px; border-radius: 26px; overflow: hidden; margin-left: -145px;
  background: var(--bg); box-shadow: 0 10px 28px rgba(0, 0, 0, .3);
  transition: transform .8s cubic-bezier(.2, .8, .2, 1), opacity .5s;
}
.fan img { width: 100%; height: 100%; object-fit: cover; mix-blend-mode: multiply; }
.fan-controls { position: relative; display: flex; justify-content: center; align-items: center; gap: 24px; margin-top: -10px; }
.fan-controls .circle { position: static; width: 70px; height: 70px; background: rgba(60, 50, 50, .55); color: #fff; box-shadow: none; }
.dots { display: flex; gap: 12px; }
.dots span { width: 14px; height: 14px; border-radius: 50%; background: rgba(40, 30, 30, .6); cursor: pointer; transition: transform .3s, background .3s; }
.dots span.on { background: #111; transform: scale(1.3); }

/* ===== FOOTER ===== */
.footer {
  background: #fff; padding: 100px 80px 30px; position: relative; min-height: 560px;
  display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: auto 1fr auto; row-gap: 20px;
}
.footer-logo { grid-row: 1 / 3; align-self: end; display: flex; align-items: center; gap: 4px; color: #4a2c8f; }
.footer-logo svg { width: 190px; height: 190px; }
.footer-logo b { display: block; font-family: 'Archivo Black', sans-serif; font-size: 4.4rem; line-height: 1; }
.footer-logo small { display: block; font-size: 1.5rem; color: #6a5a90; letter-spacing: 1px; }
.footer-info { display: flex; gap: 70px; align-items: flex-start; flex-wrap: wrap; color: var(--cyan); font-size: 1.3rem; line-height: 1.5; }
.footer-info p { max-width: 300px; }
.social { display: flex; gap: 18px; }
.social a { width: 46px; height: 46px; border-radius: 50%; background: #000; color: #fff; display: grid; place-items: center; font-weight: 900; font-size: 1.5rem; transition: transform .3s, background .3s; }
.social a:hover { transform: translateY(-5px); background: var(--purple); }
.ig { width: 22px; height: 22px; border: 3px solid #fff; border-radius: 7px; position: relative; display: block; }
.ig::after { content: ''; position: absolute; inset: 3px; border: 3px solid #fff; border-radius: 50%; }
.privacy { grid-column: 2; align-self: center; color: var(--cyan); text-decoration: underline; font-size: 1.3rem; }
.copy { grid-column: 1 / 3; text-align: center; color: #4a3b78; text-decoration: underline; font-size: 1.3rem; margin-top: 40px; }

/* ===== ANIMATIONS ===== */
@keyframes spin { to { transform: rotate(360deg); } }
@keyframes wiggle { 0%, 100% { transform: rotate(-6deg); } 50% { transform: rotate(8deg) translateY(-8px); } }
@keyframes drift { from { transform: translate(0, 0) rotate(0); } to { transform: translate(30px, 20px) rotate(8deg); } }
@keyframes drift2 { from { transform: scaleX(-1) translate(0, 0); } to { transform: scaleX(-1) translate(30px, -25px) rotate(-6deg); } }
@keyframes waveMove { to { background-position: -200% 0; } }

.reveal { opacity: 0; transform: translateY(50px); transition: opacity .9s ease, transform .9s ease; }
.reveal.show { opacity: 1; transform: none; }
.note.reveal { transform: translateY(50px) rotate(2deg); }
.note.reveal.show { transform: rotate(2deg); }

/* ===== RESPONSIVE ===== */
@media (max-width: 1200px) {
  .nav-links { gap: 18px; }
  .nav-links a { font-size: 1rem; }
  .nav-links svg { width: 24px; height: 24px; }
  .brand-text small { display: none; }
}
@media (max-width: 900px) {
  .nav-wrap { padding: 14px 14px 0; }
  .navbar { height: 70px; border-radius: 30px; padding: 0 16px; }
  .menu-toggle { display: block; }
  .login { display: none; }
  .nav-links {
    display: none; position: absolute; top: 90px; left: 14px; right: 14px; flex-direction: column; gap: 0;
    background: #fff; border-radius: 24px; padding: 10px 20px; box-shadow: 0 10px 30px rgba(0, 0, 0, .25);
  }
  .nav-links.open { display: flex; }
  .nav-links a { padding: 12px 0; }
  .hero { padding: 0 24px 50px; }
  .paw-hero { width: 90px; height: 90px; margin-left: 80px; margin-bottom: -30px; }
  .hero p { font-size: 1.1rem; }
  .raised { padding-top: 110px; min-height: 0; }
  .note { font-size: 1.1rem; padding: 24px; margin-top: 50px; }
  .flower, .blob { opacity: .5; width: 160px; }
  .blob { height: 220px; }
  .features { padding: 40px 16px 60px; }
  .features-head { border-radius: 30px; margin-bottom: 40px; }
  .accordion { flex-direction: column; height: 760px; }
  .label { writing-mode: horizontal-tb; bottom: auto; top: 50%; transform: translate(-50%, -50%); font-size: .9rem; }
  .connect { padding: 80px 16px 0; }
  .map-box { height: 380px; }
  .circle.prev { left: -10px; }
  .circle.next { left: 70px; }
  .waves { margin: 80px -16px 0; }
  .moments { padding-top: 130px; }
  .moments-text p { font-size: 1.1rem; }
  .fan { height: 400px; margin-top: 70px; }
  .fan figure { width: 200px; height: 290px; margin-left: -100px; }
  .footer { grid-template-columns: 1fr; padding: 60px 24px 24px; }
  .footer-logo { grid-row: auto; }
  .footer-logo svg { width: 90px; height: 90px; }
  .footer-logo b { font-size: 2.2rem; }
  .footer-logo small { font-size: 1rem; }
  .footer-info { gap: 24px; font-size: 1.1rem; }
  .privacy, .copy { grid-column: 1; }
}
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after { animation: none !important; transition-duration: .01ms !important; }
}
