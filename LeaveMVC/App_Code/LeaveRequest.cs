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
    public class LeaveRequest
    {

        public DataTable GetPendingLeave(int EmpID)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Leave_Request.ID,Leave_Request.FromDate,Leave_Request.ToDate,Leave_Request.RequireDays,Leave_Request.LeaveReason,Leave_Request.MgrRemark FROM dbo.Leave_Request INNER JOIN dbo.Used_Leave ON Leave_Request.ID = Used_Leave.LeaveRequestID WHERE Used_Leave.EmpID= " + EmpID+ " AND Used_Leave.IsApprove= 0 ORDER BY Leave_Request.RequestDate DESC"))
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

        public DataTable GetStartDateForArray(int EmpID)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT FromDate FROM dbo.Leave_Request WHERE EmpID=" + EmpID + "AND IsApprove= 0"))
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

        public DataTable GetEndDateForArray(int EmpID)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ToDate FROM dbo.Leave_Request WHERE EmpID=" + EmpID + "AND IsApprove= 0"))
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

        public DataTable GetApprovedLeave(int EmpID)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Leave_Request.ID, Leave_Request.FromDate,Leave_Request.ToDate,Leave_Request.RequireDays,Leave_Request.LeaveReason,Leave_Request.MgrRemark FROM dbo.Leave_Request INNER JOIN dbo.Used_Leave ON Leave_Request.ID = Used_Leave.LeaveRequestID WHERE Used_Leave.EmpID= " + EmpID + " AND Used_Leave.IsApprove= 1 ORDER BY Leave_Request.RequestDate DESC"))
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

        public void DeletePendingRequestFormUsedLeave(int EmpID, int ID)
        {
            string query = "DELETE FROM dbo.Used_Leave WHERE EmpID= @EmpID AND LeaveRequestID = @ID";
            string conString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmpID", EmpID);
                    cmd.Parameters.AddWithValue("@ID", ID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        public void DeletePendingRequest(int EmpID, int ID)
        {
            string query = "DELETE FROM dbo.Leave_Request WHERE EmpID= @EmpID AND ID = @ID";
            string conString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmpID", EmpID);
                    cmd.Parameters.AddWithValue("@ID", ID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        public DataTable GetLeaveName()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT LeaveName FROM Leave"))
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


        public DataTable GetLeaveAllowDay()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT LeaveDay FROM Leave"))
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

        public int getCountOfUsedRegisteredLeave(int LeaveID, int EmpID)
        {
            int count = 0;
            var connectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT ID FROM dbo.Used_Leave WHERE LeaveID=" + LeaveID + "and EmpID="+EmpID+" AND isApprove = 1", connection))
                {
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        if (reader["ID"] != DBNull.Value)
                        {
                            count++;
                        }
                    }
                }
            }
            return count;
        }



    }
}