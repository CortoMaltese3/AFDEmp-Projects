using System;

namespace MyCalculator
{
    class Program
    {
        static void Main(string[] args)
        {
            float num1 = 0; float num2 = 0;

            Console.WriteLine("Console Calculator in C#\r");
            Console.WriteLine("------------------------\n");

            Console.WriteLine("Type a number, and then press Enter");
            num1 = float.Parse(Console.ReadLine());     //used float.Parse to transform user input(string) to float (step10)

            Console.WriteLine("Type another number, and then press Enter");
            num2 = float.Parse(Console.ReadLine());

            while ((num1 > 100 | num1 < -100) | (num2 > 100 | num2 < -100))  //testing whether the input is in range -100,100 (step9-10)
            {
                Console.WriteLine("Both numbers need to be in range -100, +100. Type a number and then press Enter");
                num1 = float.Parse(Console.ReadLine());
                Console.WriteLine("Type another number, and then press Enter");
                num2 = float.Parse(Console.ReadLine());
            }

            /*while (num1 < 0 | num2 < 0)  //testing if the number is negative (step7)
            {
                Console.WriteLine("Both numbers need to be greater than zero. Type a number and then press Enter");
                num1 = Convert.ToInt32(Console.ReadLine());     //used Convert.ToInt32 to convert the string the user inputs to int
                Console.WriteLine("Type another number, and then press Enter");
                num2 = Convert.ToInt32(Console.ReadLine());
            }
            
            while ((num1 < 0 | num1 > 100) | (num2 < 0 | num2 > 100))  //testing if the number is negative or greater than 100 (step8)
            {
                Console.WriteLine("Both numbers need to be greater than zero and less than 100. Type a number and then press Enter");
                num1 = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Type another number, and then press Enter");
                num2 = Convert.ToInt32(Console.ReadLine());
            }
            */

            // Ask the user to choose an option
            Console.WriteLine("Choose an option from the following list:");
            Console.WriteLine("\ta - Add");
            Console.WriteLine("\ts - Subtract");
            Console.WriteLine("\tm - Multiply");
            Console.WriteLine("\td - Divide");
            Console.Write("Your option? ");

            // Use a switch statement to do the math
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
                    // Ask the user to enter a non-zero divisor until they do so
                    while (num2 == 0)
                    {
                        Console.WriteLine("Enter a non-zero divisor: ");
                        num2 = Convert.ToInt16(Console.ReadLine());
                    }
                    Console.WriteLine($"Your result: {num1} / {num2} = " + (num1 / num2));
                    break;
                // Return text for an incorrect option entry
                default:
                    Console.WriteLine("That is an incorrect option entry, please try again.");
                    break;
            }
            //Wait for the user to respond before closing
            Console.Write("Press any key to close the Calculator console app...\r\n");
            Console.ReadKey();

            //The rest of the program consists of the BONUS part and calls the classes Bonus1-4 to operate. 
            Console.WriteLine("\r\nDo you want to continue to the BONUS part of MyCalculator? Press Enter! \r\nIf you are satisfied with the basic version press Escape to end the program...");

            if (Console.ReadKey().Key == ConsoleKey.Enter)
            {
                Console.WriteLine("\r\nNice! Press any key to continue...\r\n");
                while (Console.ReadKey().Key != ConsoleKey.Escape)
                {
                    Console.WriteLine("\r\nChoose an option from the followin BONUS list: ");
                    Console.WriteLine("\t1 - Bonus 1 (program runs forever)");
                    Console.WriteLine("\t2 - Bonus 2 (program runs until user presses 'X' or 'x')");
                    Console.WriteLine("\t3 - Bonus 3 (user needs to type add-substruct-multiply-divide to use math operations accordingly)");
                    Console.WriteLine("\t4 - Bonus 4 (user needs to type add-substruct-multiply-divide or 1-2-3-4 respectively to use math operations accordingly)");
                    Console.Write("\r\n\tYour option?\r\n \r\n**Notice that if you go with Bonus 1 in the beginning there's no way to exit the loop. Try it in the end!**");

                    //checking if the user chooses an option in range 1-4
                    ConsoleKey user_option = Console.ReadKey().Key;
                    while (user_option != ConsoleKey.D1 & user_option != ConsoleKey.D2 & user_option != ConsoleKey.D3 & user_option != ConsoleKey.D4)
                    {
                        Console.WriteLine("\r\n\r\nProgram will run only if you choose one of the four options!");
                        Console.WriteLine("\r\nChoose an option from the followin BONUS list: ");
                        Console.WriteLine("\t1 - Bonus 1 (program runs forever)");
                        Console.WriteLine("\t2 - Bonus 2 (program runs until user presses 'X' or 'x')");
                        Console.WriteLine("\t3 - Bonus 3 (user needs to type add-substruct-multiply-divide to use math operations accordingly)");
                        Console.WriteLine("\t4 - Bonus 4 (user needs to type add-substruct-multiply-divide or 1-2-3-4 respectively to use math operations accordingly)");
                        Console.Write("\r\n\tYour option?\r\n \r\n**Notice that if you go with Bonus 1 in the beginning there's no way to exit the loop. Try it in the end!**");

                        user_option = Console.ReadKey().Key; //notice that user_option doesn't need to be initiated here since it inherits the property from outside
                    }
                    
                    //Bonus steps run depending on user's choice
                    switch (user_option)
                    {
                        case ConsoleKey.D1:
                            Bonus1 myBonus1 = new Bonus1();
                            myBonus1.Calculator();
                            break;

                        case ConsoleKey.D2:
                            Bonus2 myBonus2 = new Bonus2();
                            myBonus2.Calculator();
                            break;

                        case ConsoleKey.D3:
                            Bonus3 myBonus3 = new Bonus3();
                            myBonus3.Calculator();
                            break;

                        case ConsoleKey.D4:
                            Bonus4 myBonus4 = new Bonus4();
                            myBonus4.Calculator();
                            break;
                    }
                    Console.WriteLine("\r\nIf you are done checking MyCalculator press Escape. In any other case press any key to continue...");
                }
            }
            else
            {
                Console.WriteLine("\r\nThanks for using MyCalculator!");
                Console.ReadKey();
            }
        }
    }
}
