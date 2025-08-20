<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminBookInventory.aspx.cs" Inherits="WebApplication3.adminBookInventory" %>

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
    <div class="container-fluid">
        <div class="row">
            <!-- Left: Book Form -->
            <div class="col-md-5">
                <div class="card p-4">
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <h3>Book Details</h3>
                            <img id="imgview" src="images/books.png" width="90" alt="User" />
                        </div>

                        <!-- Upload -->
                        <div class="row mb-3">
                            <div class="col">
                                <asp:FileUpload onchange="readURL(this)" CssClass="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>

                        <!-- Book ID and Name -->
                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <label>Book ID</label>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="ID" runat="server" />
                                    
                                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="GO" OnClick="Button1_Click"/>
                                </div>
                            </div>
                            <div class="col-md-9 mb-3">
                                <label>Book Name</label>
                                <asp:TextBox ID="TextBox6" CssClass="form-control" placeholder="Book Name" runat="server" />
                            </div>
                        </div>

                        <!-- Language, Publisher, Author, Date -->
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label>Language</label>
                                <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                    <asp:ListItem Text="English" Value="English" />
                                    <asp:ListItem Text="Hindi" Value="Hindi" />
                                    <asp:ListItem Text="Marathi" Value="Marathi" />
                                    <asp:ListItem Text="French" Value="French" />
                                    <asp:ListItem Text="Japanese" Value="Japanese" />
                                    <asp:ListItem Text="German" Value="German" />
                                </asp:DropDownList>

                                <label>Publisher Name</label>
                                <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                    <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                    <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label>Author Name</label>
                                <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server">
                                    <asp:ListItem Text="A1" Value="A1" />
                                    <asp:ListItem Text="A2" Value="A2" />
                                </asp:DropDownList>

                                <label>Publish Date</label>
                                <asp:TextBox ID="TextBox1" TextMode="Date" CssClass="form-control" runat="server" />
                            </div>

                            <div class="col-md-4 mb-3">
                                <label>Genre</label>
                                <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="4">
                                    <asp:ListItem Text="Action" Value="Action" />
                                    <asp:ListItem Text="Adventure" Value="Adventure" />
                                    <asp:ListItem Text="Motivation" Value="Motivation" />
                                    <asp:ListItem Text="Romance" Value="Romance" />
                                    <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                    <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                    <asp:ListItem Text="Mystery" Value="Mystery" />
                                    <asp:ListItem Text="Horror" Value="Horror" />
                                    <asp:ListItem Text="Historical" Value="Historical" />
                                    <asp:ListItem Text="Biography" Value="Biography" />
                                    <asp:ListItem Text="Self-Help" Value="Self-Help" />
                                    <asp:ListItem Text="Thriller" Value="Thriller" />
                                </asp:ListBox>
                            </div>
                        </div>

                        <!-- Edition, Cost, Pages -->
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label>Edition</label>
                                <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="Edition" runat="server" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>Book Cost</label>
                                <asp:TextBox ID="TextBox4" TextMode="Number" CssClass="form-control" placeholder="Book Cost" runat="server" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>Pages</label>
                                <asp:TextBox ID="TextBox8" TextMode="Number" CssClass="form-control" placeholder="Pages" runat="server" />
                            </div>
                        </div>

                        <!-- Stock, Current, Issued -->
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label>Actual Stock</label>
                                <asp:TextBox ID="TextBox2" TextMode="Number" CssClass="form-control" placeholder="Actual Stock" runat="server" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>Current Stock</label>
                                <asp:TextBox ID="TextBox7" TextMode="Number" CssClass="form-control" ReadOnly="true" placeholder="Current Stock" runat="server" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>Issued Books</label>
                                <asp:TextBox ID="TextBox10" TextMode="Number" CssClass="form-control" ReadOnly="true" placeholder="Issued Books" runat="server" />
                            </div>
                        </div>

                        <!-- Description -->
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label>Description</label>
                                <asp:TextBox ID="TextBox9" CssClass="form-control" placeholder="Description" runat="server" TextMode="MultiLine" Rows="2" />
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button30" CssClass="btn btn-success w-100 btn-lg" runat="server" Text="ADD" OnClick="Button30_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button32" CssClass="btn btn-warning w-100 btn-lg" runat="server" Text="UPDATE" OnClick="Button32_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button33" CssClass="btn btn-danger w-100 btn-lg" runat="server" Text="DELETE" OnClick="Button33_Click" />
                            </div>
                        </div>

                        <!-- Back link -->
                        <div class="text-center mt-3">
                            <a href="homepage.aspx" class="back-link"><i class="fas fa-arrow-left"></i> Back to Home</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right: Book Inventory List -->
            <div class="col-md-7">
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
                                                                Author - <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>' />
                                                                &nbsp;| Genre - <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>' />
                                                                &nbsp;| Language - <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>' />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                Publisher - <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>' />
                                                                &nbsp;| Publish Date - <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>' />
                                                                &nbsp;| Pages - <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>' />
                                                                &nbsp;| Edition - <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>' />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                Cost - <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") + "₹" %>' />
                                                                &nbsp;| Actual Stock - <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>' />
                                                                &nbsp;| Available - <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>' />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                Description - <asp:Label ID="Label12" Font-Size="Smaller" runat="server" Font-Bold="True" Text='<%# Eval("book_description") %>' />
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
    </div>
</asp:Content>
