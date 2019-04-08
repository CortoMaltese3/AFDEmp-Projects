using System;

namespace MyCalculator
{
    class Bonus1
    {
        public void Calculator()
        {
            Console.WriteLine("\r\nBONUS 1 STEP IS RUNNING...");
            //while(true) will run infinitely
            while (true)
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
                Console.Write("Press any key to continue the Calculator console app...\r\n");
                Console.ReadKey();
            }
        }
    }
} 