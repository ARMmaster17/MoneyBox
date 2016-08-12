using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyBox_Backend
{
    public class Stock
    {
        public int stockID;
        public string stockName;
        public double stockValue;
        public int ownerCompanyID;

        public Stock(int sID, string name, double initialValue, int ocID)
        {
            stockID = sID;
            stockName = name;
            stockValue = initialValue;
            ownerCompanyID = ocID;
        }
    }
}
