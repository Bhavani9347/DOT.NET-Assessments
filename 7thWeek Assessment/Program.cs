using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BankAccountAssessment
{
    internal class Program
    {
        static void Main(string[] args)
            {
                BankAccount account = new BankAccount();
                Console.WriteLine("enter the balance");
                account.Balance = Convert.ToInt32(Console.ReadLine());
                while (true)
                {
                    Console.WriteLine("choose below options to calculate interest");
                    Console.WriteLine("1.Savings Account");
                    Console.WriteLine("2.Current Account");
                    Console.WriteLine("3.Gold Loan Account");
                    Console.WriteLine("4.Exit");
                    int choice = Convert.ToInt32(Console.ReadLine());
                    switch (choice)
                    {
                        case 1:

                            Console.WriteLine($"Interest for savings account:{account.CalculateSavingsInterest()}");

                            break;

                        case 2:

                            Console.WriteLine($"Interest for current account:{account.CalculateCurrentInterest()}");

                            break;

                        case 3:
                            Console.WriteLine($"Interest for Gold loan account:{account.CalculateGoldLoanInterest()}");

                            break;

                        case 4:
                            Console.WriteLine("exiting");

                            return;

                        default:
                            Console.WriteLine("Invalid choice");

                            break;

                    }
                }
            }
        }
    }



