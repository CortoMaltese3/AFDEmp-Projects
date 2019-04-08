using System;

namespace MyCalculator
{
    class Bonus4
    {
        public void Calculator()
        {
            Console.WriteLine("\r\nBONUS 4 STEP IS RUNNING...");
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
            Console.WriteLine("Type one of the following to choose a math operation accordingly: ");
            Console.WriteLine("\t'1' or add -> Add the two numbers");
            Console.WriteLine("\t'2' or substract -> Subtract the two numbers");
            Console.WriteLine("\t'3' or multiply -> Multiply the two numbers");
            Console.WriteLine("\t'4' or divide -> Divide the two numbers");
            Console.Write("Type your option ");
            
            switch (Console.ReadLine())
            {
                case "add": case "1" :      //TODO να το βαλω από κάτω, ειναι καλύτερο
                    Console.WriteLine($"Your result: {num1} + {num2} = " + (num1 + num2));
                    break;
                case "substract": case "2" :
                    Console.WriteLine($"Your result: {num1} - {num2} = " + (num1 - num2));
                    break;
                case "multiply": case "3" :
                    Console.WriteLine($"Your result: {num1} * {num2} = " + (num1 * num2));
                    break;
                case "divide": case "4" :
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
            Console.Write("Press any key to close the Calculator BONUS 4 console app...\r\n");
            Console.ReadKey();
        }           
        }
    }
