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

        public BO_P_Department(String id)
        {
            fetchByID(id);
        }

        public enum FieldList
        {
            DeptID, 
            DeptName, 
            ShortName, 
            Manager, 
            ParentID, 
            Tel, 
            Fax,
            Layer,
            ParentName,
            NewDeptID
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

        public int Layer
        {
            get;
            set;
        }

        public string ParentName
        {
            get;
            set;
        }

        public string NewDeptID
        {
            get;
            set;
        }
        #endregion Property


        #region Methods
        public void Save(ModifiedAction action)
        {
            if (action == ModifiedAction.Insert)
            {
                add();
            }
            else if (action == ModifiedAction.Update)
            {
                update();
            }
        }

        /// <summary>
        /// 保存部门信息
        /// </summary>
        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO P_Department(DeptID, DeptName, ShortName, Manager, ParentID, Tel, Fax, Layer) ");
            sb.Append("VALUES(@DeptID, @DeptName, @ShortName, @Manager, @ParentID, @Tel, @Fax, @Layer)");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@DeptID", DbType.AnsiString, this.DeptID);
            _db.AddInParameter(dbCommand, "@DeptName", DbType.AnsiString, this.DeptName);
            _db.AddInParameter(dbCommand, "@ShortName", DbType.AnsiString, this.ShortName);
            _db.AddInParameter(dbCommand, "@Manager", DbType.AnsiString, this.Manager);
            _db.AddInParameter(dbCommand, "@ParentID", DbType.AnsiString, this.ParentID);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.AnsiString, this.Fax);
            _db.AddInParameter(dbCommand, "@Layer", DbType.Int32, this.Layer);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 修改部门信息
        /// </summary>
        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Update P_Department Set DeptID=@NewDeptID, DeptName=@DeptName, ShortName=@ShortName, Manager=@Manager, Tel=@Tel, Fax=@Fax Where DeptID=@DeptID ");
            sb.Append("Update P_Department Set ParentId=@NewDeptID Where ParentId=@DeptID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@DeptID", DbType.AnsiString, this.DeptID);
            _db.AddInParameter(dbCommand, "@NewDeptID", DbType.AnsiString, this.NewDeptID);
            _db.AddInParameter(dbCommand, "@DeptName", DbType.AnsiString, this.DeptName);
            _db.AddInParameter(dbCommand, "@ShortName", DbType.AnsiString, this.ShortName);
            _db.AddInParameter(dbCommand, "@Manager", DbType.AnsiString, this.Manager);
            _db.AddInParameter(dbCommand, "@Tel", DbType.AnsiString, this.Tel);
            _db.AddInParameter(dbCommand, "@Fax", DbType.AnsiString, this.Fax);

            _db.ExecuteNonQuery(dbCommand);
        }

        public static List<BO_P_Department> FetchList()
        {
            List<BO_P_Department> list = new List<BO_P_Department>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT DeptID, DeptName, ShortName, Manager, ParentID, Tel, Fax, Layer");
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
                    newObj.Layer = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.Layer));
                    
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

        /// <summary>
        /// 得到所有部门信息
        /// </summary>
        /// <param name="whereFilter"></param>
        /// <returns></returns>
        public static DataSet GetDepartment()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select Layer ");
            sb.Append("From P_Department (nolock) ");
            sb.Append("Group By Layer ");
            sb.Append("Order By Layer ");
            sb.Append("Select DeptID, DeptName, ShortName, Manager, ParentID, Tel, Fax, Layer ");
            sb.Append("From P_Department (nolock) ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            return _db.ExecuteDataSet(dbCommand);
        }

        /// <summary>
        /// 判断指定部门是否有子部门
        /// </summary>
        /// <param name="deptID"></param>
        /// <returns></returns>
        public static bool IfHasChildDepartment(string deptID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select top 1 DeptID ");
            sb.Append("From P_Department (nolock) ");
            sb.Append("Where ParentID=@DeptID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@DeptID", DbType.AnsiString, deptID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 删除部门信息
        /// </summary>
        /// <param name="deptID"></param>
        public static void Delete(string deptID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM P_Department ");
            sb.Append(" WHERE DeptID = @DeptID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@DeptID", DbType.AnsiString, deptID);

            _db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// 判断是否存在指定部门编号
        /// </summary>
        /// <param name="deptID"></param>
        /// <returns></returns>
        public static bool IfExistsDeptID(string deptID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select DeptID From P_Department (nolock) ");
            sb.Append("Where DeptID=@DeptID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@DeptID", DbType.AnsiString, deptID);
            DataTable value = _db.ExecuteDataSet(dbCommand).Tables[0];

            if (value != null && value.Rows.Count > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 取得指定部门级别
        /// </summary>
        /// <param name="deptID"></param>
        /// <returns></returns>
        public static int GetLayerByDeptID(string deptID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select Layer From P_Department (nolock) Where DeptID=@DeptID");
            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@DeptID", DbType.AnsiString, deptID);
            object value = _db.ExecuteScalar(dbCommand);
            if (value != null && value != DBNull.Value)
                return Convert.ToInt32(value);
            else
                return 0;
        }
        #endregion Methods

        #region Procedure

        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT PD.DeptID, PD.DeptName, PD.ShortName, PD.Manager, PD.ParentID, PD.Tel, PD.Fax, PD.Layer, isnull(PD1.DeptName, '') as ParentName ");
            sb.Append(" FROM P_Department PD (nolock) ");
            sb.Append(" Left Join P_Department PD1 (nolock) On PD1.DeptID=PD.ParentID ");
            sb.Append(" WHERE PD.DeptID = @DeptID");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");
            //sb.Append(" ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@DeptID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    this.DeptID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptID));
                    this.DeptName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.DeptName));
                    this.ShortName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ShortName));
                    this.Manager = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Manager));
                    this.ParentID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentID));
                    this.Tel = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Tel));
                    this.Fax = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Fax));
                    this.Layer = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.Layer));
                    this.ParentName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentName));
                    break;
                }
            }
        }

        #endregion Procedure
    }
}
