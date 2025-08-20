<%@ Page Title="Home - E-Book Store" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hero-section {
            background-image: url('images/homeBanner.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            padding: 100px 20px;
            text-align: center;
            border-radius: 10px;
            position: relative;
        }

            .hero-section::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.6); /* dark overlay */
                z-index: 0;
                border-radius: 10px;
            }

            .hero-section h1, .hero-section p {
                position: relative;
                z-index: 1;
            }

            .hero-section h1 {
                font-size: 3rem;
                margin-bottom: 15px;
            }

        .card-icon {
    font-size: 40px;
    color: #007bff;
    transition: all 0.3s ease; /* 👈 Smooth transition */
}

.card-icon:hover {
    transform: scale(1.5);
    color: #0056b3; /* optional: slightly darker blue on hover */
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

    <!-- Hero Section -->
    <!-- Hero Section with Image -->
    <div class="hero-section mb-5">
        <h1><i class="fas fa-book-reader"></i>Welcome to E-Book Store</h1>
        <p class="lead">Explore a world of knowledge — anytime, anywhere!</p>
    </div>

    <!-- Features Section -->
    <div class="container">
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <i class="fas fa-book card-icon mb-3"></i>
                        <h5 class="card-title">Browse Books</h5>
                        <p class="card-text">Explore a wide range of categories, genres, and titles. Find your next favorite book today.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <i class="fas fa-user-plus card-icon mb-3"></i>
                        <h5 class="card-title">Join as a Member</h5>
                        <p class="card-text">Sign up to create your personal bookshelf, track reading progress, and more.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <i class="fas fa-headset card-icon mb-3"></i>
                        <h5 class="card-title">Support</h5>
                        <p class="card-text">Need help? Reach out to our team for support and assistance anytime.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
