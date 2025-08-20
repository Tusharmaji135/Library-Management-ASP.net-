using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class adminBookInventory : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillAuthorPublisherValue();
                GridView1.DataBind();
            }
        }


        //go button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExist())
            {
                GetBookById();
            }
            else
            {
                Response.Write("<script>alert('Book does not exist with this ID, try another one!')</script>");
            }
        }

        //add button
        protected void Button30_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExist())
            {
                Response.Write("<script>alert('Book already exists with this ID, try another one!')</script>");
            }
            else
            {
                AddNewBook();
            }
        }

        //update button
        protected void Button32_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExist())
            {
                UpdateBookById();
            }
            else
            {
                Response.Write("<script>alert('Book not exists with this ID, try another one!')</script>");

            }
        }

        //delete button
        protected void Button33_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExist())
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(strCon))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("DELETE FROM book_master_tbl WHERE book_id=@id", con);
                        cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());

                        int result = cmd.ExecuteNonQuery();
                        if (result > 0)
                        {
                            Response.Write("<script>alert('book8 deleted successfully!')</script>");
                            ClearForm();
                            GridView1.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('Deletion failed.')</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Book not exists with this ID, try another one!')</script>");
            }
        }

        //udef func
        void FillAuthorPublisherValue()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tbl;", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    DropDownList3.DataSource = dt;
                    DropDownList3.DataTextField = "author_name";  // What user sees
                    DropDownList3.DataValueField = "author_name"; // What value is used internally
                    DropDownList3.DataBind();

                    cmd = new SqlCommand("SELECT publisher_name FROM publisher_master_tbl;", con);
                    da = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    da.Fill(dt);

                    DropDownList2.DataSource = dt;
                    DropDownList2.DataTextField = "publisher_name";  // What user sees
                    DropDownList2.DataValueField = "publisher_name"; // What value is used internally
                    DropDownList2.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
            }

        }

        void AddNewBook()
        {
            try
            {
                // Genre
                string genres = string.Join(",", ListBox1.Items.Cast<ListItem>()
                                         .Where(i => i.Selected)
                                         .Select(i => i.Text));

                // File path
                string filepath = "~/book_inventory/books1.png"; // default
                if (FileUpload1.HasFile)
                {
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                    filepath = "~/book_inventory/" + filename;
                }

                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"
                INSERT INTO book_master_tbl 
                (book_id, book_name, genre, author_name, publisher_name, publish_date, language, edition, book_cost, no_of_pages, book_description, actual_stock, current_stock, book_img_link) 
                VALUES 
                (@book_id, @book_name, @genre, @author_name,
                 @publisher_name, @publish_date, @language, @edition,
                 @book_cost, @no_of_pages, @book_description, @actual_stock,
                 @current_stock, @book_img_link)", con);

                    cmd.Parameters.AddWithValue("@book_id", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", decimal.Parse(TextBox4.Text.Trim()));
                    cmd.Parameters.AddWithValue("@no_of_pages", int.Parse(TextBox8.Text.Trim()));
                    cmd.Parameters.AddWithValue("@book_description", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", int.Parse(TextBox2.Text.Trim()));
                    cmd.Parameters.AddWithValue("@current_stock", int.Parse(TextBox2.Text.Trim()));
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Book added successfully!')</script>");
                        ClearForm();
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('Error adding book. Please try again.')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
                // Optional: Log error
            }
        }


        // Check if Book Exists
        bool CheckIfBookExist()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id=@id", con);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt.Rows.Count > 0;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
                return false;
            }
        }

        //clear form
        void ClearForm()
        {
            TextBox5.Text = "";
            TextBox6.Text = "";
            DropDownList3.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            TextBox1.Text = "";
            DropDownList1.SelectedIndex = 0;
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            FileUpload1.Attributes.Clear();
            ListBox1.ClearSelection();
        }

        //getBookById
        void GetBookById()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id=@id", con);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        ClearForm();
                        // Populate the form fields with the data
                        TextBox5.Text = dt.Rows[0]["book_id"].ToString();
                        TextBox6.Text = dt.Rows[0]["book_name"].ToString();
                        DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString();
                        DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString();
                        TextBox1.Text = dt.Rows[0]["publish_date"].ToString();
                        DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString();
                        TextBox3.Text = dt.Rows[0]["edition"].ToString();
                        TextBox4.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                        TextBox8.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                        TextBox9.Text = dt.Rows[0]["book_description"].ToString();
                        TextBox2.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                        TextBox7.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                        TextBox10.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));
                        // Handle genres
                        string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                        ListBox1.ClearSelection();
                        for (int i = 0; i < genre.Length; i++)
                        {
                            for (int j = 0; j < ListBox1.Items.Count; j++)
                            {
                                if (ListBox1.Items[j].ToString() == genre[i])
                                {
                                    ListBox1.Items[j].Selected = true;
                                }

                            }
                        }

                        global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                        global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                        global_issued_books = global_actual_stock - global_current_stock;
                        global_filepath = dt.Rows[0]["book_img_link"].ToString();



                    }
                    else
                    {
                        Response.Write("<script>alert('No book found with this ID.')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
            }
        }

        //update by id
        void UpdateBookById()
        {
            try
            {
                // Genre
                string genres = string.Join(",", ListBox1.Items.Cast<ListItem>()
                                             .Where(i => i.Selected)
                                             .Select(i => i.Text));

                // issued book
                int actual_stock = Convert.ToInt32(TextBox2.Text.Trim());
                int current_stock = Convert.ToInt32(TextBox7.Text.Trim());

                if (global_actual_stock != actual_stock)
                {
                    if (actual_stock < global_issued_books)
                    {
                        Response.Write("<script>alert('Actual stock value cannot be less than issued books')</script>");
                        return;
                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_books;
                        TextBox7.Text = current_stock.ToString();
                    }
                }

                // File path
                string filepath = global_filepath; // keep old file if no new file
                if (FileUpload1.HasFile)
                {
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                    filepath = "~/book_inventory/" + filename;
                }

                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"
                UPDATE book_master_tbl 
                SET 
                    book_name = @book_name,
                    genre = @genre,
                    author_name = @author_name,
                    publisher_name = @publisher_name,
                    publish_date = @publish_date,
                    language = @language,
                    edition = @edition,
                    book_cost = @book_cost,
                    no_of_pages = @no_of_pages,
                    book_description = @book_description,
                    actual_stock = @actual_stock,
                    current_stock = @current_stock,
                    book_img_link = @book_img_link
                WHERE book_id = @book_id", con);

                    cmd.Parameters.AddWithValue("@book_id", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", decimal.Parse(TextBox4.Text.Trim()));
                    cmd.Parameters.AddWithValue("@no_of_pages", int.Parse(TextBox8.Text.Trim()));
                    cmd.Parameters.AddWithValue("@book_description", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock);
                    cmd.Parameters.AddWithValue("@current_stock", current_stock);
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Book updated successfully!')</script>");
                        ClearForm();
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('Book not found.')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
            }
        }





    }
}