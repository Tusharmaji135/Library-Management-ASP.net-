<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewBooks.aspx.cs" Inherits="WebApplication3.viewBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

    <style>
        .card {
            background-color: #fff;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            margin-top: 20px;
            overflow-x: auto;
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
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card p-4">
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <h3>Book Inventory List</h3>
                        </div>

                        <div class="table-responsive" style="max-height: 700px; overflow-y: auto;">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookStoreDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>

                            <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-10">
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("book_name") %>' />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                Author -
                                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>' />
                                                                &nbsp;| Genre -
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>' />
                                                                &nbsp;| Language -
                                                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>' />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                Publisher -
                                                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>' />
                                                                &nbsp;| Publish Date -
                                                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>' />
                                                                &nbsp;| Pages -
                                                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>' />
                                                                &nbsp;| Edition -
                                                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>' />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                Cost -
                                                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") + "₹" %>' />
                                                                &nbsp;| Actual Stock -
                                                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>' />
                                                                &nbsp;| Available -
                                                                <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>' />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                Description -
                                                                <asp:Label ID="Label12" Font-Size="Smaller" runat="server" Font-Bold="True" Text='<%# Eval("book_description") %>' />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <asp:Image ID="Image1" CssClass="img-fluid" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Back link -->
<div class="text-center mt-3">
    <a href="homepage.aspx" class="back-link"><i class="fas fa-arrow-left"></i> Back to Home</a>
</div>
    </div>
</asp:Content>
