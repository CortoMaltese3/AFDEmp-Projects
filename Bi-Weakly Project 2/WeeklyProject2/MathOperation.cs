using System;

namespace WeeklyProject2
{
    class MathOperation
    {
        public static double DoCalculations()
        {
            double num1, num2, result;

            Console.Write("\r\nType the first number and press Enter : ");
            num1 = ReadFromConsole.ReadNumberFromConsole();

            Console.Write("Type the second number and press Enter : ");
            num2 = ReadFromConsole.ReadNumberFromConsole();

            Console.Write("Choose a math operation between these two numbers.\nChoices are + , - , * , / , % , square root : ");
            string mathOperation = ReadFromConsole.ReadMathOperatorFromConsole();

            result = 0;
            switch (mathOperation)
            {
                case "+":
                    result = num1 + num2;
                    Console.WriteLine($"Result : {num1} + {num2} = " + result);
                    break;
                case "-":
                    result = num1 - num2;
                    Console.WriteLine($"Result : {num1} - {num2} = " + result);
                    break;
                case "*":
                    result = num1 * num2;
                    Console.WriteLine($"Result : {num1} * {num2} = " + result);
                    break;
                case "/":
                    while (num2 == 0)
                    {
                        Console.WriteLine("Enter a non-zero divisor: ");
                        num2 = ReadFromConsole.ReadNumberFromConsole();
                    }
                    result = num1 / num2;
                    Console.WriteLine($"Result : {num1} / {num2} = " + result);

                    break;
                case "%":
                    while (num2 == 0)
                    {
                        Console.WriteLine("Division with zero returns a non-real number. Enter a non-zero divisor: ");
                        num2 = ReadFromConsole.ReadNumberFromConsole();
                    }
                    result = num1 % num2;
                    Console.WriteLine($"Result : {num1} % {num2} = " + result);
                    break;
                case "square root":
                    while (num1 < 0)
                    {
                        Console.WriteLine("Only non-negative numbers are permitted under a root. Enter a non-negative number: ");
                        num1 = ReadFromConsole.ReadNumberFromConsole();
                    }
                    result = Math.Pow(num1, 1 / num2);
                    Console.WriteLine($"Result : {num1} sqrt {num2} = " + result);                  
                    break;
            }
            return result;           
        }
    }
}
