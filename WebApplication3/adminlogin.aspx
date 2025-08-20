<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="WebApplication3.adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background: url('images/bg-login.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 15px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
        }

        h3 {
            font-weight: 600;
            color: #333;
        }

        a.back-link {
            color: #007bff;
            text-decoration: none;
            display: inline-block;
            margin-top: 15px;
        }

        a.back-link:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="login-container">
        <div class="col-md-6 col-lg-6">
            <div class="card p-4">
                <div class="card-body">
                    <div class="text-center mb-3">
                        <img src="images/admin.png" alt="Admin Icon" width="120" class="mb-2" />
                        <h3>Admin Login</h3>
                    </div>

                    <hr />

                    <div class="mb-3">
                        <label for="TextBox1" class="form-label">Admin ID</label>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Enter Admin ID" runat="server"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label for="TextBox2" class="form-label">Password</label>
                        <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                    </div>

                    <asp:Button ID="Button1" CssClass="btn btn-success w-100 btn-lg" runat="server" Text="Login" OnClick="Button1_Click" />

                    <div class="text-center mt-3">
                        <a href="homepage.aspx" class="back-link">&laquo; Back to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
