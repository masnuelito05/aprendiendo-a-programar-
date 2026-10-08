// ===== MOBILE MENU =====
const menuToggle = document.getElementById("menuToggle");
const navLinks = document.getElementById("navLinks");
if (menuToggle && navLinks) {
  menuToggle.addEventListener("click", () => navLinks.classList.toggle("open"));
  navLinks.querySelectorAll("a").forEach((a) =>
    a.addEventListener("click", () => navLinks.classList.remove("open"))
  );
}

// ===== REVEAL ON SCROLL =====
const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((e) => {
      if (e.isIntersecting) {
        e.target.classList.add("show");
        observer.unobserve(e.target);
      }
    });
  },
  { threshold: 0.15 }
);
document.querySelectorAll(".reveal").forEach((el) => observer.observe(el));

// ===== ACCORDION (Functions) =====
const panels = document.querySelectorAll(".panel");
panels.forEach((panel) => {
  const activate = () => {
    panels.forEach((p) => p.classList.remove("active"));
    panel.classList.add("active");
  };
  panel.addEventListener("click", activate);
  panel.addEventListener("mouseenter", activate);
});

// ===== PET MAP (changes location with the arrows) =====
const mapFrame = document.getElementById("mapFrame");
const mapPrev = document.getElementById("mapPrev");
const mapNext = document.getElementById("mapNext");

if (mapFrame && mapPrev && mapNext) {
  const base = "https://www.openstreetmap.org/export/embed.html?layer=mapnik&bbox=";
  const places = [
    "-79.5290%2C8.9880%2C-79.5140%2C9.0000", // Panama City (Via Espana)
    "-79.7900%2C8.8740%2C-79.7740%2C8.8870", // La Chorrera
    "-79.4720%2C8.9950%2C-79.4560%2C9.0100", // Costa del Este
  ];
  let m = 0;
  const goMap = (dir) => {
    m = (m + dir + places.length) % places.length;
    mapFrame.src = base + places[m];
  };
  mapNext.addEventListener("click", () => goMap(1));
  mapPrev.addEventListener("click", () => goMap(-1));
}

// ===== FAN CAROUSEL (Pet Moments) =====
const cards = document.querySelectorAll("#fan figure");
const dotsBox = document.getElementById("dots");
const fanPrev = document.getElementById("fanPrev");
const fanNext = document.getElementById("fanNext");

if (cards.length && dotsBox) {
  const total = cards.length;
  const spacing = window.innerWidth < 900 ? 90 : 165;
  let active = Math.floor(total / 2);
  let timer;

  cards.forEach((_, i) => {
    const dot = document.createElement("span");
    dot.addEventListener("click", () => { active = i; render(); resetAuto(); });
    dotsBox.appendChild(dot);
  });

  function render() {
    cards.forEach((card, i) => {
      let offset = i - active;
      // circular offset so the fan loops
      if (offset > total / 2) offset -= total;
      if (offset < -total / 2) offset += total;

      const abs = Math.abs(offset);
      const x = offset * spacing;
      const y = abs * abs * 10;
      const rot = offset * 9;
      const scale = offset === 0 ? 1.05 : 1 - abs * 0.04;

      card.style.transform = `translate(${x}px, ${y}px) rotate(${rot}deg) scale(${scale})`;
      card.style.zIndex = 10 - abs;
      card.style.opacity = abs > 3 ? 0 : 1;
    });
    [...dotsBox.children].forEach((d, i) => d.classList.toggle("on", i === active));
  }

  const next = () => { active = (active + 1) % total; render(); };
  const prev = () => { active = (active - 1 + total) % total; render(); };
  const startAuto = () => { timer = setInterval(next, 3500); };
  const resetAuto = () => { clearInterval(timer); startAuto(); };

  fanNext.addEventListener("click", () => { next(); resetAuto(); });
  fanPrev.addEventListener("click", () => { prev(); resetAuto(); });

  render();
  startAuto();
}
