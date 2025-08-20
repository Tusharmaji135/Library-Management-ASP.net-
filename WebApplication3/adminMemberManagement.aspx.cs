using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class adminMemberManagement : System.Web.UI.Page
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
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            FetchData();
        }

        //fetch data
        void FetchData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id=@id", con);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            TextBox6.Text = dr.GetValue(0).ToString();
                            TextBox7.Text = dr.GetValue(10).ToString();
                            TextBox1.Text = dr.GetValue(1).ToString();
                            TextBox2.Text = dr.GetValue(2).ToString();
                            TextBox10.Text = dr.GetValue(3).ToString();
                            TextBox3.Text = dr.GetValue(4).ToString();
                            TextBox4.Text = dr.GetValue(5).ToString();
                            TextBox8.Text = dr.GetValue(6).ToString();
                            TextBox9.Text = dr.GetValue(7).ToString();
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('No member found with this ID.')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
            }
        }

        //active btn
        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            UpdateMemberStatusById("active");
        }

        

        //pending btn
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusById("pending");
        }


        //deactivate btn
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusById("deactive");
        }

        //delete user
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id=@id", con);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('Member deleted successfully!')</script>");
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
        //upadteStatus
        void UpdateMemberStatusById(string status)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status=@status WHERE member_id=@id", con);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@id", TextBox5.Text.Trim());

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        FetchData();
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

        // Clear Textboxes
        void ClearForm()
        {
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox10.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
        }
    }
}