using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Runtime.Serialization;

namespace BusinessObjects
{
    [Serializable()]
    public class  BO_P_Department: BaseObject
    {


        public BO_P_Department() { }

        public enum FieldList
        {
            DeptID, 
            DeptName, 
            ShortName, 
            Manager, 
            ParentID, 
            Tel, 
            Fax
        }

        #region Property

        public string DeptID
        {
            get;
            set;
        }

        public string DeptName
        {
            get;
            set;
        }

        public string ShortName
        {
            get;
            set;
        }

        public string Manager
        {
            get;
            set;
        }

        public string ParentID
        {
            get;
            set;
        }

        public string Tel
        {
            get;
            set;
        }


        public string Fax
        {
            get;
            set;
        }

        

        #endregion Property


        #region Methods

        public static List<BO_P_Department> FetchList()
        {
            List<BO_P_Department> list = new List<BO_P_Department>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT DeptID, DeptName, ShortName, Manager, ParentID, Tel, Fax");
            sb.Append(" FROM P_Department ");


            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_P_Department newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_P_Department();

                    newObj.DeptID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    newObj.DeptName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptName));
                    newObj.ShortName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ShortName));
                    newObj.Manager = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Manager));
                    newObj.ParentID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentID));

                    newObj.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Tel));
                    newObj.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Fax));
                    
                    list.Add(newObj);
                }
            }

            return list;
        }

        /// <summary>
        /// 根据部门编号取得用户姓名等信息
        /// </summary>
        /// <param name="sCodetype"></param>
        /// <returns></returns>
        public static DataSet GetDeptByDeptID(string sDeptID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select [DeptID], [DeptName] ");
            sb.Append("FROM P_Department (nolock) ");
            if (sDeptID.Trim() != "")
            {
                sb.Append("where DeptID = '" + sDeptID + "' ");
            }
            sb.Append("ORDER BY DeptID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            return _db.ExecuteDataSet(dbCommand);
        }
        #endregion Methods


    }
}
