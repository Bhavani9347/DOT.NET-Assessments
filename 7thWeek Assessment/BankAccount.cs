using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BankAccountAssessment
{ 
      internal class BankAccount : ISavingsAccount, ICurrentAccount, IGoldLoanAccountcs
    {
            public double Balance { get; set; }
            public double CalculateSavingsInterest()
            {
                return Balance * 0.05;
            }
            public double CalculateCurrentInterest()
            {
                return Balance * 0.02;
            }
            public double CalculateGoldLoanInterest()
            {
                return Balance * 0.08;
            }
        }

    }

