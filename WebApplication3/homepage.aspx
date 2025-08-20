<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication3.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Animated Background Elements */
        .floating-books {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
            overflow: hidden;
        }

        .floating-book {
            position: absolute;
            font-size: 20px;
            color: rgba(255, 255, 255, 0.1);
            animation: float-books 15s infinite linear;
            transform-origin: center;
        }

        @keyframes float-books {
            0% { 
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { 
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }

        /* Enhanced Hero Section */
        .hero-section {
            background: linear-gradient(135deg, rgba(116, 75, 162, 0.9), rgba(102, 126, 234, 0.9)),
                        url('images/homeBanner.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: white;
            padding: 140px 40px 100px;
            text-align: center;
            border-radius: 25px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
            margin: 30px auto;
            animation: slideInDown 1s ease-out;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .hero-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, 
                rgba(102, 126, 234, 0.8) 0%, 
                rgba(116, 75, 162, 0.8) 50%, 
                rgba(79, 172, 254, 0.8) 100%);
            z-index: 0;
            animation: gradientShift 6s ease-in-out infinite alternate;
        }

        @keyframes gradientShift {
            0% { opacity: 0.8; }
            100% { opacity: 0.6; }
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-section h1 {
            font-size: 4rem;
            font-weight: 800;
            margin-bottom: 25px;
            letter-spacing: 2px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            animation: textGlow 3s ease-in-out infinite alternate;
            line-height: 1.1;
        }

        @keyframes textGlow {
            0% { text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); }
            100% { text-shadow: 2px 2px 20px rgba(255, 255, 255, 0.3); }
        }

        .hero-section .hero-icon {
            display: inline-block;
            font-size: 4.5rem;
            margin-right: 20px;
            animation: bookRotate 4s ease-in-out infinite;
            filter: drop-shadow(0 0 10px rgba(255, 255, 255, 0.3));
        }

        @keyframes bookRotate {
            0%, 100% { transform: rotateY(0deg); }
            50% { transform: rotateY(15deg); }
        }

        .hero-section p {
            font-size: 1.4rem;
            font-weight: 400;
            margin-bottom: 30px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
            animation: slideInUp 1s ease-out 0.5s both;
        }

        .cta-buttons {
            animation: slideInUp 1s ease-out 0.8s both;
        }

        .cta-btn {
            display: inline-block;
            padding: 15px 35px;
            margin: 0 10px 10px;
            background: linear-gradient(45deg, #00f2fe, #4facfe);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.4s ease;
            box-shadow: 0 8px 25px rgba(79, 172, 254, 0.3);
            position: relative;
            overflow: hidden;
        }

        .cta-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s ease;
        }

        .cta-btn:hover::before {
            left: 100%;
        }

        .cta-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(79, 172, 254, 0.4);
            color: white;
        }

        /* Enhanced Features Section */
        .features-container {
            padding: 80px 0;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 25px;
            margin: 50px auto;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .section-title {
            text-align: center;
            color: white;
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            animation: slideInUp 0.8s ease-out;
        }

        .section-subtitle {
            text-align: center;
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.2rem;
            margin-bottom: 60px;
            animation: slideInUp 0.8s ease-out 0.2s both;
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border: none;
            border-radius: 20px;
            padding: 40px 30px;
            margin-bottom: 30px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
            height: 100%;
            opacity: 0;
            transform: translateY(50px);
            animation: cardSlideIn 0.8s ease-out forwards;
        }

        .feature-card:nth-child(1) { animation-delay: 0.2s; }
        .feature-card:nth-child(2) { animation-delay: 0.4s; }
        .feature-card:nth-child(3) { animation-delay: 0.6s; }
        .feature-card:nth-child(4) { animation-delay: 0.8s; }
        .feature-card:nth-child(5) { animation-delay: 1.0s; }
        .feature-card:nth-child(6) { animation-delay: 1.2s; }

        @keyframes cardSlideIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, 
                rgba(102, 126, 234, 0.1), 
                rgba(79, 172, 254, 0.1));
            transition: left 0.6s ease;
            z-index: 0;
        }

        .feature-card:hover::before {
            left: 0;
        }

        .feature-card:hover {
            transform: translateY(-15px) scale(1.02);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        }

        .card-content {
            position: relative;
            z-index: 1;
            text-align: center;
        }

        .card-icon {
            font-size: 4rem;
            background: linear-gradient(45deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 25px;
            transition: all 0.4s ease;
            display: inline-block;
        }

        .feature-card:hover .card-icon {
            transform: scale(1.2) rotateY(360deg);
            filter: drop-shadow(0 0 15px rgba(102, 126, 234, 0.3));
        }

        .card-title {
            font-weight: 700;
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #333;
            transition: color 0.3s ease;
        }

        .feature-card:hover .card-title {
            color: #667eea;
        }

        .card-description {
            color: #666;
            font-size: 1rem;
            line-height: 1.6;
            font-weight: 400;
        }

        /* Stats Section */
        .stats-section {
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.05));
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 60px 0;
            margin: 50px auto;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .stat-item {
            text-align: center;
            color: white;
            padding: 20px;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 800;
            background: linear-gradient(45deg, #4facfe, #00f2fe);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: block;
            animation: countUp 2s ease-out;
        }

        .stat-label {
            font-size: 1.1rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
            opacity: 0.9;
        }

        @keyframes countUp {
            from { transform: scale(0); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        /* Animations */
        @keyframes slideInDown {
            from {
                transform: translateY(-100px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

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

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-section {
                padding: 80px 20px 60px;
                margin: 20px 15px;
            }

            .hero-section h1 {
                font-size: 2.5rem;
            }

            .hero-section .hero-icon {
                font-size: 3rem;
                margin-right: 10px;
            }

            .hero-section p {
                font-size: 1.1rem;
            }

            .features-container {
                margin: 30px 15px;
                padding: 60px 20px;
            }

            .section-title {
                font-size: 2.2rem;
            }

            .feature-card {
                margin-bottom: 20px;
            }

            .cta-btn {
                display: block;
                margin: 10px auto;
                max-width: 250px;
            }
        }

        @media (max-width: 480px) {
            .hero-section h1 {
                font-size: 2rem;
            }

            .section-title {
                font-size: 1.8rem;
            }

            .card-icon {
                font-size: 3rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <!-- Floating Books Background -->
    <div class="floating-books"></div>

    <!-- Enhanced Hero Section -->
    <div class="container-fluid">
        <div class="hero-section container">
            <div class="hero-content">
                <h1>
                    <i class="fas fa-book hero-icon"></i>
                    Library Management System
                </h1>
                <p class="lead">Streamline your library operations with our comprehensive management platform</p>
                <div class="cta-buttons">
                    <a href="#" class="cta-btn">
                        <i class="fas fa-search me-2"></i>Catalog Search
                    </a>
                    <a href="#" class="cta-btn">
                        <i class="fas fa-user-cog me-2"></i>Admin Portal
                    </a>
                </div>
            </div>
        </div>

        <!-- Stats Section -->
        <div class="stats-section container">
            <div class="row">
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">15K+</span>
                        <div class="stat-label">Books in Collection</div>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">2.5K+</span>
                        <div class="stat-label">Active Members</div>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">98%</span>
                        <div class="stat-label">Satisfaction Rate</div>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">24/7</span>
                        <div class="stat-label">Digital Access</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Enhanced Features Section -->
        <div class="features-container container">
            <h2 class="section-title">Library Management Features</h2>
            <p class="section-subtitle">Comprehensive tools for modern library administration</p>
            
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card h-100">
                        <div class="card-content">
                            <i class="fas fa-book-open card-icon"></i>
                            <h5 class="card-title">Catalog Management</h5>
                            <p class="card-description">
                                Efficiently organize and manage your entire book collection with advanced cataloging tools, 
                                ISBN tracking, and automated inventory updates.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card h-100">
                        <div class="card-content">
                            <i class="fas fa-user-friends card-icon"></i>
                            <h5 class="card-title">Member Management</h5>
                            <p class="card-description">
                                Handle member registrations, renewals, and profiles seamlessly. 
                                Track borrowing history and manage membership categories with ease.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card h-100">
                        <div class="card-content">
                            <i class="fas fa-exchange-alt card-icon"></i>
                            <h5 class="card-title">Issue & Return</h5>
                            <p class="card-description">
                                Streamline book issuing and return processes with barcode scanning, 
                                automated due date tracking, and fine calculation systems.
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card h-100">
                        <div class="card-content">
                            <i class="fas fa-chart-line card-icon"></i>
                            <h5 class="card-title">Analytics & Reports</h5>
                            <p class="card-description">
                                Generate detailed reports on circulation, popular books, member activity, 
                                and library usage patterns for informed decision-making.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card h-100">
                        <div class="card-content">
                            <i class="fas fa-calendar-check card-icon"></i>
                            <h5 class="card-title">Reservation System</h5>
                            <p class="card-description">
                                Allow members to reserve books online, manage waiting lists, 
                                and receive automated notifications when books become available.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card h-100">
                        <div class="card-content">
                            <i class="fas fa-shield-alt card-icon"></i>
                            <h5 class="card-title">Security & Backup</h5>
                            <p class="card-description">
                                Ensure data security with role-based access control, automated backups, 
                                and comprehensive audit trails for all library transactions.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Create floating books animation
            const floatingBooksContainer = document.querySelector('.floating-books');
            const bookIcons = ['📚', '📖', '📕', '📗', '📘', '📙', '📓', '📔'];
            
            function createFloatingBook() {
                const book = document.createElement('div');
                book.className = 'floating-book';
                book.textContent = bookIcons[Math.floor(Math.random() * bookIcons.length)];
                book.style.left = Math.random() * 100 + '%';
                book.style.animationDuration = (Math.random() * 10 + 10) + 's';
                book.style.animationDelay = Math.random() * 2 + 's';
                
                floatingBooksContainer.appendChild(book);
                
                // Remove the book after animation completes
                setTimeout(() => {
                    book.remove();
                }, 17000);
            }
            
            // Create floating books periodically
            setInterval(createFloatingBook, 3000);
            
            // Initial books
            for(let i = 0; i < 5; i++) {
                setTimeout(createFloatingBook, i * 1000);
            }
            
            // Intersection Observer for animations
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };
            
            const observer = new IntersectionObserver(function(entries) {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate');
                    }
                });
            }, observerOptions);
            
            // Observe elements for animation
            document.querySelectorAll('.feature-card, .stat-item').forEach(el => {
                observer.observe(el);
            });
            
            // Smooth scrolling for CTA buttons
            document.querySelectorAll('.cta-btn').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    e.preventDefault();
                    // Add your navigation logic here
                    console.log('CTA button clicked:', this.textContent.trim());
                });
            });
        });
    </script>
</asp:Content>