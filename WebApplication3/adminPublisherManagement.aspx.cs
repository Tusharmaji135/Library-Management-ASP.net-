using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class adminPublisherManagement : System.Web.UI.Page
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
            if (CheckIfPublisherExist())
            {
                Response.Write("<script>alert('publisher already exists with this ID, try another one!')</script>");
            }
            else
            {
                AddNewAuthor();
            }
        }

        // Update Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckIfPublisherExist())
            {
                UpdateAuthor();
            }
            else
            {
                Response.Write("<script>alert('publisher does not exist with this ID.')</script>");
            }
        }

        // Delete Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckIfPublisherExist())
            {
                DeleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('publisher does not exist with this ID.')</script>");
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
                    SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_master_tbl WHERE publisher_id=@id", con);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            TextBox6.Text = dr["publisher_name"].ToString();
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

        // Check if publisher Exists
        bool CheckIfPublisherExist()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT 1 FROM publisher_master_tbl WHERE publisher_id=@id", con);
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

        // Add New publisher
        void AddNewAuthor()
        {
            if (string.IsNullOrWhiteSpace(TextBox5.Text) || string.IsNullOrWhiteSpace(TextBox6.Text))
            {
                Response.Write("<script>alert('Both publisher ID and Name are required!')</script>");
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO publisher_master_tbl(publisher_id, publisher_name) VALUES(@id, @name)", con);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@name", TextBox6.Text.Trim());

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('publisher added successfully!')</script>");
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

        // Update publisher
        void UpdateAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl SET publisher_name=@name WHERE publisher_id=@id", con);
                    cmd.Parameters.AddWithValue("@name", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('publisher updated successfully!')</script>");
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

        // Delete publisher
        void DeleteAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM publisher_master_tbl WHERE publisher_id=@id", con);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('publisher deleted successfully!')</script>");
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