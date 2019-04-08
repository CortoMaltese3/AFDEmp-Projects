using System;

namespace WeeklyProject2
{
    class PrimeNumberClass
    {
        public static bool PrimeNumber(int SecondNumber)
        {
            if (SecondNumber == 0 || SecondNumber == 1)
            {
                return false;
            }
            for (int number=2; number < SecondNumber; number++)
            {

                if (SecondNumber % number == 0)
                {
                    return false;
                }
            }
            return true;
        }
        public static void PrimeNumberCheck(int SecondNumber)
        {
            if (PrimeNumber(SecondNumber) == true)
            {
                Console.WriteLine($"The number {SecondNumber} is prime");
            }
            if (PrimeNumber(SecondNumber) == false)
            {
                Console.WriteLine($"The number {SecondNumber} is not prime");
            }
        }
    }
}
