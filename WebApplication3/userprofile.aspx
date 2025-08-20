<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="WebApplication3.userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
     </script>
    <!-- Font Awesome 5 CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />

    <style>
        .card {
            background-color: rgba(255, 255, 255, 0.97);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            border-radius: 15px;
            margin-top: 20px;
        }

        .form-icon {
            font-size: 70px;
            color: #6c757d;
            margin-bottom: 10px;
        }

        h3 {
            font-weight: 700;
            color: #343a40;
            margin-bottom: 10px;
        }

        label {
            font-weight: 500;
            color: #333;
        }

        .section-title {
            font-size: 1rem;
            font-weight: 600;
            margin-top: 20px;
            display: inline-block;
            background: #343a40;
            color: #fff;
            padding: 5px 15px;
            border-radius: 10px;
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

        .btn-lg {
            font-size: 1.1rem;
            padding: 10px;
            border-radius: 8px;
        }

        .gridview-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: #28a745;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <!-- Left Column: Profile Info -->
            <div class="col-md-5">
                <div class="card p-4">
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <i class="fas fa-user-circle form-icon"></i>
                            <h3>Profile</h3>
                            <span>Account Status - </span>
                            <asp:Label CssClass="badge bg-info" ID="Label1" runat="server" Text="Active"></asp:Label>
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
                                    <asp:ListItem Text="Select State" Value="" />
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

                        <div class="text-center mt-4 mb-3">
                            <span class="section-title"><i class="fas fa-lock"></i> Login Credentials</span>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-4 mb-3">
                                <label>Member ID</label>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Member ID" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>Old Password</label>
                                <asp:TextBox ID="TextBox8" CssClass="form-control" placeholder="Old Password" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>New Password</label>
                                <asp:TextBox ID="TextBox9" CssClass="form-control" TextMode="Password" placeholder="New Password" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Button ID="Button1" CssClass="btn btn-success w-100 btn-lg" runat="server" Text="Update" OnClick="Button1_Click1" />
                        </div>

                        <div class="text-center">
                            <a href="homepage.aspx" class="back-link"><i class="fas fa-arrow-left"></i> Back to Home</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column: Issued Books -->
            <div class="col-md-7">
                <div class="card p-4">
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <img src="images/books.png" width="90" alt="Books" />
                            <h3>Issued Books</h3>
                            <asp:Label CssClass="badge bg-success " ID="Label2" runat="server" Text="Books Details"></asp:Label>
                        </div>

                        <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server" ></asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
