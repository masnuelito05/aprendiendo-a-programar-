"use strict";
 
document.addEventListener("DOMContentLoaded", () => {
  initNavigation();
  initMobileMenu();
  initFeatureAccordion();
  initPetMap();
  initPetMoments();
  initCounters();
  initFAQs();
  initContactForm();
  initRevealAnimations();
  initBackToTop();
  initImageFallbacks();
 
  // Indica que el JavaScript se cargó correctamente.
  window.__petnovaOK = true;
});
 
/* =====================================================
   1. NAVEGACIÓN PRINCIPAL
   Los enlaces llevan a secciones de la misma página.
   ===================================================== */
 
function initNavigation() {
  const navLinks = document.querySelectorAll(
    ".nav-links a[href^='#'], .brand[href^='#']"
  );
 
  navLinks.forEach((link) => {
    link.addEventListener("click", (event) => {
      const href = link.getAttribute("href");
 
      if (!href || href === "#") return;
 
      const target = document.querySelector(href);
 
      if (!target) return;
 
      event.preventDefault();
 
      target.scrollIntoView({
        behavior: window.matchMedia(
          "(prefers-reduced-motion: reduce)"
        ).matches
          ? "auto"
          : "smooth",
        block: "start"
      });
 
      // Mantiene la URL dentro de la misma página.
      history.replaceState(null, "", href);
 
      closeMobileMenu();
    });
  });
 
  // Actualiza el enlace activo según la sección visible.
  const sections = document.querySelectorAll(
    "main section[id], main section[aria-labelledby]"
  );
 
  if (!("IntersectionObserver" in window)) return;
 
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting || !entry.target.id) return;
 
        navLinks.forEach((link) => {
          const active =
            link.getAttribute("href") === `#${entry.target.id}`;
 
          link.classList.toggle("active", active);
 
          if (active) {
            link.setAttribute("aria-current", "location");
          } else {
            link.removeAttribute("aria-current");
          }
        });
      });
    },
    {
      rootMargin: "-30% 0px -60% 0px",
      threshold: 0
    }
  );
 
  sections.forEach((section) => observer.observe(section));
}
 
/* =====================================================
   2. MENÚ MÓVIL
   ===================================================== */
 
function initMobileMenu() {
  const toggle = document.getElementById("menuToggle");
  const links = document.getElementById("navLinks");
 
  if (!toggle || !links) return;
 
  toggle.setAttribute("aria-expanded", "false");
 
  toggle.addEventListener("click", () => {
    const opening = toggle.getAttribute("aria-expanded") !== "true";
 
    toggle.setAttribute("aria-expanded", String(opening));
    links.classList.toggle("open", opening);
    document.querySelector(".nav-wrap")?.classList.toggle(
      "menu-open",
      opening
    );
  });
 
  document.addEventListener("click", (event) => {
    if (
      !toggle.contains(event.target) &&
      !links.contains(event.target)
    ) {
      closeMobileMenu();
    }
  });
 
  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") closeMobileMenu();
  });
}
 
function closeMobileMenu() {
  const toggle = document.getElementById("menuToggle");
  const links = document.getElementById("navLinks");
 
  toggle?.setAttribute("aria-expanded", "false");
  links?.classList.remove("open");
  document.querySelector(".nav-wrap")?.classList.remove("menu-open");
}
 
/* =====================================================
   3. ACORDEÓN DE FUNCIONES
   ===================================================== */
 
function initFeatureAccordion() {
  const accordion = document.getElementById("accordion");
 
  if (!accordion) return;
 
  const panels = Array.from(accordion.querySelectorAll(".panel"));
 
  panels.forEach((panel, index) => {
    panel.setAttribute("tabindex", "0");
    panel.setAttribute("role", "button");
    panel.setAttribute("aria-expanded", String(panel.classList.contains("active")));
 
    function activatePanel() {
      panels.forEach((otherPanel) => {
        const active = otherPanel === panel;
 
        otherPanel.classList.toggle("active", active);
        otherPanel.setAttribute("aria-expanded", String(active));
      });
    }
 
    panel.addEventListener("click", activatePanel);
 
    panel.addEventListener("keydown", (event) => {
      if (event.key === "Enter" || event.key === " ") {
        event.preventDefault();
        activatePanel();
      }
 
      if (event.key === "ArrowRight" || event.key === "ArrowDown") {
        event.preventDefault();
        panels[(index + 1) % panels.length].focus();
      }
 
      if (event.key === "ArrowLeft" || event.key === "ArrowUp") {
        event.preventDefault();
        panels[(index - 1 + panels.length) % panels.length].focus();
      }
    });
  });
}
 
/* =====================================================
   4. PET MAP
   ===================================================== */
 
function initPetMap() {
  const map = document.getElementById("mapFrame");
  const previous = document.getElementById("mapPrev");
  const next = document.getElementById("mapNext");
 
  if (!map || !previous || !next) return;
 
  const locations = [
    {
      name: "La Chorrera",
      url: "https://www.openstreetmap.org/export/embed.html?bbox=-79.92%2C8.85%2C-79.73%2C9.02&layer=mapnik"
    },
    {
      name: "Panama City",
      url: "https://www.openstreetmap.org/export/embed.html?bbox=-79.58%2C8.92%2C-79.45%2C9.05&layer=mapnik"
    },
    {
      name: "Arraiján",
      url: "https://www.openstreetmap.org/export/embed.html?bbox=-79.72%2C8.88%2C-79.55%2C9.02&layer=mapnik"
    }
  ];
 
  let current = 0;
 
  function updateMap(index) {
    current = (index + locations.length) % locations.length;
 
    map.src = locations[current].url;
    map.title = `Pet Map — ${locations[current].name}`;
 
    const label = document.getElementById("mapLocation");
 
    if (label) label.textContent = locations[current].name;
  }
 
  previous.addEventListener("click", () => updateMap(current - 1));
  next.addEventListener("click", () => updateMap(current + 1));
}
 
/* =====================================================
   5. PET MOMENTS — CARRUSEL DE FOTOS
   ===================================================== */
 
function initPetMoments() {
  const fan = document.getElementById("fan");
  const previous = document.getElementById("fanPrev");
  const next = document.getElementById("fanNext");
  const dotsContainer = document.getElementById("dots");
 
  if (!fan) return;
 
  const photos = Array.from(fan.querySelectorAll("figure"));
 
  if (!photos.length) return;
 
  let current = 0;
 
  function renderDots() {
    if (!dotsContainer) return;
 
    dotsContainer.replaceChildren();
 
    photos.forEach((_, index) => {
      const dot = document.createElement("button");
 
      dot.type = "button";
      dot.className = "dot";
      dot.setAttribute("aria-label", `View photo ${index + 1}`);
 
      dot.addEventListener("click", () => showPhoto(index));
 
      dotsContainer.appendChild(dot);
    });
  }
 
  function showPhoto(index) {
    current = (index + photos.length) % photos.length;
 
    photos.forEach((photo, i) => {
      photo.classList.toggle("active", i === current);
    });
 
    if (dotsContainer) {
      Array.from(dotsContainer.children).forEach((dot, i) => {
        dot.classList.toggle("active", i === current);
        dot.setAttribute("aria-pressed", String(i === current));
      });
    }
 
    // Mantiene el índice disponible para estilos tipo abanico.
    fan.dataset.activeIndex = String(current);
  }
 
  previous?.addEventListener("click", () => showPhoto(current - 1));
  next?.addEventListener("click", () => showPhoto(current + 1));
 
  renderDots();
  showPhoto(0);
}
 
/* =====================================================
   6. CONTADORES
   ===================================================== */
 
function initCounters() {
  const counters = document.querySelectorAll("[data-count]");
 
  if (!counters.length) return;
 
  function animateCounter(element) {
    if (element.dataset.counted === "true") return;
 
    element.dataset.counted = "true";
 
    const target = Number(element.dataset.count);
 
    if (!Number.isFinite(target)) return;
 
    const suffix = element.dataset.suffix || "";
    const duration = 1300;
    const start = performance.now();
 
    function update(now) {
      const progress = Math.min((now - start) / duration, 1);
      const eased = 1 - Math.pow(1 - progress, 3);
      const value = Math.round(target * eased);
 
      element.textContent = value.toLocaleString() + suffix;
 
      if (progress < 1) requestAnimationFrame(update);
    }
 
    requestAnimationFrame(update);
  }
 
  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) return;
 
        animateCounter(entry.target);
        observer.unobserve(entry.target);
      });
    });
 
    counters.forEach((counter) => observer.observe(counter));
  } else {
    counters.forEach(animateCounter);
  }
}
 
/* =====================================================
   7. PREGUNTAS FRECUENTES
   ===================================================== */
 
function initFAQs() {
  const list = document.getElementById("faqList");
 
  if (!list) return;
 
  const items = Array.from(list.querySelectorAll(".faq-item"));
 
  items.forEach((item) => {
    const question = item.querySelector(".faq-q");
    const answer = item.querySelector(".faq-a");
 
    if (!question || !answer) return;
 
    question.setAttribute(
      "aria-expanded",
      String(item.classList.contains("open"))
    );
 
    answer.hidden = !item.classList.contains("open");
 
    question.addEventListener("click", () => {
      const opening = !item.classList.contains("open");
 
      items.forEach((otherItem) => {
        const otherQuestion = otherItem.querySelector(".faq-q");
        const otherAnswer = otherItem.querySelector(".faq-a");
 
        otherItem.classList.remove("open");
 
        if (otherQuestion) {
          otherQuestion.setAttribute("aria-expanded", "false");
        }
 
        if (otherAnswer) otherAnswer.hidden = true;
      });
 
      if (opening) {
        item.classList.add("open");
        question.setAttribute("aria-expanded", "true");
        answer.hidden = false;
      }
    });
  });
}
 
/* =====================================================
   8. FORMULARIO DE CONTACTO
   ===================================================== */
 
function initContactForm() {
  const form = document.getElementById("contactForm");
  const messageBox = document.getElementById("formOk");
 
  if (!form) return;
 
  form.addEventListener("submit", async (event) => {
    event.preventDefault();
 
    if (!form.reportValidity()) return;
 
    const name = document.getElementById("cf-name")?.value.trim();
    const email = document.getElementById("cf-email")?.value.trim();
    const message = document.getElementById("cf-message")?.value.trim();
 
    if (!name || !email || !message) {
      displayContactMessage(
        messageBox,
        "Please complete all fields.",
        false
      );
      return;
    }
 
    // El formulario solo envía mensajes si se configura un endpoint real.
    const endpoint = form.dataset.endpoint;
 
    if (!endpoint) {
      displayContactMessage(
        messageBox,
        "The contact form is not connected to a message service yet.",
        false
      );
      return;
    }
 
    const submitButton = form.querySelector("[type='submit']");
 
    if (submitButton) submitButton.disabled = true;
 
    try {
      const response = await fetch(endpoint, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, email, message })
      });
 
      if (!response.ok) {
        throw new Error(`Request failed: ${response.status}`);
      }
 
      displayContactMessage(
        messageBox,
        "Your message was sent successfully.",
        true
      );
 
      form.reset();
    } catch (error) {
      console.error("Pet Nova contact form error:", error);
 
      displayContactMessage(
        messageBox,
        "We couldn't send your message. Please try again later.",
        false
      );
    } finally {
      if (submitButton) submitButton.disabled = false;
    }
  });
}
 
function displayContactMessage(element, text, success) {
  if (!element) return;
 
  element.textContent = text;
  element.hidden = false;
  element.setAttribute("role", success ? "status" : "alert");
  element.classList.toggle("success", success);
  element.classList.toggle("error", !success);
}
 
/* =====================================================
   9. ANIMACIONES DE ENTRADA
   ===================================================== */
 
function initRevealAnimations() {
  const elements = document.querySelectorAll(".reveal");
 
  if (!elements.length) return;
 
  if (
    !("IntersectionObserver" in window) ||
    window.matchMedia("(prefers-reduced-motion: reduce)").matches
  ) {
    elements.forEach((element) => {
      element.classList.add("show", "visible");
    });
 
    return;
  }
 
  const observer = new IntersectionObserver(
    (entries, currentObserver) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) return;
 
        entry.target.classList.add("show", "visible");
        currentObserver.unobserve(entry.target);
      });
    },
    { threshold: 0.12 }
  );
 
  elements.forEach((element) => observer.observe(element));
}
 
/* =====================================================
   10. BOTÓN VOLVER ARRIBA
   ===================================================== */
 
function initBackToTop() {
  const button = document.querySelector(
    ".to-top, .back-to-top, #backToTop"
  );
 
  if (!button) return;
 
  function updateButton() {
    button.classList.toggle("show", window.scrollY > 450);
  }
 
  window.addEventListener("scroll", updateButton, { passive: true });
 
  button.addEventListener("click", () => {
    window.scrollTo({
      top: 0,
      behavior: window.matchMedia(
        "(prefers-reduced-motion: reduce)"
      ).matches
        ? "auto"
        : "smooth"
    });
  });
 
  updateButton();
}
 
/* =====================================================
   11. RESPALDO PARA IMÁGENES
   ===================================================== */
 
function initImageFallbacks() {
  document.querySelectorAll("img[data-fallback]").forEach((image) => {
    image.addEventListener("error", () => {
      const fallback = image.dataset.fallback;
 
      if (
        fallback &&
        image.src !== fallback &&
        !image.dataset.fallbackUsed
      ) {
        image.dataset.fallbackUsed = "true";
        image.src = fallback;
      }
    });
  });
}