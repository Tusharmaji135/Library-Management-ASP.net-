using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class usersignup : System.Web.UI.Page
    {

        string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Items.Clear(); // Clear existing cities
            string selectedState = DropDownList1.SelectedValue;

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


        //sign up
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckMemberExists())
            {
                Response.Write("<script>alert('Member ID already exists! Please choose a different Member ID.')</script>");
                TextBox2.Text = "";
            }
            else
            {
                if (TextBox5.Text == "" || TextBox6.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || DropDownList1.SelectedValue == "" || TextBox7.Text == "" || TextBox1.Text == "" || TextBox2.Text == "" || TextBox8.Text == "")
                {
                    Response.Write("<script>alert('Please fill all the fields!')</script>");
                }
                else
                {
                    SignUpNewUser();
                }
            }
        }

        //user define method
        bool CheckMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id=@member_id", con);
                cmd.Parameters.AddWithValue("@member_id", TextBox2.Text.Trim());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    return true;

                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
                return false;
            }
        }

        void SignUpNewUser()
        {
            //Response.Write("<script>alert('TESTING')</script>");
            try
            {
                SqlConnection con = new SqlConnection(strCon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl(full_name,dob,contact_no,email,state,city,pincode,full_address,member_id,password,account_status) values(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@member_id,@password,@account_status)", con);
                cmd.Parameters.AddWithValue("@full_name", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@pincode", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Write("<script>alert('Sign Up Successful!,Please Login now')</script>");
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    DropDownList1.SelectedIndex = 0;
                    DropDownList2.Items.Clear();
                    TextBox7.Text = "";
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox8.Text = "";
                }
                else
                {
                    Response.Write("<script>alert('Sign Up Failed! Please try again.')</script>");
                }
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "')</script>");
            }
        }
    }
}
