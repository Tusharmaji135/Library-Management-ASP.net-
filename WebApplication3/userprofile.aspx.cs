using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    GetUserData();
                    GetUserBooks();
                    GridView1.DataBind();
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCities(DropDownList1.SelectedValue);
        }

        // ====== Common function to fill cities based on state ======
        void FillCities(string selectedState)
        {
            DropDownList2.Items.Clear(); // Clear existing cities
            List<string> cities = new List<string>();

            switch (selectedState)
            {
                case "Gujarat":
                    cities.AddRange(new string[] { "Ahmedabad", "Surat", "Vadodara", "Rajkot", "Bhavnagar", "Jamnagar" });
                    break;
                case "Maharashtra":
                    cities.AddRange(new string[] { "Mumbai", "Pune", "Nagpur", "Nashik", "Thane", "Aurangabad" });
                    break;
                case "Delhi":
                    cities.AddRange(new string[] { "New Delhi", "North Delhi", "South Delhi", "West Delhi", "East Delhi" });
                    break;
                case "Tamil Nadu":
                    cities.AddRange(new string[] { "Chennai", "Coimbatore", "Madurai", "Tiruchirappalli", "Salem" });
                    break;
                case "Uttar Pradesh":
                    cities.AddRange(new string[] { "Lucknow", "Kanpur", "Agra", "Varanasi", "Allahabad" });
                    break;
                case "Rajasthan":
                    cities.AddRange(new string[] { "Jaipur", "Jodhpur", "Udaipur", "Ajmer", "Bikaner" });
                    break;
                case "Karnataka":
                    cities.AddRange(new string[] { "Bengaluru", "Mysuru", "Mangalore", "Hubli", "Belgaum" });
                    break;
                case "West Bengal":
                    cities.AddRange(new string[] { "Kolkata", "Asansol", "Siliguri", "Durgapur", "Howrah" });
                    break;
                case "Bihar":
                    cities.AddRange(new string[] { "Patna", "Gaya", "Bhagalpur", "Muzaffarpur", "Darbhanga" });
                    break;
                case "Andhra Pradesh":
                    cities.AddRange(new string[] { "Visakhapatnam", "Vijayawada", "Guntur", "Nellore", "Kurnool" });
                    break;
                case "Madhya Pradesh":
                    cities.AddRange(new string[] { "Bhopal", "Indore", "Jabalpur", "Gwalior", "Ujjain" });
                    break;
                case "Punjab":
                    cities.AddRange(new string[] { "Ludhiana", "Amritsar", "Jalandhar", "Patiala", "Bathinda" });
                    break;
                case "Haryana":
                    cities.AddRange(new string[] { "Gurgaon", "Faridabad", "Panipat", "Ambala", "Hisar" });
                    break;
                case "Kerala":
                    cities.AddRange(new string[] { "Thiruvananthapuram", "Kochi", "Kozhikode", "Thrissur", "Kollam" });
                    break;
                case "Telangana":
                    cities.AddRange(new string[] { "Hyderabad", "Warangal", "Nizamabad", "Karimnagar", "Khammam" });
                    break;
                case "Jharkhand":
                    cities.AddRange(new string[] { "Ranchi", "Jamshedpur", "Dhanbad", "Bokaro", "Deoghar" });
                    break;
                case "Chhattisgarh":
                    cities.AddRange(new string[] { "Raipur", "Bhilai", "Bilaspur", "Korba", "Durg" });
                    break;
                case "Odisha":
                    cities.AddRange(new string[] { "Bhubaneswar", "Cuttack", "Rourkela", "Sambalpur", "Puri" });
                    break;
                case "Assam":
                    cities.AddRange(new string[] { "Guwahati", "Silchar", "Dibrugarh", "Jorhat", "Tezpur" });
                    break;
                case "Uttarakhand":
                    cities.AddRange(new string[] { "Dehradun", "Haridwar", "Rishikesh", "Nainital", "Haldwani" });
                    break;
                case "Himachal Pradesh":
                    cities.AddRange(new string[] { "Shimla", "Manali", "Dharamshala", "Mandi", "Solan" });
                    break;
                case "Goa":
                    cities.AddRange(new string[] { "Panaji", "Margao", "Vasco da Gama", "Mapusa", "Ponda" });
                    break;
                case "Jammu and Kashmir":
                    cities.AddRange(new string[] { "Srinagar", "Jammu", "Anantnag", "Baramulla", "Udhampur" });
                    break;
                case "Tripura":
                    cities.AddRange(new string[] { "Agartala", "Dharmanagar", "Udaipur", "Kailasahar", "Belonia" });
                    break;
                case "Meghalaya":
                    cities.AddRange(new string[] { "Shillong", "Tura", "Nongpoh", "Jowai", "Baghmara" });
                    break;
                case "Manipur":
                    cities.AddRange(new string[] { "Imphal", "Thoubal", "Kakching", "Churachandpur", "Ukhrul" });
                    break;
                case "Nagaland":
                    cities.AddRange(new string[] { "Kohima", "Dimapur", "Mokokchung", "Tuensang", "Wokha" });
                    break;
                case "Mizoram":
                    cities.AddRange(new string[] { "Aizawl", "Lunglei", "Champhai", "Kolasib", "Serchhip" });
                    break;
                case "Arunachal Pradesh":
                    cities.AddRange(new string[] { "Itanagar", "Naharlagun", "Tawang", "Ziro", "Pasighat" });
                    break;
                case "Sikkim":
                    cities.AddRange(new string[] { "Gangtok", "Namchi", "Gyalshing", "Mangan", "Rangpo" });
                    break;
                case "Andaman and Nicobar Islands":
                    cities.AddRange(new string[] { "Port Blair", "Havelock Island", "Neil Island", "Diglipur" });
                    break;
                case "Chandigarh":
                    cities.Add("Chandigarh");
                    break;
                case "Puducherry":
                    cities.AddRange(new string[] { "Puducherry", "Karaikal", "Mahe", "Yanam" });
                    break;
                case "Ladakh":
                    cities.AddRange(new string[] { "Leh", "Kargil" });
                    break;
                case "Lakshadweep":
                    cities.Add("Kavaratti");
                    break;
                case "Dadra and Nagar Haveli and Daman and Diu":
                    cities.AddRange(new string[] { "Daman", "Diu", "Silvassa" });
                    break;
                default:
                    cities.Add("Select");
                    break;
            }

            foreach (string city in cities)
            {
                DropDownList2.Items.Add(new ListItem(city));
            }
        }

        // ===== Update Button Click =====
        protected void Button1_Click1(object sender, EventArgs e)
        {
            string password;
            if (!string.IsNullOrWhiteSpace(TextBox9.Text))
            {
                // New password entered
                password = TextBox9.Text.Trim();
            }
            else
            {
                // Keep old password from DB
                password = TextBox8.Text.Trim();
            }

            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand(@"
                UPDATE member_master_tbl
                SET full_name = @full_name,
                    dob = @dob,
                    contact_no = @contact_no,
                    email = @email,
                    state = @state,
                    city = @city,
                    pincode = @pincode,
                    full_address = @full_address,
                    password = @password,
                    account_status = 'pending'
                WHERE member_id = @member_id
            ", con);

                    cmd.Parameters.AddWithValue("@full_name", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@city", DropDownList2.SelectedValue);
                    cmd.Parameters.AddWithValue("@pincode", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString().Trim());

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('Profile updated successfully!');</script>");
                        GetUserData();
                    }
                    else
                    {
                        Response.Write("<script>alert('Profile update failed. Please try again.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }


        // ===== Get User Books =====
        void GetUserBooks()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl WHERE member_id = @member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        // ===== Get User Data =====
        void GetUserData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        TextBox5.Text = dt.Rows[0]["full_name"].ToString();
                        TextBox6.Text = dt.Rows[0]["dob"].ToString();
                        TextBox3.Text = dt.Rows[0]["contact_no"].ToString();
                        TextBox4.Text = dt.Rows[0]["email"].ToString();

                        // First set the state
                        DropDownList1.SelectedValue = dt.Rows[0]["state"].ToString();

                        // Fill the cities for this state
                        FillCities(DropDownList1.SelectedValue);

                        // Now set the city
                        DropDownList2.SelectedValue = dt.Rows[0]["city"].ToString();

                        TextBox7.Text = dt.Rows[0]["pincode"].ToString();
                        TextBox1.Text = dt.Rows[0]["full_address"].ToString();
                        TextBox2.Text = dt.Rows[0]["member_id"].ToString();
                        TextBox8.Text = dt.Rows[0]["password"].ToString();
                        string status = dt.Rows[0]["account_status"].ToString().ToUpper();
                        Label1.Text = status;

                        // Add style based on status
                        switch (status)
                        {
                            case "active":
                                Label1.Attributes.Add("class", "badge bg-success");
                                break;

                            case "pending":
                                Label1.Attributes.Add("class", "badge bg-warning text-dark");
                                break;

                            case "deactive":
                                Label1.Attributes.Add("class", "badge bg-danger");
                                break;

                            default:
                                Label1.Attributes.Add("class", "badge bg-secondary");
                                break;
                        }


                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        
    }
}
