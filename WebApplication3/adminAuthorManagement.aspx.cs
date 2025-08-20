using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication3
{
    public partial class adminAuthorManagement : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
            }
        }

        // Add Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckIfAuthorExist())
            {
                Response.Write("<script>alert('Author already exists with this ID, try another one!')</script>");
            }
            else
            {
                AddNewAuthor();
            }
        }

        // Update Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckIfAuthorExist())
            {
                UpdateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist with this ID.')</script>");
            }
        }

        // Delete Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckIfAuthorExist())
            {
                DeleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist with this ID.')</script>");
            }
        }

        // GO Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id=@id", con);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            TextBox6.Text = dr["author_name"].ToString();
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('No author found with this ID.')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
            }
        }

        // Check if Author Exists
        bool CheckIfAuthorExist()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id=@id", con);
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

        // Add New Author
        void AddNewAuthor()
        {
            if (string.IsNullOrWhiteSpace(TextBox5.Text) || string.IsNullOrWhiteSpace(TextBox6.Text))
            {
                Response.Write("<script>alert('Both Author ID and Name are required!')</script>");
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl(author_id, author_name) VALUES(@id, @name)", con);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@name", TextBox6.Text.Trim());

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('Author added successfully!')</script>");
                        ClearForm();
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('Failed to add author.')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
            }
        }

        // Update Author
        void UpdateAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name=@name WHERE author_id=@id", con);
                    cmd.Parameters.AddWithValue("@name", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('Author updated successfully!')</script>");
                        ClearForm();
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('Update failed.')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
            }
        }

        // Delete Author
        void DeleteAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id=@id", con);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('Author deleted successfully!')</script>");
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

        // Clear Textboxes

        void ClearForm()
        {
            TextBox5.Text = "";
            TextBox6.Text = "";
        }
    }
}
