using System;
using System.Collections.Generic;

namespace WeeklyProject2
{
    class ReadFromConsole
    {
        public static double ReadNumberFromConsole()
        {
            while (true)
            {
                try
                {
                    return double.Parse(Console.ReadLine());
                }
                catch (Exception)
                {
                    Console.WriteLine("Input needs to be a real number. Try again...");
                }
            }
        }
        public static string ReadMathOperatorFromConsole()
        {
            string[] operators = { "+", "-", "*", "/", "%", "square root" };
            List<string> mathOperatorsList = new List<string>();
            mathOperatorsList.AddRange(operators);
            while (true)
            {
                string mathOperator = Console.ReadLine();
                if (mathOperatorsList.Contains(mathOperator))
                {
                    return mathOperator;
                }
                else
                {
                    Console.WriteLine("Your input didn't correspond to any of the given math operations. Please choose again");
                }
            }
        }
    }
}
