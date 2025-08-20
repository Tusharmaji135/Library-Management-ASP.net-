<%@ Page Title="Member Login - E-Book Store" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="WebApplication3.userlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .login-card {
            margin-top: 60px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }

        .login-title {
            font-weight: bold;
            color: #333;
        }

        .form-icon {
            font-size: 80px;
            color: #0d6efd;
            margin-bottom: 10px;
        }

        a.back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #0d6efd;
        }

            a.back-link:hover {
                text-decoration: underline;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card login-card">
                    <div class="card-body">
                        <div class="text-center mb-4">

                            <i class="fas fa-user-circle form-icon"></i>
                            <br />
                            <h3 class="login-title">Member Login</h3>
                        </div>

                        <div class="mb-3">
                            <label for="TextBox1" class="form-label">Member ID</label>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Enter your Member ID" runat="server"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <label for="TextBox2" class="form-label">Password</label>
                            <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Enter your password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="d-grid gap-2 mb-2">
                            <asp:Button ID="Button1" CssClass="btn btn-success btn-lg" runat="server" Text="Login" OnClick="Button1_Click" />
                        </div>

                        <div class="d-grid gap-2">
                            <div class="text-center">
                                <small>New to store?</small>
                                <a href="usersignup.aspx" class="back-link">Register now</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <a href="homepage.aspx" class="back-link"><i class="fas fa-arrow-left"></i>Back to Home</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
