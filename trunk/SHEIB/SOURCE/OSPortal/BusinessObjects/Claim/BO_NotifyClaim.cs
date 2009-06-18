using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace BusinessObjects
{
    [Serializable()]
    public class BO_NotifyClaim : BaseObject
    {
        public BO_NotifyClaim() { }

        public BO_NotifyClaim(String id)
        {
            //FetchByID(id);
        }

        public enum FieldList
        {
            NotifyID,
            PolicyID,
            CaseEndRemark,
            CreatePerson,
            CreateDate,
            ModifyDate,
            ModifyPerson,
            NotifySerialNo,
            NotifyTime,
            AccidentSpot,
            AccidentTime,
            NotifyPerson,
            LossType,
            AccidentReason,
            NotifyLossFee,
            ContactPerson,
            ContactPhone,
            NotifyType,
            SpotCode,
            AccidentProc,
            AccidentDeal,
            NotifyRemark,
            NotifyCarrierTime,
            NotifyNo,
            CarrierContactPerson,
            CarrierContactPhone,
            PerambulateTime,
            Requirement,
            CaseEndTime,
            LastPayFee,
            AcquitFee
        }

        #region Property
        /*理赔编号*/
        public string NotifyID { get; set; }
        /*投保编号*/
        public string PolicyID { get; set; }
        /*报案时间*/
        public DateTime NotifyTime { get; set; }
        /*出险地点*/
        public string AccidentSpot { get; set; }
        /*出险时间*/
        public DateTime AccidentTime { get; set; }
        /*报案人*/
        public string NotifyPerson { get; set; }
        /*损失性质*/
        public string LossType { get; set; }
        /*出险原因*/
        public string AccidentReason { get; set; }
        /*报损金额*/
        public Double NotifyLossFee { get; set; }
        /*联系人*/
        public string ContactPerson { get; set; }
        /*联系电话*/
        public string ContactPhone { get; set; }
        /*报案方式*/
        public string NotifyType { get; set; }
        /*出险地邮政编码*/
        public string SpotCode { get; set; }
        /*事故经过*/
        public string AccidentProc { get; set; }
        /*跟踪记录*/
        public string AccidentDeal { get; set; }
        /*备注*/
        public string NotifyRemark { get; set; }
        /*向保险公司报案时间*/
        public DateTime NotifyCarrierTime { get; set; }
        /*报案号*/
        public string NotifyNo { get; set; }
        /*保险公司办理人员*/
        public string CarrierContactPerson { get; set; }
        /*联系电话*/
        public string CarrierContactPhone { get; set; }
        /*查勘时间*/
        public DateTime PerambulateTime { get; set; }
        /*保险公司要求*/
        public string Requirement { get; set; }
        /*结案时间*/
        public DateTime CaseEndTime { get; set; }
        /*最终赔付金额*/
        public Double LastPayFee { get; set; }
        /*免赔额*/
        public Double AcquitFee { get; set; }
        /*备注*/
        public string CaseEndRemark { get; set; }
        #endregion

        #region Methods
        public void Save(ModifiedAction action)
        {
            if (action == ModifiedAction.Insert)
            {
                //add();
            }
            else if (action == ModifiedAction.Update)
            {
                //update();
            }
        }

        /// <summary>
        /// 根据用户ID取得理赔信息
        /// </summary>
        /// <param name="custID"></param>
        /// <returns></returns>
        public static DataTable GetCustContactByCustID(string custID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Select NC.NotifyID, NC.PolicyNo, C.CarrierNameEn, PT.ProdTypeName, P.StartDate, P.EndDate, NC.NotifyTime, ");
            sb.Append("isnull(NC.NotifyLossFee, 0) as NotifyLossFee, isnull(C.LossRation, 0) as LossRation, isnull(NC.LastPayFee, 0) as LastPayFee, NC.CaseEndTime ");
            sb.Append("From NotifyClaim NC (nolock) ");
            sb.Append("Inner Join Policy P (nolock) On P.PolicyID=NC.PolicyID ");
            sb.Append("Inner Join PolicyCarrier PC (nolock) On PC.PolicyID=P.PolicyID ");
            sb.Append("Inner Join Carrier C (nolock) On C.CarrierID=PC.CarrierID ");
            sb.Append("Inner Join ProductType PT (nolock) On PT.ProdTypeID=P.ProdTypeID ");
            sb.Append("Where P.CustomerID=@CustID ");
            sb.Append("Order By NC.NotifyID");

            DbCommand dbCommand = _db.GetSqlStringCommand(sb.ToString());
            _db.AddInParameter(dbCommand, "@CustID", DbType.AnsiString, custID);

            return _db.ExecuteDataSet(dbCommand).Tables[0];
        }
        #endregion
    }
}