using System;

namespace WeeklyProject2
{
    class GreatestCommonDivisor
    {
        public static int GCD(int firstNumber, int secondNumber)
        {
            int Remainder;

            while (secondNumber != 0)
            {
                Remainder = firstNumber % secondNumber;
                firstNumber = secondNumber;
                secondNumber = Remainder;
            }
            return Math.Abs(firstNumber);
        }
    }
}
