using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class adminBookIssuing : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
            }
        }

        //go btn
        protected void Button2_Click(object sender, EventArgs e)
        {
            GetNames();
        }

        //issue book
        protected void Button3_Click(object sender, EventArgs e)
        {
            if(CheckIfBookExist() && CheckIfMemberExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strCon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl (member_id,member_name,book_id,book_name,issue_date,due_date) VALUES (@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date)", con);
                    cmd.Parameters.AddWithValue("@member_id", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_id", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@issue_date", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@due_date", TextBox4.Text.Trim());
                    cmd.ExecuteNonQuery();
                    // Update the current stock of the book
                    cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock - 1 WHERE book_id = @book_id", con);
                    cmd.Parameters.AddWithValue("@book_id", TextBox5.Text.Trim());
                    cmd.ExecuteNonQuery();

                    //

                    //clear fields
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";




                    con.Close();
                    Response.Write("<script>alert('Book issued successfully');</script>");

                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID or Member ID');</script>");
                return;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExist() && CheckIfMemberExist())
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(strCon))
                    {
                        if (con.State == ConnectionState.Closed)
                            con.Open();

                        // Try to delete the issued book record
                        SqlCommand cmd = new SqlCommand(
                            "DELETE FROM book_issue_tbl WHERE member_id = @member_id AND book_id = @book_id", con);
                        cmd.Parameters.AddWithValue("@member_id", TextBox6.Text.Trim());
                        cmd.Parameters.AddWithValue("@book_id", TextBox5.Text.Trim());

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            // Update the current stock of the book
                            SqlCommand updateCmd = new SqlCommand(
                                "UPDATE book_master_tbl SET current_stock = current_stock + 1 WHERE book_id = @book_id", con);
                            updateCmd.Parameters.AddWithValue("@book_id", TextBox5.Text.Trim());
                            updateCmd.ExecuteNonQuery();

                            // Clear fields
                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            TextBox4.Text = "";
                            TextBox5.Text = "";
                            TextBox6.Text = "";

                            // Success message
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                                "alert('Book returned successfully');", true);
                        }
                        else
                        {
                            // Member hasn't issued this book
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                                "alert('Member hasn\\'t issued this book, Try Again!');", true);
                        }

                        GridView1.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                        "alert('Error: " + ex.Message.Replace("'", "\\'") + "');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Invalid Book ID or Member ID');", true);
            }
        }


        //uDefined func

        bool CheckIfBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id = @book_id AND current_stock > 0", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox5.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return dt.Rows.Count > 0;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                return false;
            }
        }

        bool CheckIfMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl WHERE member_id = @member_id", con);
                cmd.Parameters.AddWithValue("@member_id", TextBox6.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return dt.Rows.Count > 0;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                return false;
            }
        }

        void GetNames()
        {
            try
            {
                // Fetching book name based on book ID
                SqlConnection con = new SqlConnection(strCon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT book_name from book_master_tbl WHERE book_id = @book_id", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox5.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    TextBox2.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }

                // Fetching member name based on member ID
                cmd = new SqlCommand("SELECT full_name from member_master_tbl WHERE member_id = @member_id", con);
                cmd.Parameters.AddWithValue("@member_id", TextBox6.Text.Trim());
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    TextBox1.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member ID');</script>");
                }

                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

    }
}