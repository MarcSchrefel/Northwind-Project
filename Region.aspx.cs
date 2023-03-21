using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt_m133_m151
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        readonly SqlConnectionStringBuilder conBuilder = new SqlConnectionStringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            conBuilder.DataSource = @"(localdb)\ProjectsV13";
            conBuilder.InitialCatalog = "Northwind";
            conBuilder.IntegratedSecurity = true;

            selectRegionsAll();
        }

      

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (OrtRegion.Text == "")
            {
                nothere.Text = "Bitte Ihre gewünschte Region eingeben";
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = conBuilder.ConnectionString;
                con.Open();

                SqlCommand cmd = new SqlCommand("DeleteRegion", con);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@RegionDescription", SqlDbType.VarChar));
                cmd.Parameters["@RegionDescription"].Value = OrtRegion.Text;

                int deletedRowsCount = cmd.ExecuteNonQuery();
                con.Close();

                if (deletedRowsCount == 0)
                {
                    nothere.Text = "Diese Region existiert leider nicht in der Datenbank. Bitte versuchen Sie es erneut!";
                }
                else
                {
                    selectRegionsAll();
                }
            }

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (OrtRegion.Text == "")
            {
                nothere.Text = "Bitte geben Sie eine Region ein";
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = conBuilder.ConnectionString;
                con.Open();

                SqlCommand cmd = new SqlCommand("InsertRegion", con);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@RegionDescription", SqlDbType.VarChar));
                cmd.Parameters["@RegionDescription"].Value = OrtRegion.Text;

                cmd.ExecuteNonQuery();
                con.Close();

                selectRegionsAll();
            }
        }

       

        private void updateRegion(int regionID, string newRegionDescription)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = conBuilder.ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("UpdateRegion", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@RegionID", SqlDbType.VarChar));
            cmd.Parameters.Add(new SqlParameter("@NewRegionDescription", SqlDbType.VarChar));
            cmd.Parameters["@RegionID"].Value = regionID;
            cmd.Parameters["@NewRegionDescription"].Value = newRegionDescription;

            int deletedRowsCount = cmd.ExecuteNonQuery();

            if (deletedRowsCount == 0)
            {
                nothere.Text = "Diese Region existiert leider nicht in der Datenbank";
            }

            con.Close();
        }
        protected void btnBigSmall_Click(object sender, EventArgs e)
        {
            if (OrtRegion.Text == "")
            {
                nothere.Text = "Bitte geben Sie Ihre gewünschte Region ein";
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = conBuilder.ConnectionString;
                con.Open();

                SqlCommand cmd = new SqlCommand("SelectRegion", con);
                cmd.Parameters.Add(new SqlParameter("@RegionDescription", SqlDbType.VarChar));
                cmd.Parameters["@RegionDescription"].Value = OrtRegion.Text;

                cmd.CommandType = CommandType.StoredProcedure;

                DataSet ds = new DataSet();
                SqlDataAdapter dap = new SqlDataAdapter(cmd);

                dap.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    int regionID = (int)ds.Tables[0].Rows[0]["RegionID"];
                    string regionDescription = ds.Tables[0].Rows[0]["RegionDescription"].ToString();

                    string newRegionDescription = new string(
                        regionDescription.Select(c => char.IsLetter(c) ? (char.IsUpper(c) ?
                                                      char.ToLower(c) : char.ToUpper(c)) : c).ToArray());

                    updateRegion(regionID, newRegionDescription);

                    con.Close();

                    selectRegionsAll();
                }
                else
                {
                    nothere.Text = "Diese Region existiert nicht in der Datenbank";
                }
            }
        }

        private void selectRegionsAll()
        {
            DataTable tblRegions = new DataTable();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = conBuilder.ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("SelectAllRegions", con);

            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter dap = new SqlDataAdapter(cmd);

            dap.Fill(tblRegions);

            RegionsGrid.DataSource = tblRegions;
            RegionsGrid.DataBind();

            con.Close();

            nothere.Text = "";
        }
    }
}