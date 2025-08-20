<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminBookIssuing.aspx.cs" Inherits="WebApplication3.adminBookIssuing" %>

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
    <div class=" container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card p-4">
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <h3>Book Issuing</h3>
                            <img src="images/books.png" width="90" alt="Books" />
                        </div>

                        <div class="row">

                            <div class="col-md-6 mb-3">
                                <label>Member ID</label>
                                <asp:TextBox ID="TextBox6" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Book ID</label>
                                <div class="input-group">

                                    <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="ID" runat="server"></asp:TextBox>
                                    <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="GO" OnClick="Button2_Click" />
                                </div>

                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-6 mb-3">
                                <label>Member Name</label>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Member Name" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Book Name</label>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Book Name" runat="server" ReadOnly="True"></asp:TextBox>

                            </div>
                        </div>

                        <div class="row">

    <div class="col-md-6 mb-3">
        <label>Start Date</label>
        <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="Start date" runat="server" TextMode="Date"></asp:TextBox>
    </div>
    <div class="col-md-6 mb-3">
        <label>End Date</label>
            <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="End date" runat="server" TextMode="Date"></asp:TextBox>

    </div>
</div>

                        <div class="row">
                            
                            <div class="col-6">

                                <asp:Button ID="Button3" CssClass="btn btn-primary w-100 btn-lg" runat="server" Text="ISSUE" OnClick="Button3_Click" />
                            </div>
                            <div class="col-6">

                                <asp:Button ID="Button4" CssClass="btn btn-success w-100 btn-lg" runat="server" Text="RETURN" OnClick="Button4_Click" />
                            </div>
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
                            <h3>Issued Books</h3>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookStoreDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                        <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="member_id" HeaderText="ID" SortExpression="member_id" />
                                <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

