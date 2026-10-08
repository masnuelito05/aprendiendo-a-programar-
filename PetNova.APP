<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pet Nova | Home</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Archivo+Black&family=Nunito:wght@400;600;700;800&family=Poppins:wght@300;400;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style (1).css">
</head>
<body>

  <!-- Reusable paw icon -->
  <svg width="0" height="0" style="position:absolute" aria-hidden="true">
    <symbol id="paw" viewBox="0 0 100 100">
      <ellipse cx="50" cy="66" rx="24" ry="20"/>
      <ellipse cx="20" cy="42" rx="10" ry="13"/>
      <ellipse cx="40" cy="22" rx="10" ry="14"/>
      <ellipse cx="62" cy="22" rx="10" ry="14"/>
      <ellipse cx="82" cy="42" rx="10" ry="13"/>
    </symbol>
  </svg>

  <!-- NAVBAR -->
  <header class="nav-wrap">
    <nav class="navbar">
      <a href="#home" class="brand">
        <svg viewBox="0 0 60 60" class="brand-dog"><path d="M8 50c-4-10 0-18 8-20M20 52c-2-12 6-22 14-30 3-6 10-10 16-6 3 3 1 8-3 10l6 8-10 2c0 8-4 14-8 16" /></svg>
        <span class="brand-text"><b>PET NOVA</b><small>- Cuidamos lo que amas</small></span>
      </a>
      <ul class="nav-links" id="navLinks">
        <li><a href="#home"><svg viewBox="0 0 24 24"><path d="M3 11l9-8 9 8v10H3zM9 21v-7h6v7"/></svg>Home</a></li>
        <li><a href="#about"><svg viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21c0-5 4-8 8-8s8 3 8 8"/></svg>About Us</a></li>
        <li><a href="#functions"><svg viewBox="0 0 24 24"><rect x="3" y="7" width="18" height="14" rx="3"/><path d="M9 7V4h6v3M12 11v6M9 14h6"/></svg>Functions</a></li>
        <li><a href="#contact"><svg viewBox="0 0 24 24"><path d="M4 4h16v13H9l-5 4z"/></svg>Contact</a></li>
        <li><a href="#privacy"><svg viewBox="0 0 24 24"><path d="M12 3l8 3v6c0 5-4 8-8 9-4-1-8-4-8-9V6z"/></svg>Privacy Policy</a></li>
      </ul>
      <a class="login" href="https://nova-p-git-main-pet-nova.vercel.app/" target="_blank" rel="noopener"><i></i>LOG IN</a>
      <button class="menu-toggle" id="menuToggle" aria-label="Menu">&#9776;</button>
    </nav>
  </header>

  <!-- HERO -->
  <section id="home" class="hero">
    <div class="hero-content">
      <svg class="paw paw-hero"><use href="#paw"/></svg>
      <h1>Pet Nova</h1>
      <p>The app that helps you care for your pet's health and safety. Keep their medical history, receive vaccine reminders, activate Paw Alert in emergencies, and find them on the map, all from the convenience of your mobile phone.</p>
    </div>
  </section>

  <!-- RAISED WITH LOVE -->
  <section id="about" class="raised">
    <div class="blob blob-left"></div>
    <div class="blob blob-right"></div>
    <img class="flower flower-1" src="https://static.wixstatic.com/media/11062b_3889364d7fca4d90993f55c426131a4d~mv2.png/v1/fill/w_400,h_400,al_c,q_90/flower.png" alt="">
    <img class="flower flower-2" src="https://static.wixstatic.com/media/11062b_3889364d7fca4d90993f55c426131a4d~mv2.png/v1/fill/w_400,h_400,al_c,q_90/flower.png" alt="">

    <h2 class="reveal">Raised with love and plenty of dedication today</h2>

    <div class="note reveal">
      <svg class="paw paw-note"><use href="#paw"/></svg>
      <p>We believe every pet deserves the best start. At Pet Nova, we develop tools to help you care for their health, well-being, and happiness, accompanying you during every single stage of their long and busy lives.</p>
    </div>
  </section>

  <!-- MISSION / VISION / VALUES -->
  <section class="mvv">
    <div class="section-title reveal">
      <span class="tag">About Pet Nova</span>
      <h2>Who we are</h2>
      <p>Pet Nova was born in La Chorrera, Panama, from a simple idea: pet owners should never have to search through paper files, chats and notes to take care of the ones they love. We are a team of animal lovers, developers and designers building the digital home of every pet.</p>
    </div>
    <div class="mvv-grid">
      <article class="mvv-card reveal">
        <span class="num">01</span>
        <h3>Our Mission</h3>
        <p>To give every family the tools to protect the health, safety and happiness of their pets through simple, reliable and accessible technology.</p>
      </article>
      <article class="mvv-card reveal">
        <span class="num">02</span>
        <h3>Our Vision</h3>
        <p>To become the most trusted pet care platform in Central America, connecting owners, veterinarians and communities in one place.</p>
      </article>
      <article class="mvv-card reveal">
        <span class="num">03</span>
        <h3>Our Values</h3>
        <p>Love for animals, responsibility, transparency and community. Every feature we build starts by asking: is this good for the pet?</p>
      </article>
    </div>
  </section>

  <!-- FUNCTIONS -->
  <section id="functions" class="features">
    <div class="features-head reveal">
      <h2>Everything for your pet's well-being now</h2>
      <p>Everything your favorite pet needs, on a single platform.</p>
    </div>

    <div class="accordion" id="accordion">
      <article class="panel active" style="--img:url('https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=1200&auto=format&fit=crop&q=80')">
        <span class="label">Pet profile</span>
        <div class="panel-info">
          <svg viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21c0-5 4-8 8-8s8 3 8 8"/></svg>
          <h3>Pet profile</h3>
          <p>Create your pet's profile: name, species, breed, age, and photo. Supports multiple pets per account.</p>
        </div>
      </article>
      <article class="panel" style="--img:url('https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=1200&auto=format&fit=crop&q=80')">
        <span class="label">Medical history</span>
        <div class="panel-info">
          <svg viewBox="0 0 24 24"><rect x="3" y="7" width="18" height="14" rx="3"/><path d="M9 7V4h6v3M12 11v6M9 14h6"/></svg>
          <h3>Medical history</h3>
          <p>Vaccines, checkups and treatments saved and ready to share with your vet.</p>
        </div>
      </article>
      <article class="panel" style="--img:url('https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=1200&auto=format&fit=crop&q=80')">
        <span class="label">Paw Alert</span>
        <div class="panel-info">
          <svg viewBox="0 0 24 24"><path d="M12 22s7-6 7-12a7 7 0 10-14 0c0 6 7 12 7 12z"/><circle cx="12" cy="10" r="2.5"/></svg>
          <h3>Paw Alert</h3>
          <p>Activate an emergency alert and notify nearby users if your pet goes missing.</p>
        </div>
      </article>
      <article class="panel" style="--img:url('https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=1200&auto=format&fit=crop&q=80')">
        <span class="label">Pet map</span>
        <div class="panel-info">
          <svg viewBox="0 0 24 24"><path d="M12 22s7-6 7-12a7 7 0 10-14 0c0 6 7 12 7 12z"/><circle cx="12" cy="10" r="2.5"/></svg>
          <h3>Pet map</h3>
          <p>Find vets, services and pet-friendly spots near you.</p>
        </div>
      </article>
    </div>
  </section>

  <!-- HOW IT WORKS -->
  <section class="steps">
    <div class="section-title reveal">
      <span class="tag">Simple by design</span>
      <h2>How Pet Nova works</h2>
      <p>Getting started takes only a few minutes. Here is everything you need to do to have your pet protected.</p>
    </div>
    <div class="steps-grid">
      <article class="step reveal">
        <div class="step-num">1</div>
        <h3>Download the app</h3>
        <p>Install Pet Nova on your mobile phone and create your free account with your email.</p>
      </article>
      <article class="step reveal">
        <div class="step-num">2</div>
        <h3>Create your pet's profile</h3>
        <p>Add their name, species, breed, age and a photo. You can register as many pets as you have.</p>
      </article>
      <article class="step reveal">
        <div class="step-num">3</div>
        <h3>Save their health records</h3>
        <p>Upload vaccines, treatments and vet visits, and let the smart calendar remind you of what is next.</p>
      </article>
      <article class="step reveal">
        <div class="step-num">4</div>
        <h3>Stay connected</h3>
        <p>Find vets near you on Pet Map and activate Paw Alert in seconds if your pet ever gets lost.</p>
      </article>
    </div>
  </section>

  <!-- STATS -->
  <section class="stats">
    <div class="stat"><strong data-count="5000">0</strong><span>Pets registered</span></div>
    <div class="stat"><strong data-count="12000">0</strong><span>Active users</span></div>
    <div class="stat"><strong data-count="300">0</strong><span>Veterinary clinics listed</span></div>
    <div class="stat"><strong data-count="98" data-suffix="%">0</strong><span>Pets found with Paw Alert</span></div>
  </section>

  <!-- PET MAP -->
  <section class="connect">
    <h2 class="reveal">Connect with local services near you with</h2>

    <div class="map-card reveal">
      <div class="map-text">
        <h3>Pet Map</h3>
        <p>With Pet Map you find veterinarians, services and pet-friendly spots near you, and see the last recorded location of your beloved pets in just a few seconds.</p>
      </div>
      <div class="map-box">
        <iframe id="mapFrame" title="Pet Map" loading="lazy"
          src="https://www.openstreetmap.org/export/embed.html?bbox=-79.5290%2C8.9880%2C-79.5140%2C9.0000&layer=mapnik"></iframe>
        <button class="circle prev" id="mapPrev" aria-label="Previous">&#8592;</button>
        <button class="circle next" id="mapNext" aria-label="Next">&#8594;</button>
      </div>
    </div>

    <div class="waves"></div>
  </section>

  <!-- PET MOMENTS -->
  <section class="moments">
    <div class="waves waves-top"></div>
    <div class="moments-text reveal">
      <h2>Pet Moments</h2>
      <p>Every photo tells the story of our greatest adventures and the quiet beauty of our daily lives together. These precious memories are a gift we will cherish forever.</p>
    </div>

    <div class="fan" id="fan">
      <figure style="--bg:#f26a1b"><img src="https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
      <figure style="--bg:#f4f4f4"><img src="https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
      <figure style="--bg:#7bb36a"><img src="https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
      <figure style="--bg:#3a8fc4"><img src="https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=500&auto=format&fit=crop&q=80" alt="Cat"></figure>
      <figure style="--bg:#aeeceb"><img src="https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
      <figure style="--bg:#f26a1b"><img src="https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
      <figure style="--bg:#f4a6bf"><img src="https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
    </div>

    <div class="fan-controls">
      <button class="circle dark" id="fanPrev" aria-label="Previous">&#8249;</button>
      <div class="dots" id="dots"></div>
      <button class="circle dark" id="fanNext" aria-label="Next">&#8250;</button>
    </div>
  </section>

  <!-- TESTIMONIALS -->
  <section class="testimonials">
    <div class="section-title reveal">
      <span class="tag">Happy owners</span>
      <h2>What pet owners say</h2>
    </div>
    <div class="testi-grid">
      <blockquote class="testi reveal">
        <p>"Pet Nova keeps all of Max's vaccines in one place. At the vet I just show my phone and everything is there."</p>
        Ana R. <small>La Chorrera</small>
      </blockquote>
      <blockquote class="testi reveal">
        <p>"Our cat escaped one night and Paw Alert helped us find her in less than two hours. I cannot thank this team enough."</p>
        Carlos M. <small>Panama City</small>
      </blockquote>
      <blockquote class="testi reveal">
        <p>"The reminders are a lifesaver. I used to forget deworming dates, now Pet Nova tells me before it is due."</p>
        Maria L. <small>Arraijan</small>
      </blockquote>
    </div>
  </section>

  <!-- FAQ -->
  <section class="faq">
    <div class="section-title reveal">
      <span class="tag">Questions</span>
      <h2>Frequently asked questions</h2>
    </div>
    <div class="faq-list" id="faqList">
      <div class="faq-item open">
        <button class="faq-q">Is Pet Nova free? <span>+</span></button>
        <div class="faq-a"><p>Yes. You can download the app and use the main features for free. Pet Nova Premium adds extra storage and advanced tools for owners with several pets.</p></div>
      </div>
      <div class="faq-item">
        <button class="faq-q">Where is Pet Nova available? <span>+</span></button>
        <div class="faq-a"><p>Pet Nova is currently available in Panama, and we are working to reach more countries in Central America soon.</p></div>
      </div>
      <div class="faq-item">
        <button class="faq-q">How does Paw Alert work? <span>+</span></button>
        <div class="faq-a"><p>If your pet is lost, you activate Paw Alert from the app. Nearby users receive a notification with a photo and the last recorded location so the search can start right away.</p></div>
      </div>
      <div class="faq-item">
        <button class="faq-q">Can I register more than one pet? <span>+</span></button>
        <div class="faq-a"><p>Of course. Each account supports multiple pets, and every pet has its own profile, medical history and calendar.</p></div>
      </div>
      <div class="faq-item">
        <button class="faq-q">Is my information safe? <span>+</span></button>
        <div class="faq-a"><p>Your data is private and is never sold. You can read the details in our Privacy Policy at the bottom of this page.</p></div>
      </div>
    </div>
  </section>

  <!-- CONTACT FORM + CTA -->
  <section class="cta">
    <div class="cta-text reveal">
      <h2>Ready to care for what you love?</h2>
      <p>Download Pet Nova today or send us a message. Our team answers every question, from vaccine reminders to partnerships with veterinary clinics.</p>
      <div class="cta-buttons">
        <a href="#" class="btn-cta">Download App</a>
        <a href="https://nova-p-git-main-pet-nova.vercel.app/" target="_blank" rel="noopener" class="btn-cta outline">Log In</a>
      </div>
    </div>
    <form class="contact-form reveal" id="contactForm">
      <h3>Send us a message</h3>
      <input type="text" placeholder="Your name" required>
      <input type="email" placeholder="Your email" required>
      <textarea rows="4" placeholder="How can we help you?" required></textarea>
      <button type="submit">Send message</button>
      <p class="form-ok" id="formOk">Thank you! We will get back to you soon.</p>
    </form>
  </section>

  <!-- FOOTER -->
  <footer id="contact" class="footer">
    <div class="footer-logo">
      <svg viewBox="0 0 60 60"><path d="M8 50c-4-10 0-18 8-20M20 52c-2-12 6-22 14-30 3-6 10-10 16-6 3 3 1 8-3 10l6 8-10 2c0 8-4 14-8 16" /></svg>
      <div><b>PET NOVA</b><small>We Care for what you love</small></div>
    </div>

    <div class="footer-info">
      <p>La Chorrera, Panamá Oeste,<br>Panamá</p>
      <p>123-456-7890<br>petnovitas2027@gmail.com</p>
      <div class="social">
        <a href="http://www.facebook.com" target="_blank" rel="noopener" aria-label="Facebook">f</a>
        <a href="http://www.instagram.com" target="_blank" rel="noopener" aria-label="Instagram">i</a>
      </div>
    </div>

    <div class="map-card reveal">
      <div class="map-text">
        <h3>Pet Map</h3>
        <p>With Pet Map you find veterinarians, services and pet-friendly spots near you, and see the last recorded location of your beloved pets in just a few seconds.</p>
      </div>
      <div class="map-box">
        <iframe id="mapFrame" title="Pet Map" loading="lazy"
          src="https://www.openstreetmap.org/export/embed.html?bbox=-79.5290%2C8.9880%2C-79.5140%2C9.0000&layer=mapnik"></iframe>
        <button class="circle prev" id="mapPrev" aria-label="Previous">&#8592;</button>
        <button class="circle next" id="mapNext" aria-label="Next">&#8594;</button>
      </div>
    </div>

    <div class="waves"></div>
  </section>

  <!-- PET MOMENTS -->
  <section class="moments">
    <div class="waves waves-top"></div>
    <div class="moments-text reveal">
      <h2>Pet Moments</h2>
      <p>Every photo tells the story of our greatest adventures and the quiet beauty of our daily lives together. These precious memories are a gift we will cherish forever.</p>
    </div>

    <div class="fan" id="fan">
      <figure style="--bg:#f26a1b"><img src="https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
      <figure style="--bg:#f4f4f4"><img src="https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
      <figure style="--bg:#7bb36a"><img src="https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
      <figure style="--bg:#3a8fc4"><img src="https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=500&auto=format&fit=crop&q=80" alt="Cat"></figure>
      <figure style="--bg:#aeeceb"><img src="https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
      <figure style="--bg:#f26a1b"><img src="https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
      <figure style="--bg:#f4a6bf"><img src="https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=500&auto=format&fit=crop&q=80" alt="Dog"></figure>
    </div>

    <div class="fan-controls">
      <button class="circle dark" id="fanPrev" aria-label="Previous">&#8249;</button>
      <div class="dots" id="dots"></div>
      <button class="circle dark" id="fanNext" aria-label="Next">&#8250;</button>
    </div>
  </section>

  <!-- TESTIMONIALS -->
  <section class="testimonials">
    <div class="section-title reveal">
      <span class="tag">Happy owners</span>
      <h2>What pet owners say</h2>
    </div>
    <div class="testi-grid">
      <blockquote class="testi reveal">
        <p>"Pet Nova keeps all of Max's vaccines in one place. At the vet I just show my phone and everything is there."</p>
        Ana R. <small>La Chorrera</small>
      </blockquote>
      <blockquote class="testi reveal">
        <p>"Our cat escaped one night and Paw Alert helped us find her in less than two hours. I cannot thank this team enough."</p>
        Carlos M. <small>Panama City</small>
      </blockquote>
      <blockquote class="testi reveal">
        <p>"The reminders are a lifesaver. I used to forget deworming dates, now Pet Nova tells me before it is due."</p>
        Maria L. <small>Arraijan</small>
      </blockquote>
    </div>
  </section>

  <!-- FAQ -->
  <section class="faq">
    <div class="section-title reveal">
      <span class="tag">Questions</span>
      <h2>Frequently asked questions</h2>
    </div>
    <div class="faq-list" id="faqList">
      <div class="faq-item open">
        <button class="faq-q">Is Pet Nova free? <span>+</span></button>
        <div class="faq-a"><p>Yes. You can download the app and use the main features for free. Pet Nova Premium adds extra storage and advanced tools for owners with several pets.</p></div>
      </div>
      <div class="faq-item">
        <button class="faq-q">Where is Pet Nova available? <span>+</span></button>
        <div class="faq-a"><p>Pet Nova is currently available in Panama, and we are working to reach more countries in Central America soon.</p></div>
      </div>
      <div class="faq-item">
        <button class="faq-q">How does Paw Alert work? <span>+</span></button>
        <div class="faq-a"><p>If your pet is lost, you activate Paw Alert from the app. Nearby users receive a notification with a photo and the last recorded location so the search can start right away.</p></div>
      </div>
      <div class="faq-item">
        <button class="faq-q">Can I register more than one pet? <span>+</span></button>
        <div class="faq-a"><p>Of course. Each account supports multiple pets, and every pet has its own profile, medical history and calendar.</p></div>
      </div>
      <div class="faq-item">
        <button class="faq-q">Is my information safe? <span>+</span></button>
        <div class="faq-a"><p>Your data is private and is never sold. You can read the details in our Privacy Policy at the bottom of this page.</p></div>
      </div>
    </div>
  </section>

  <!-- CONTACT FORM + CTA -->
  <section class="cta">
    <div class="cta-text reveal">
      <h2>Ready to care for what you love?</h2>
      <p>Download Pet Nova today or send us a message. Our team answers every question, from vaccine reminders to partnerships with veterinary clinics.</p>
      <div class="cta-buttons">
        <a href="#" class="btn-cta">Download App</a>
        <a href="https://nova-p-git-main-pet-nova.vercel.app/" target="_blank" rel="noopener" class="btn-cta outline">Log In</a>
      </div>
    </div>
    <form class="contact-form reveal" id="contactForm">
      <h3>Send us a message</h3>
      <input type="text" placeholder="Your name" required>
      <input type="email" placeholder="Your email" required>
      <textarea rows="4" placeholder="How can we help you?" required></textarea>
      <button type="submit">Send message</button>
      <p class="form-ok" id="formOk">Thank you! We will get back to you soon.</p>
    </form>
  </section>

  <!-- FOOTER -->
  <footer id="contact" class="footer">
    <div class="footer-logo">
      <svg viewBox="0 0 60 60"><path d="M8 50c-4-10 0-18 8-20M20 52c-2-12 6-22 14-30 3-6 10-10 16-6 3 3 1 8-3 10l6 8-10 2c0 8-4 14-8 16" /></svg>
      <div><b>PET NOVA</b><small>We Care for what you love</small></div>
    </div>

    <div class="footer-info">
      <p>La Chorrera, Panamá Oeste,<br>Panamá</p>
      <p>123-456-7890<br>petnovitas2027@gmail.com</p>
      <div class="social">
        <a href="http://www.facebook.com" target="_blank" rel="noopener" aria-label="Facebook">f</a>
        <a href="http://www.instagram.com" target="_blank" rel="noopener" aria-label="Instagram">i</a>
      </div>  
