using System;

namespace WeeklyProject2
{
    class FibonacciClass
    {
        public static ulong Fibonacci(int secondNumber)
        {  
            if (secondNumber == 1 || secondNumber == 2)
            {
                return 1;
            }
            ulong prev_number = 0, curr_number = 1, next_number = 0;
            for (ulong index = 1; index < (ulong)secondNumber; index++)
            {
                next_number = prev_number + curr_number;
                prev_number = curr_number;
                curr_number = next_number;
            }
                return next_number;           
        }

        public static bool FibonacciSequence(int firstNumber)
        {
            
            int[] numberArray = new[] { 0, 1, 0 };
            while (numberArray[0] < firstNumber || numberArray[1] < firstNumber)
            {
                numberArray[numberArray[2] % 2] = numberArray[0] + numberArray[1]; numberArray[2]++;
            }
            return firstNumber == numberArray[0] || firstNumber == numberArray[1];
        }

        public static void FibonacciCheck(int firstNumber)
        {
            firstNumber = Math.Abs(firstNumber);
            if (FibonacciSequence(firstNumber) == true)
            {
                Console.WriteLine($"The number {firstNumber} corresponds to a number of the Fibonacci Sequence");
            }
            else
            {
                Console.WriteLine($"The number {firstNumber} does not correspond to a number of the Fibonacci Sequence");
            }
        }
    }
}
