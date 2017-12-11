using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;

namespace Leave.App_Code
{
    public class DatabaseAccess
    {

        //InsertData is worked
        public void InsertData()
        {
            string query = "INSERT INTO dbo.Employee(EmpName) VALUES (@EmpName)";
            string conString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                { 
                    cmd.Parameters.AddWithValue("@EmpName", "U Zaw Aung");
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }


       

        //GetDataTable is working
        public DataTable GetDataTable()
        {
            // Modified your method, since I don't have access to your db, so I created one manually
            // Here we create a DataTable with four columns.
            DataTable table = new DataTable();
            table.Columns.Add("Dosage", typeof(int));
            table.Columns.Add("Drug", typeof(string));
            table.Columns.Add("Patient", typeof(string));
            table.Columns.Add("Date", typeof(DateTime));

            // Here we add five DataRows.
            table.Rows.Add(25, "Indocin", "David", DateTime.Now);
            table.Rows.Add(50, "Enebrel", "Sam", DateTime.Now);
            table.Rows.Add(10, "Hydralazine", "Christoff", DateTime.Now);
            table.Rows.Add(21, "Combivent", "Janet", DateTime.Now);
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now);
            return table;
        }


        //GetData is worked
        public DataTable GetData()
            {
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT ID, EmpName FROM dbo.Employee"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                return dt;
                    }
                }
            }
        }
    }

        //DiaplayDataTable is worked
        public DataTable DiaplayDataTable()
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            conn.Open();
            string query = "SELECT ID, EmpName FROM dbo.Employee";

            SqlCommand cmd = new SqlCommand(query, conn);

            DataTable t1 = new DataTable();
            using (SqlDataAdapter a = new SqlDataAdapter(cmd))
            {
                a.Fill(t1);
            }

            return t1;
        }

        //ReadEmpName is working
        public string ReadEmpName1()
        {
            string name = "";
            var connectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT * FROM dbo.Employee", connection))
                {
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        name = reader.GetString(2); 
                    }
                }
            }
            return name;
        }

    }


}
