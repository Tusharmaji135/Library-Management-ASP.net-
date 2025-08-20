<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminMemberManagement.aspx.cs" Inherits="WebApplication3.adminMemberManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />

    <style>
        .card {
            background-color: #fff;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            margin-top: 20px;
           overflow-x: auto; /* Fix added */
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
            margin-top: 20px;
            display: inline-block;
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
            <!-- Left: Member Details -->
            <div class="col-md-6">
                <div class="card p-4">
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <h3>Member Details</h3>
                            <img src="images/user.png" width="90" alt="User" />
                        </div>

                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <label>Member ID</label>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="ID" runat="server" />
                                    <asp:LinkButton TabIndex="1" ID="LinkButton4" CssClass="btn btn-primary" runat="server" OnClick="LinkButton4_Click">
                                        <i class="fas fa-check-circle"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label>Full Name</label>
                                <asp:TextBox ID="TextBox6" CssClass="form-control" placeholder="Full Name" runat="server" ReadOnly="true" />
                            </div>

                            <div class="col-md-5 mb-3">
                                <label>Account Status</label>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox7" CssClass="form-control" placeholder="Status" runat="server" ReadOnly="true"/>
                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success me-1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" CssClass="btn btn-warning me-1" runat="server" OnClick="LinkButton2_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" CssClass="btn btn-danger me-1" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <label>DOB</label>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="DOB" runat="server" ReadOnly="true" />
                            </div>

                            <div class="col-md-4 mb-3">
                                <label>Contact No</label>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Contact No" runat="server" ReadOnly="true" />
                            </div>

                            <div class="col-md-5 mb-3">
                                <label>Email ID</label>
                                <asp:TextBox ID="TextBox10" CssClass="form-control" placeholder="Email" runat="server" ReadOnly="true" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label>State</label>
                                <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="State" runat="server" ReadOnly="true" />
                            </div>

                            <div class="col-md-4 mb-3">
                                <label>City</label>
                                <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="City" runat="server" ReadOnly="true" />
                            </div>

                            <div class="col-md-4 mb-3">
                                <label>Pincode</label>
                                <asp:TextBox ID="TextBox8" CssClass="form-control" placeholder="Pincode" runat="server" ReadOnly="true" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label>Postal Address</label>
                                <asp:TextBox ID="TextBox9" CssClass="form-control" placeholder="Address" runat="server" ReadOnly="true" TextMode="MultiLine" Rows="2" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <asp:Button ID="Button3" CssClass="btn btn-danger w-100 btn-lg" UseSubmitBehavior="false" runat="server" Text="DELETE USER PERMANENTLY" OnClick="Button3_Click" TabIndex="4" />
                            </div>
                        </div>

                        <div class="text-center">
                            <a href="homepage.aspx" class="back-link"><i class="fas fa-arrow-left"></i> Back to Home</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right: Member List -->
            <div class="col-md-6">
                <div class="card p-4">
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <h3>Members List</h3>
                        </div>
                        <div class="table-responsive">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:bookStoreDBConnectionString %>"
                                SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>

                            <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server"
                                AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                    <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                    <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                                    <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                    <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                                    <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                    <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
