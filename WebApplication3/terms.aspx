<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="terms.aspx.cs" Inherits="WebApplication3.terms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Terms Section */
        .terms-section {
            background: #fff;
            padding: 60px 20px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            animation: fadeIn 1s ease-in-out;
        }

        .terms-section h1 {
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .terms-section p,
        .terms-section li {
            font-size: 1.05rem;
            line-height: 1.7;
            color: #555;
        }

        .terms-section ul {
            padding-left: 20px;
            margin-top: 15px;
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
        <div class="terms-section">
            <h1>Library Terms and Conditions</h1>
            <p>
                Please read the following terms and conditions carefully before using the 
                <strong>College Library Management System</strong>. By accessing or using our services, 
                you agree to comply with these rules and regulations.
            </p>

            <ul>
                <li><strong>1. Membership:</strong> Only registered students, faculty, and authorized staff are permitted to access library resources.</li>
                <li><strong>2. Borrowing Policy:</strong> Books and resources must be borrowed using a valid library account. Each member has a borrowing limit depending on their membership type.</li>
                <li><strong>3. Return of Books:</strong> Borrowed items must be returned on or before the due date. Late returns may attract fines as per library policy.</li>
                <li><strong>4. Digital Resources:</strong> Access to e-books, journals, and digital materials is for personal academic use only. Sharing login credentials is strictly prohibited.</li>
                <li><strong>5. Damaged or Lost Books:</strong> Members are responsible for the safekeeping of borrowed books. In case of damage or loss, replacement charges must be paid.</li>
                <li><strong>6. Prohibited Use:</strong> Any misuse of the library system, including unauthorized access, plagiarism, or altering digital records, is strictly prohibited.</li>
                <li><strong>7. Code of Conduct:</strong> Users must maintain silence, discipline, and respect for other members while accessing library services.</li>
                <li><strong>8. Changes to Terms:</strong> The library reserves the right to update or modify these terms at any time. Continued use of services implies acceptance of the revised terms.</li>
            </ul>

            <p class="mt-4">
                If you have any questions about these terms, please contact the <strong>Library Help Desk</strong>.
            </p>
        </div>
    </div>

</asp:Content>
