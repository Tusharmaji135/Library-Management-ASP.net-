<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="WebApplication3.usersignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            /*            background: url('images/k.jpg') no-repeat center center fixed;
            background-size: cover;*/
        }

        .signup-container {
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

        .form-icon {
            font-size: 80px;
            color: #6c757d;
            margin-bottom: 10px;
        }

        .section-title {
            font-size: 1rem;
            margin-top: 20px;
        }

        a.back-link {
            color: #007bff;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }

            a.back-link:hover {
                text-decoration: underline;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="signup-container">
        <div class="col-md-10 col-lg-8">
            <div class="card p-4">
                <div class="card-body">
                    <div class="text-center mb-4">
                        <i class="fas fa-user-circle form-icon"></i>
                        <h3>Member Sign Up</h3>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Full Name</label>
                            <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Date of Birth</label>
                            <asp:TextBox ID="TextBox6" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Contact No</label>
                            <asp:TextBox ID="TextBox3" CssClass="form-control" TextMode="Number" placeholder="Contact Number" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Email ID</label>
                            <asp:TextBox ID="TextBox4" CssClass="form-control" TextMode="Email" placeholder="Email Address" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label>State</label>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                                <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                <asp:ListItem>Assam</asp:ListItem>
                                <asp:ListItem>Bihar</asp:ListItem>
                                <asp:ListItem>Chhattisgarh</asp:ListItem>
                                <asp:ListItem>Goa</asp:ListItem>
                                <asp:ListItem>Gujarat</asp:ListItem>
                                <asp:ListItem>Haryana</asp:ListItem>
                                <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                <asp:ListItem>Jharkhand</asp:ListItem>
                                <asp:ListItem>Karnataka</asp:ListItem>
                                <asp:ListItem>Kerala</asp:ListItem>
                                <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                <asp:ListItem>Maharashtra</asp:ListItem>
                                <asp:ListItem>Manipur</asp:ListItem>
                                <asp:ListItem>Meghalaya</asp:ListItem>
                                <asp:ListItem>Mizoram</asp:ListItem>
                                <asp:ListItem>Nagaland</asp:ListItem>
                                <asp:ListItem>Odisha</asp:ListItem>
                                <asp:ListItem>Punjab</asp:ListItem>
                                <asp:ListItem>Rajasthan</asp:ListItem>
                                <asp:ListItem>Sikkim</asp:ListItem>
                                <asp:ListItem>Tamil Nadu</asp:ListItem>
                                <asp:ListItem>Telangana</asp:ListItem>
                                <asp:ListItem>Tripura</asp:ListItem>
                                <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                <asp:ListItem>Uttarakhand</asp:ListItem>
                                <asp:ListItem>West Bengal</asp:ListItem>
                                <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                <asp:ListItem>Chandigarh</asp:ListItem>
                                <asp:ListItem>Dadra and Nagar Haveli and Daman and Diu</asp:ListItem>
                                <asp:ListItem>Delhi</asp:ListItem>
                                <asp:ListItem>Lakshadweep</asp:ListItem>
                                <asp:ListItem>Puducherry</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="col-md-4 mb-3">
                            <label>City</label>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                <asp:ListItem Text="Select" Value="select"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Pincode</label>
                            <asp:TextBox ID="TextBox7" CssClass="form-control" TextMode="Number" placeholder="Pincode" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label>Address</label>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" TextMode="MultiLine" Rows="2" placeholder="Address" runat="server"></asp:TextBox>
                    </div>

                    <div class="text-center">
                        <span class="badge bg-dark section-title">Login Credentials</span>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6 mb-3">
                            <label>User ID</label>
                            <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="User ID" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Password</label>
                            <asp:TextBox ID="TextBox8" CssClass="form-control" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="Button1" CssClass="btn btn-success w-100 btn-lg" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                    </div>
                    <div class="text-center">
                        <small>Already a member?</small>
                        <a href="userlogin.aspx" class="back-link">Login</a>
                    </div>

                    <div class="text-center">
                        <a href="homepage.aspx" class="back-link">&laquo; Back to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
