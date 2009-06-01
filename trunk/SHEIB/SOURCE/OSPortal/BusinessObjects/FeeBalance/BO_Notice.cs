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
    public class BO_Notice : BaseObject
    {


        public BO_Notice() { }

        public enum FieldList
        {
            NoticeNo,
            NoticeDate,
            Content,
        }

        #region Property
        public string NoticeNo { get; set; }
        public DateTime NoticeDate { get; set; }
        public string Content { get; set; }
        #endregion Property


        #region Methods

        public static List<BO_Notice> FetchList()
        {
            List<BO_Notice> list = new List<BO_Notice>();

            StringBuilder sb = new StringBuilder();
            sb.Append("select ");
            sb.Append("NoticeNo,NoticeDate,Content");
            sb.Append("FROM Notice ");


            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());

            BO_Notice newObj;
            using (IDataReader reader = _db.ExecuteReader(dbCommand))
            {
                while (reader.Read())
                {
                    newObj = new BO_Notice();
                    newObj.NoticeNo = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.NoticeNo));
                    newObj.NoticeDate = Utility.GetDatetimeFromReader(reader, Convert.ToInt32(FieldList.NoticeDate));
                    newObj.Content = Utility.GetStringFromReader(reader, Convert.ToInt32(FieldList.Content));


                    list.Add(newObj);
                }
            }

            return list;
        }


        #endregion Methods


    }
}
