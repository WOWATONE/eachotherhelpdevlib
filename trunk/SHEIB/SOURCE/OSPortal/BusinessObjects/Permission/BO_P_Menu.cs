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
    public class BO_P_Menu : BaseObject
    {
        public BO_P_Menu() { }

        public BO_P_Menu(String id)
        {
            fetchByID(id);
        }

        public enum FieldList
        {
            MenuID, 
            MenuName, 
            ParentMenuID, 
            MenuFolderFlag, 
            MenuUrl, 
            Param, 
            SortNo, 
            Remark
        }


        #region Property

        public string MenuID
        {
            get;
            set;
        }

        public string MenuName
        {
            get;
            set;
        }

        public string ParentMenuID
        {
            get;
            set;
        }

        public Int32 MenuFolderFlag
        {
            get;
            set;
        }

        public string MenuUrl
        {
            get;
            set;
        }

        public string Param
        {
            get;
            set;
        }

        public Int32 SortNo
        {
            get;
            set;
        }

        public string Remark
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
            else
            {
                update();
            }
        }

        public static List<BO_P_Menu> FetchList()
        {
            List<BO_P_Menu> list = new List<BO_P_Menu>();

            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT  MenuID, MenuName, ParentMenuID, MenuFolderFlag, MenuUrl, Param, SortNo, Remark");
            sb.Append(" FROM P_Menu;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_P_Menu newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_P_Menu();

                    newObj.MenuID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MenuID));
                    newObj.MenuName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MenuName));
                    newObj.ParentMenuID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentMenuID));
                    newObj.MenuFolderFlag = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.MenuFolderFlag));
                    newObj.MenuUrl = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MenuUrl));
                    newObj.Param = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Param));
                    newObj.SortNo = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.SortNo));

                    newObj.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                
                    list.Add(newObj);
                }
            }

            return list;
        }

        public static void Delete(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("DELETE FROM P_Menu ");
            sb.Append(" WHERE MenuID = @MenuID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@MenuID", DbType.String, id);

            _db.ExecuteNonQuery(dbCommand);

        }

        public static DataSet FetchMenuOrPrivilege(String roleID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT MenuID, MenuName FROM P_Menu ");
            sb.Append(" WHERE ParentMenuID = '0' ");
            sb.Append(" ORDER BY MenuID,SortNo; ");
            sb.Append(" SELECT A.PrivID, A.PrivName, A.PrivType, ");
            sb.Append(" (SELECT ParentMenuID FROM P_Menu WHERE MenuID = A.MenuID) AS ParentMenuID, ");
            sb.Append(" CASE WHEN (ISNULL(B.RolePrivID,'')='') THEN 0 ");
            sb.Append(" ELSE 1 ");
            sb.Append(" END AS Checked ");            
            sb.Append(" FROM P_Priv A ");
            sb.Append(" LEFT JOIN P_RolePriv B ON A.PrivID = B.PrivID ");
            sb.Append(" AND B.RoleID = @RoleID ;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@RoleID", DbType.String, roleID);

            DataSet ds = _db.ExecuteDataSet(dbCommand);
            return ds;
        }

        #endregion Methods



        #region Procedure

        private void fetchByID(String id)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT MenuID, MenuName, ParentMenuID, MenuFolderFlag, MenuUrl, Param, SortNo, Remark ");
            sb.Append(" FROM P_Menu;");
            sb.Append(" WHERE MenuID = @MenuID ");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@MenuID", DbType.String, id);


            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                if (reader.Read())
                {
                    this.MenuID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MenuID));
                    this.MenuName = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MenuName));
                    this.ParentMenuID = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.ParentMenuID));
                    this.MenuFolderFlag = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.MenuFolderFlag));
                    this.MenuUrl = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.MenuUrl));
                    this.Param = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Param));
                    this.SortNo = Utility.GetIntFromReader(reader, Convert.ToInt32(FieldList.SortNo));
                    
                    this.Remark = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Remark));
                }
            }
        }


        private void add()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("INSERT INTO P_Menu( MenuID, MenuName, ParentMenuID, MenuFolderFlag, MenuUrl, Param, SortNo, Remark)");
            sb.Append(" VALUES( ");
            sb.Append("@MenuID, @MenuName, @ParentMenuID, @MenuFolderFlag, @MenuUrl, @Param, @SortNo, @Remark");
            sb.Append(" )");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@MenuID", DbType.String, this.MenuID);
            _db.AddInParameter(dbCommand, "@MenuName", DbType.String, this.MenuName);
            _db.AddInParameter(dbCommand, "@ParentMenuID", DbType.String, this.ParentMenuID);
            _db.AddInParameter(dbCommand, "@MenuFolderFlag", DbType.Int32, this.MenuFolderFlag);
            _db.AddInParameter(dbCommand, "@MenuUrl", DbType.String, this.MenuUrl);
            _db.AddInParameter(dbCommand, "@Param", DbType.String, this.Param);
            _db.AddInParameter(dbCommand, "@SortNo", DbType.Int32, this.SortNo);
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);

            _db.ExecuteNonQuery(dbCommand);
        }


        private void update()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("UPDATE P_Menu SET ");
            sb.Append(" MenuName=@MenuName, ParentMenuID=@ParentMenuID, MenuFolderFlag=@MenuFolderFlag,");
            sb.Append(" MenuUrl=@MenuUrl, Param=@Param, SortNo=@SortNo, Remark=@Remark ");
            sb.Append(" Where MenuID=@MenuID;");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            _db.AddInParameter(dbCommand, "@MenuID", DbType.String, this.MenuID);
            _db.AddInParameter(dbCommand, "@MenuName", DbType.String, this.MenuName);
            _db.AddInParameter(dbCommand, "@ParentMenuID", DbType.String, this.ParentMenuID);
            _db.AddInParameter(dbCommand, "@MenuFolderFlag", DbType.Int32, this.MenuFolderFlag);
            _db.AddInParameter(dbCommand, "@MenuUrl", DbType.String, this.MenuUrl);
            _db.AddInParameter(dbCommand, "@Param", DbType.String, this.Param);
            _db.AddInParameter(dbCommand, "@SortNo", DbType.String, this.SortNo);
            _db.AddInParameter(dbCommand, "@Remark", DbType.String, this.Remark);

            _db.ExecuteNonQuery(dbCommand);

        }


        #endregion Procedure






    }
}
