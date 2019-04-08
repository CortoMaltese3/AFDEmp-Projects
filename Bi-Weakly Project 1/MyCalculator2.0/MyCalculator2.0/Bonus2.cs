using System;

namespace MyCalculator
{
    class Bonus2
    {
        public void Calculator()
        {
            //Bonus2 will run infinitely unless the user hits the 'x' or 'X' key when asked to do so
            Console.WriteLine("\r\nBONUS 2 STEP IS RUNNING...");
            Console.WriteLine("\r\nType 'x' or 'X' if you want to exit the calculator...");
            while (true & ((Console.ReadKey().Key != ConsoleKey.X)))
            {
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
                Console.WriteLine("Choose an option from the following list:");
                Console.WriteLine("\ta - Add");
                Console.WriteLine("\ts - Subtract");
                Console.WriteLine("\tm - Multiply");
                Console.WriteLine("\td - Divide");
                Console.Write("Your option? ");

                switch (Console.ReadLine())
                {
                    case "a":
                        Console.WriteLine($"Your result: {num1} + {num2} = " + (num1 + num2));
                        break;
                    case "s":
                        Console.WriteLine($"Your result: {num1} - {num2} = " + (num1 - num2));
                        break;
                    case "m":
                        Console.WriteLine($"Your result: {num1} * {num2} = " + (num1 * num2));
                        break;
                    case "d":
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
                Console.WriteLine("\r\nType 'x' or 'X' if you want to exit the calculator...\r\n");
            }
        }
    }
}
