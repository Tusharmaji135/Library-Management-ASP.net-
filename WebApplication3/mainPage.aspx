<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>College Management System</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Font Awesome for icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        overflow-x: hidden;
      }

      /* Animated background particles */
      .particles {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        z-index: -1;
      }

      .particle {
        position: absolute;
        width: 4px;
        height: 4px;
        background: rgba(255, 255, 255, 0.3);
        border-radius: 50%;
        animation: float 6s ease-in-out infinite;
      }

      @keyframes float {
        0%,
        100% {
          transform: translateY(0px) rotate(0deg);
          opacity: 0.3;
        }
        50% {
          transform: translateY(-20px) rotate(180deg);
          opacity: 1;
        }
      }

      /* Enhanced Navbar */
      .navbar {
        background: rgba(26, 35, 46, 0.95) !important;
        backdrop-filter: blur(10px);
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
      }

      .navbar-brand {
        font-weight: 700;
        font-size: 1.5rem;
        background: linear-gradient(45deg, #4facfe, #00f2fe);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
      }

      .nav-link {
        font-weight: 500;
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
      }

      .nav-link::before {
        content: "";
        position: absolute;
        bottom: 0;
        left: -100%;
        width: 100%;
        height: 2px;
        background: linear-gradient(45deg, #4facfe, #00f2fe);
        transition: left 0.3s ease;
      }

      .nav-link:hover::before,
      .nav-link.active::before {
        left: 0;
      }

      .nav-link:hover {
        color: #4facfe !important;
        transform: translateY(-2px);
      }

      /* Hero Section Enhancement */
      .hero-section {
        padding: 100px 0;
        position: relative;
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(10px);
        margin: 50px 20px;
        border-radius: 20px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
      }

      .hero-content {
        position: relative;
        z-index: 2;
      }

      .hero-title {
        font-weight: 700;
        background: linear-gradient(45deg, #ffffff, #e0e0e0);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        margin-bottom: 20px;
        animation: slideInUp 1s ease-out;
      }

      .hero-subtitle {
        color: rgba(255, 255, 255, 0.9);
        font-size: 1.2rem;
        font-weight: 400;
        margin-bottom: 30px;
        animation: slideInUp 1s ease-out 0.2s both;
      }

      .cta-button {
        background: linear-gradient(45deg, #4facfe, #00f2fe);
        border: none;
        padding: 15px 40px;
        font-size: 1.1rem;
        font-weight: 600;
        border-radius: 50px;
        color: white;
        text-decoration: none;
        display: inline-block;
        transition: all 0.3s ease;
        box-shadow: 0 10px 25px rgba(79, 172, 254, 0.3);
        animation: slideInUp 1s ease-out 0.4s both;
      }

      .cta-button:hover {
        transform: translateY(-3px);
        box-shadow: 0 15px 35px rgba(79, 172, 254, 0.4);
        color: white;
      }

      /* Feature Cards */
      .features-section {
        padding: 80px 0;
        margin: 0 20px;
      }

      .feature-card {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 15px;
        padding: 40px 30px;
        text-align: center;
        transition: all 0.3s ease;
        height: 100%;
        position: relative;
        overflow: hidden;
      }

      .feature-card::before {
        content: "";
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(
          45deg,
          rgba(79, 172, 254, 0.1),
          rgba(0, 242, 254, 0.1)
        );
        transition: left 0.5s ease;
        z-index: -1;
      }

      .feature-card:hover::before {
        left: 0;
      }

      .feature-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
      }

      .feature-icon {
        font-size: 3rem;
        background: linear-gradient(45deg, #4facfe, #00f2fe);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        margin-bottom: 20px;
      }

      .feature-title {
        color: white;
        font-size: 1.3rem;
        font-weight: 600;
        margin-bottom: 15px;
      }

      .feature-desc {
        color: rgba(255, 255, 255, 0.8);
        font-size: 0.95rem;
        line-height: 1.6;
      }

      /* Footer Enhancement */
      footer {
        background: rgba(26, 35, 46, 0.95) !important;
        backdrop-filter: blur(10px);
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        padding: 30px 0;
      }

      .footer-content {
        color: rgba(255, 255, 255, 0.8);
      }

      /* Animations */
      @keyframes slideInUp {
        from {
          transform: translateY(50px);
          opacity: 0;
        }
        to {
          transform: translateY(0);
          opacity: 1;
        }
      }

      .fade-in {
        animation: slideInUp 0.8s ease-out;
      }

      /* Responsive Design */
      @media (max-width: 768px) {
        .hero-section {
          margin: 20px 10px;
          padding: 60px 20px;
        }

        .features-section {
          margin: 0 10px;
        }

        .hero-title {
          font-size: 2.5rem;
        }

        .feature-card {
          margin-bottom: 20px;
        }
      }

      /* Custom Scrollbar Styling */
      ::-webkit-scrollbar {
        width: 10px;
        height: 10px;
      }

      ::-webkit-scrollbar-track {
        background: rgba(26, 35, 46, 0.6);
        border-radius: 10px;
      }

      ::-webkit-scrollbar-thumb {
        background: linear-gradient(180deg, #4facfe, #00f2fe);
        border-radius: 10px;
        border: 2px solid rgba(26, 35, 46, 0.8);
        transition: all 0.3s ease;
      }

      ::-webkit-scrollbar-thumb:hover {
        background: linear-gradient(180deg, #00f2fe, #4facfe);
      }

      /* For Firefox */
      * {
        scrollbar-width: thin;
        scrollbar-color: #4facfe rgba(26, 35, 46, 0.6);
      }
    </style>
  </head>
  <body>
    <!-- Animated Background Particles -->
    <div class="particles"></div>

    <!-- Enhanced Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          <i class="fas fa-graduation-cap me-2"></i>College Management
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">
                <i class="fas fa-home me-1"></i>Home
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-users me-1"></i>Students
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-chalkboard-teacher me-1"></i>Faculty
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-book me-1"></i>Courses
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/homepage.aspx">
                <i class="fas fa-book-open me-1"></i>Library
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-envelope me-1"></i>Contact
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Enhanced Hero Section -->
    <div class="container-fluid" style="padding-top: 80px">
      <div class="hero-section">
        <div class="container">
          <div class="hero-content text-center">
            <h1 class="hero-title display-3">
              Welcome to College Management System
            </h1>
            <p class="hero-subtitle">
              Streamline your educational institution with our comprehensive
              management platform
            </p>
            <a href="#features" class="cta-button">
              <i class="fas fa-rocket me-2"></i>Explore Features
            </a>
          </div>
        </div>
      </div>

      <!-- Features Section -->
      <div class="features-section" id="features">
        <div class="container">
          <div class="row text-center mb-5">
            <div class="col-12">
              <h2 class="text-white display-5 fw-bold mb-3">Our Features</h2>
              <p class="text-white-50 fs-5">
                Everything you need to manage your college efficiently
              </p>
            </div>
          </div>
          <div class="row g-4">
            <div class="col-md-6 col-lg-3">
              <div class="feature-card fade-in">
                <div class="feature-icon">
                  <i class="fas fa-user-graduate"></i>
                </div>
                <h4 class="feature-title">Student Management</h4>
                <p class="feature-desc">
                  Comprehensive student records, enrollment tracking, and
                  academic progress monitoring.
                </p>
              </div>
            </div>
            <div class="col-md-6 col-lg-3">
              <div class="feature-card fade-in">
                <div class="feature-icon">
                  <i class="fas fa-users"></i>
                </div>
                <h4 class="feature-title">Faculty Portal</h4>
                <p class="feature-desc">
                  Manage faculty information, schedules, and performance
                  tracking in one place.
                </p>
              </div>
            </div>
            <div class="col-md-6 col-lg-3">
              <div class="feature-card fade-in">
                <div class="feature-icon">
                  <i class="fas fa-book-reader"></i>
                </div>
                <h4 class="feature-title">Course Catalog</h4>
                <p class="feature-desc">
                  Organize courses, curricula, and academic programs with
                  detailed course information.
                </p>
              </div>
            </div>
            <div class="col-md-6 col-lg-3">
              <div class="feature-card fade-in">
                <div class="feature-icon">
                  <i class="fas fa-book-open me-1"></i>
                </div>
                <h4 class="feature-title">Library System</h4>
                <p class="feature-desc">
                  Digital library management with book tracking, reservations,
                  and inventory control.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Enhanced Footer -->
    <footer class="text-white text-center">
      <div class="container">
        <div class="footer-content">
          <p class="mb-2">
            &copy; 2025 College Management System | All Rights Reserved
          </p>
          <p class="mb-0">
            <i class="fas fa-heart text-danger me-1"></i>
            Built with modern web technologies
          </p>
        </div>
      </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
      // Create animated particles
      function createParticles() {
        const particlesContainer = document.querySelector(".particles");
        const particleCount = 50;

        for (let i = 0; i < particleCount; i++) {
          const particle = document.createElement("div");
          particle.className = "particle";
          particle.style.left = Math.random() * 100 + "%";
          particle.style.top = Math.random() * 100 + "%";
          particle.style.animationDelay = Math.random() * 6 + "s";
          particle.style.animationDuration = Math.random() * 3 + 3 + "s";
          particlesContainer.appendChild(particle);
        }
      }

      // Smooth scrolling for anchor links
      document.addEventListener("DOMContentLoaded", function () {
        createParticles();

        // Smooth scroll for CTA button
        const ctaButton = document.querySelector(".cta-button");
        if (ctaButton) {
          ctaButton.addEventListener("click", function (e) {
            e.preventDefault();
            const target = document.querySelector("#features");
            if (target) {
              target.scrollIntoView({
                behavior: "smooth",
                block: "start",
              });
            }
          });
        }

        // Add scroll effect to navbar
        window.addEventListener("scroll", function () {
          const navbar = document.querySelector(".navbar");
          if (window.scrollY > 50) {
            navbar.style.background = "rgba(26, 35, 46, 0.98)";
          } else {
            navbar.style.background = "rgba(26, 35, 46, 0.95)";
          }
        });

        // Intersection Observer for fade-in animations
        const observerOptions = {
          threshold: 0.1,
          rootMargin: "0px 0px -50px 0px",
        };

        const observer = new IntersectionObserver(function (entries) {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              entry.target.style.opacity = "1";
              entry.target.style.transform = "translateY(0)";
            }
          });
        }, observerOptions);

        // Observe feature cards
        document.querySelectorAll(".feature-card").forEach((card) => {
          card.style.opacity = "0";
          card.style.transform = "translateY(30px)";
          card.style.transition = "all 0.6s ease-out";
          observer.observe(card);
        });
      });
    </script>
  </body>
</html>
