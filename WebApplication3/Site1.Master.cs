using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].ToString() == "")
                {
                    LinkButton2.Visible = true; // User Login
                    LinkButton3.Visible = true; // User Signup
                    LinkButton4.Visible = false; // Logout
                    LinkButton5.Visible = false; // User Profile
                    LinkButton6.Visible = true; // Admin Login
                    LinkButton7.Visible = false; // Author Management
                    LinkButton8.Visible = false; // Publisher Management
                    LinkButton9.Visible = false; // Book Inventory
                    LinkButton10.Visible = false; // Book Issuing
                    LinkButton11.Visible = false; // Member Management
                    LinkButton12.Visible = false; // user Management
                }
                else if (Session["role"].ToString() == "user")
                {
                    LinkButton2.Visible = false;
                    LinkButton3.Visible = false;
                    LinkButton4.Visible = true;
                    LinkButton5.Visible = true;
                    LinkButton5.Text = "Hello " + Session["fullname"].ToString();
                    LinkButton6.Visible = true;
                    LinkButton7.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;
                    LinkButton11.Visible = false;
                    LinkButton12.Visible = false; // user Management
                }
                else if (Session["role"].ToString() == "admin")
                {
                    LinkButton2.Visible = false;
                    LinkButton3.Visible = false;
                    LinkButton4.Visible = true;
                    LinkButton5.Visible = true;
                    LinkButton5.Text = "Hello Admin";
                    LinkButton6.Visible = false;
                    LinkButton7.Visible = true;
                    LinkButton8.Visible = true;
                    LinkButton9.Visible = true;
                    LinkButton10.Visible = true;
                    LinkButton11.Visible = true;
                    LinkButton12.Visible = true; // user Management
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }


        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminAuthorManagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminPublisherManagement.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminBookInventory.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminBookIssuing.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminMemberManagement.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Session["username"] = ""; // Assuming the eight column is the username
            Session["fullname"] = ""; // Assuming the first column is the full name
            Session["role"] = ""; // Assuming the role is set to 'user' for members
            Session["status"] = ""; // Assuming the ninth column is the status

            LinkButton2.Visible = true; // User Login
            LinkButton3.Visible = true; // User Signup
            LinkButton4.Visible = false; // Logout
            LinkButton5.Visible = false; // User Profile
            LinkButton6.Visible = true; // Admin Login
            LinkButton7.Visible = false;//author managemnet
            LinkButton8.Visible = false;//publisher management
            LinkButton9.Visible = false;//book inventory
            LinkButton10.Visible = false;//book issuing
            LinkButton11.Visible = false;//member managemnet

            Response.Redirect("homepage.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewBooks.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");

        }
    }
}