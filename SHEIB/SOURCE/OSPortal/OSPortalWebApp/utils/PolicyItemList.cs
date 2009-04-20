using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace OSPortalWebApp
{
    public class PolicyItem
    {
        public PolicyItem()
        {
            _stateBag = new StateBag();
            if (_stateBag.Count == 0)
            {
                _list = new List<PolicyItem>();
                _stateBag.Add("objectlist", _list);
            }
            else
            {
                _list = (List<PolicyItem>)_stateBag["objectlist"];
            }
        }

        private StateBag _stateBag;
        private List<PolicyItem> _list;

        public Int32 ID
        {
            get;
            set;
        }

        public String Code
        {
            get;
            set;
        }

        public string Caption
        {
            get;
            set;
        }

        public decimal Premium
        {
            get;
            set;
        }

        public double Rate
        {
            get;
            set;
        }

        public double Fee
        {
            get;
            set;
        }

        public double ProcessRate
        {
            get;
            set;
        }

        public double ProcessFee
        {
            get;
            set;
        }

        public List<PolicyItem> GetPolicyItems()
        {
            //ViewState["text"]
            //List<PolicyItem> list = new List<PolicyItem>();
            //PolicyItem newObj = new PolicyItem();
            //newObj.ID = 1;
            //newObj.Code = "Code";
            //newObj.Caption = "Caption";
            //newObj.Premium = 3000;
            //newObj.Rate = 0.03;
            //newObj.Fee = 30;
            //newObj.ProcessRate = 0.02;
            //newObj.ProcessFee = 20;

            //list.Add(newObj);

            return _list;
        }

        public void InsertPolicyItem(PolicyItem item)
        {
            PolicyItem newObj = new PolicyItem();
            newObj.ID = item.ID;
            newObj.Code = item.Code;
            newObj.Caption = item.Caption;
            newObj.Premium = item.Premium;
            newObj.Rate = item.Rate;
            newObj.Fee = item.Fee;
            newObj.ProcessRate = item.ProcessRate;
            newObj.ProcessFee = item.ProcessFee;
            _list.Add(newObj);
        }

        public void UpdatePolicyItem(PolicyItem item)
        {
            //
        }

        //public void InsertPolicyItem(Int32 id, string code, string caption,
        //    decimal premium, double rate, double fee,
        //    double processRate, double processFee)
        //{
        //    //
        //}

        //public void UpdatePolicyItem(Int32 id, string code, string caption,
        //    decimal premium, double rate, double fee,
        //    double processRate, double processFee)
        //{
        //    //
        //}
    }
}
