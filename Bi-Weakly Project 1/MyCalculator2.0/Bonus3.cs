using System;

namespace MyCalculator
{
    class Bonus3
    {
        public void Calculator()
        {
            Console.WriteLine("\r\nBONUS 3 STEP IS RUNNING...");
            float num1 = 0; float num2 = 0;
            Console.WriteLine("\r\nConsole Calculator in C#\r");
            Console.WriteLine("------------------------\n");

            Console.WriteLine("Type a number, and then press Enter");
            num1 = float.Parse(Console.ReadLine());

            Console.WriteLine("Type another number, and then press Enter");
            num2 = float.Parse(Console.ReadLine());

            while ((num1 > 100 | num1 < -100) | (num2 > 100 | num2 < -100))
            {
                Console.WriteLine("Both numbers need to be in range -100, +100. Type a number and then press Enter");
                num1 = float.Parse(Console.ReadLine());
                Console.WriteLine("Type another number, and then press Enter");
                num2 = float.Parse(Console.ReadLine());
            }
            Console.WriteLine("Type one of the following to choose a math operation accordingly:");
            Console.WriteLine("\tadd -> Add the two numbers");
            Console.WriteLine("\tsubstract -> Subtract the two numbers");
            Console.WriteLine("\tmultiply -> Multiply the two numbers");
            Console.WriteLine("\tdivide -> Divide the two numbers");
            Console.Write("Type your option: ");

            switch (Console.ReadLine())
            {
                case "add":
                    Console.WriteLine($"Your result: {num1} + {num2} = " + (num1 + num2));
                    break;
                case "substract":
                    Console.WriteLine($"Your result: {num1} - {num2} = " + (num1 - num2));
                    break;
                case "multiply":
                    Console.WriteLine($"Your result: {num1} * {num2} = " + (num1 * num2));
                    break;
                case "divide":
                    while (num2 == 0)
                    {
                        Console.WriteLine("Enter a non-zero divisor: ");
                        num2 = Convert.ToInt16(Console.ReadLine());
                    }
                    Console.WriteLine($"Your result: {num1} / {num2} = " + (num1 / num2));
                    break;
                default:
                    Console.WriteLine("That is an incorrect option entry, please try again.");
                    break;
            }
            Console.Write("Press any key to close the Calculator BONUS 3 console app...\r\n");
            Console.ReadKey();
        }
    }
}