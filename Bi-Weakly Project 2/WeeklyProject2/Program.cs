using System;

namespace WeeklyProject2
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Bi-Weekly Project 2 - Individual");
            Console.WriteLine("--------------------------------");
            
            Console.WriteLine("Steps 1-2 : Calculator");
            Console.WriteLine("Enter two numbers and a math operator of your choice to calculate the first result...");
            int firstResult = Convert.ToInt32(MathOperation.DoCalculations());
            Console.WriteLine("Enter two numbers and a math operator of your choice to calculate the second result...");
            int SecondResult = Convert.ToInt32(MathOperation.DoCalculations());
            Console.WriteLine("\r\nPress any key to continue...\r\n");
            Console.ReadKey();

            Console.WriteLine("Step 3 : Calculating the GCD");
            Console.WriteLine($"Based on the last two results, the Greatest Common Divisor of {firstResult} and {SecondResult} is {GreatestCommonDivisor.GCD(firstResult, SecondResult)} \r\nNote that the numbers you entered were rounded up accordingly ");
            Console.WriteLine("\r\nPress any key to continue...\r\n");
            Console.ReadKey();

            Console.WriteLine("Step 4: Checking if the second result is a Prime Number");
            PrimeNumberClass.PrimeNumberCheck(Math.Abs(SecondResult));
            Console.WriteLine("\r\nPress any key to continue...\r\n");
            Console.ReadKey();

            Console.WriteLine("Step 5 : Calculating the Fibonacci number of the second result");
            try
            {
                Console.WriteLine($"The corresponding {Math.Abs(SecondResult)}'th Fibonacci Number is {FibonacciClass.Fibonacci(Math.Abs(SecondResult))}");
            }
            catch (OverflowException)
            {
                Console.WriteLine($"The corresponding {Math.Abs(SecondResult)}'th Fibonacci number exceeded the available value size ({ulong.MaxValue})");
            }
            
            Console.WriteLine("\r\nPress any key to continue...\r\n");
            Console.ReadKey();

            Console.WriteLine("Step 6 : Checking if the first result corresponds to a number from the Fibonacci Sequence");
            FibonacciClass.FibonacciCheck(Math.Abs(firstResult));
            
            Console.WriteLine("\r\nPress any key to close the app");
            Console.ReadKey();
         }
    }
}
