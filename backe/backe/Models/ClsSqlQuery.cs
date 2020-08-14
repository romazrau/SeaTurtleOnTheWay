using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace backe.Models
{
    public class ClsSqlQuery
    {

        public static string SqlQuery(string query)
        {
            //連線目標
            string con = "Server=.;Database=SeaTurtleOnTheWay;Trusted_Connection=SSPI";
            //SQL請求字串
            string sql = query;
            //連線物件
            SqlConnection mycon = new SqlConnection(con);

            try
            {
                //連線
                mycon.Open();

                //請求資料
                SqlDataAdapter myda = new SqlDataAdapter(sql, con);
                DataSet myds = new DataSet();
                myda.Fill(myds);

                //轉json
                string json = JsonConvert.SerializeObject(myds.Tables[0]);
                return json;
            }
            catch (Exception e)
            {
                return $"['錯誤訊息': '{e.Message}']";
            }
            finally
            {
                mycon.Close();
            }
        }
    }
}