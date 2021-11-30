using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class facultades : System.Web.UI.Page
{
    // Create 
    SqlConnection doctorsConnection = new SqlConnection();
    DataSet doctorsDataSet = new DataSet();
    SqlDataAdapter doctorsSqlDataAdapter = new SqlDataAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            doctorsGridView.DataSource = SqlDataSource1;
            doctorsGridView.DataBind();

            CreateDataSet();
            SqlCommand citiesSqlCommand =
            new SqlCommand("getUniqueCities", doctorsConnection);
            citiesSqlCommand.CommandType = CommandType.StoredProcedure;
            SqlDataReader citiesSqlDataReader;
            doctorsConnection.Open();
            citiesSqlDataReader = citiesSqlCommand.ExecuteReader();
            citiesList.DataSource = citiesSqlDataReader;
            citiesList.DataTextField = "City";
            citiesList.DataBind();
            citiesSqlDataReader.Close();
            doctorsConnection.Close();


            citiesList.Items.Add("[All]");
            citiesList.SelectedIndex = citiesList.Items.Count - 1;

            specialtiesListBox.Visible = false;
            specialtiesLabel.Visible = false;

        }
    }

    private void CreateDataSet()
    {
        doctorsConnection.ConnectionString =
            SqlDataSource1.ConnectionString;
        doctorsSqlDataAdapter.SelectCommand = new
            SqlCommand(SqlDataSource1.SelectCommand, doctorsConnection);
        doctorsSqlDataAdapter.Fill(doctorsDataSet);
    }


    private void Reset()
    {
		doctorsGridView.PageIndex = 0;

		doctorsGridView.SelectedIndex = -1;

        specialtiesListBox.Visible = false;
        specialtiesLabel.Visible = false;
    }
    protected void doctorsGridView_PageIndexChanged(object sender, EventArgs e)
    {
        CreateDataSet();
        string cityName = citiesList.SelectedItem.Value.Trim();
        if (cityName == "[All]")
        {
            doctorsGridView.DataSource = SqlDataSource1;
        }
        else
        {
            DataView doctorsDataView =
                new DataView(doctorsDataSet.Tables[0]);
            doctorsDataView.RowFilter = "City = '" + cityName + "' ";
            doctorsGridView.DataSource = doctorsDataView;
        }

        doctorsGridView.DataBind();
    }
    protected void doctorsGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        doctorsGridView.PageIndex = e.NewPageIndex;
    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (doctorsGridView.SelectedIndex != -1)
        {
        string doctorsName;
        doctorsName =
            doctorsGridView.Rows[doctorsGridView.SelectedIndex]
            .Cells[3].Text.Trim() + " " + 
            doctorsGridView.Rows[doctorsGridView.SelectedIndex]
            .Cells[2].Text.Trim();
        Response.Redirect("medical.aspx?pcp=" + doctorsName);
        }
    }
    protected void citiesList_SelectedIndexChanged(object sender, EventArgs e)
    {
        CreateDataSet();
        string cityName = citiesList.SelectedItem.Value.Trim();
        if (cityName == "[All]")
        {
            doctorsGridView.DataSource = SqlDataSource1;
        }
        else
        {
            DataView doctorsDataView =
                new DataView(doctorsDataSet.Tables[0]);
            doctorsDataView.RowFilter = "City = '" + cityName + "' ";
            doctorsGridView.DataSource = doctorsDataView;
        }
        Reset();
        doctorsGridView.DataBind();

    }
    protected void doctorsGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        string drID;
        drID = doctorsGridView.SelectedRow.Cells[1].Text;

        DoctorsDataContext doctorsContext = new DoctorsDataContext();
        specialtiesListBox.DataSource = doctorsContext.getDrSpecialty(drID);
        specialtiesListBox.DataTextField = "Carrera";
        specialtiesListBox.DataBind();

        if (specialtiesListBox.Items.Count != 0)
        {
            specialtiesListBox.Visible = true;
            specialtiesLabel.Visible = true;
        }

    }
}

