<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="WebApplication3.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* About Section */
        .about-section {
            background: #f9f9f9;
            padding: 60px 20px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            animation: fadeIn 1s ease-in-out;
        }

        .about-section h1 {
            font-size: 2.8rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .about-section p {
            font-size: 1.15rem;
            line-height: 1.8;
            color: #555;
            max-width: 900px;
            margin: auto;
            text-align: center;
        }

        .about-image {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .about-image:hover {
            transform: scale(1.05);
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">

    <div class="container my-5">
        <div class="about-section">
            <h1>About Our Library</h1>
            <p>
                Welcome to the <strong>College Library Management System</strong> — your one-stop platform 
                for managing books, journals, and digital resources with ease. 
                Our system is designed to help students, faculty, and staff access and organize 
                library materials anytime, anywhere.
            </p>
            <p>
                With features like book search, issue & return tracking, and digital catalog management, 
                our library aims to provide a seamless experience for every reader. 
                Whether you're preparing for academics, conducting research, or simply exploring new topics, 
                we make knowledge accessible at your fingertips.
            </p>
            <p>
                Our mission is to create a smart and user-friendly environment that encourages 
                learning, collaboration, and innovation through efficient library services.
            </p>
        </div>
    </div>

</asp:Content>
