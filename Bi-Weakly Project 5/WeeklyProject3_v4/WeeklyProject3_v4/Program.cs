using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace WeeklyProject3_v4
{
    class Program
    //Create a simple program that reads students from the file Lab3.txt file and stores them in a list. 
    //Students will have a name, surname, age, height, tuition, date that started the school and phone. Every student will also have a conduct (Poor, Good, Excellent).
    //Then create a method that sorts the list by the student surname or student age or student phone.
    {

        static void Main(string[] args)
        {
            //List<string> txtData2 = File.ReadAllLines(@"C:\Users\giorg\Documents\Coding\AFDEmp\C#\Bi-Weakly Project 3\Lab3test.txt")

            //List<string> txtData = File.ReadLines(@"C:\Users\giorg\Documents\Coding\AFDEmp\C#\Bi-Weakly Project 3\Lab3.txt").ToList();

            StreamReader sr = File.OpenText(@"C:\Users\giorg\Documents\Coding\AFDEmp\C#\Bi-Weakly Project 3\Lab3.txt");
            var sr1 = sr.ReadToEnd();

            //List<string> txtData = File.ReadLines(@"C:\Users\giorg\Documents\Coding\AFDEmp\C#\Bi-Weakly Project 3\Lab3.txt").Skip(1).Take(1).ToList();

            //txtData[0].Split(new string[] { "," }, StringSplitOptions.None);
            //Console.WriteLine(txtData[2]);


            //var studentGiorgos = File.ReadAllLines(@"C:\Users\giorg\Documents\Coding\AFDEmp\C#\Bi-Weakly Project 3\Lab3.txt").Skip(1).Take(1).ToList();
            //List<string> list1 = studentGiorgos.Split(new string[] { "," }, StringSplitOptions.None).ToList();
            //List<string> studentGiorgosList = studentGiorgos.Split(new string[] { "," }, StringSplitOptions.None).ToList();

            //Console.WriteLine(studentGiorgos[0]);

            List<string> list = sr1.Split(new string[] { "," }, StringSplitOptions.None).ToList();
            Console.WriteLine("The Lab3.txt file contains the following list: \r\n");
            foreach (string s in list)
            {
                Console.Write(s+ ",");
            }

            Console.WriteLine();

            Console.WriteLine();
            Student giorgos = new Student();
            giorgos.FirstName = list[6];
            giorgos.LastName = list[7];
            giorgos.Age = list[8];
            giorgos.Height = list[9];
            giorgos.Tuition = list[10];
            giorgos.Date = list[11];
            giorgos.Phone = list[12];



            Student afroditi = new Student();
            afroditi.FirstName = list[13];
            afroditi.LastName = list[14];
            afroditi.Age = list[15];
            afroditi.Height = list[16];
            afroditi.Tuition = list[17];
            afroditi.Date = list[18];
            afroditi.Phone = list[19];

            int x = list[15].CompareTo(list[8]);
            //Console.WriteLine(x);
            if (x == -1)
            {
                //list
                
            }

            //Console.WriteLine(list[12]);


            //Console.WriteLine(giorgos);

            //for (int i = 0; i < 7; i++)
            //{
            //    Console.WriteLine(giorgos(i));
            //}


            //list[0] = 


            TxtReadLines linecount = new TxtReadLines();

            //string GetLine(string fileName, int line)
            //{

                
            //    //using (var sr = new StreamReader(@"C:\Users\giorg\Documents\Coding\AFDEmp\C#\Bi-Weakly Project 3\Lab3.txt"))
            //    //{
            //    //    for (int i = 1; i < linecount.LineCount(); i++)
            //    //        sr.ReadLine();
            //    //    return sr.ReadLine();

            //    //}
            //}

            ////GetLine(@"C:\Users\giorg\Documents\Coding\AFDEmp\C#\Bi-Weakly Project 3\Lab3.txt", 1); 
            //var afroditi = GetLine(@"C:\Users\giorg\Documents\Coding\AFDEmp\C#\Bi-Weakly Project 3\Lab3.txt", 1);
            //afroditi.Split(',');
            //for (int i = 0; i<20;i++)
            //{
            //    Console.Write(afroditi.Split(',')[10]);
            //}
            
            





            for (int index = 0; index < linecount.LineCount(); index++)
            {
               //Console.WriteLine(sr.ReadLine());
                //Console.WriteLine(txtData[index]);
            }
            Console.WriteLine();

            //var giorgos = txtData[1].Reverse();


            //foreach (var letter in giorgos)
            //{
            //    //Console.Write(letter + " ");
            //}


            //for (int index = 0; index < linecount.LineCount(); index++)
            //{
            //    txtData
            //    Console.WriteLine(txtData[index]);
            //}




            //List<object> firstRow = new List<object>();
            //firstRow = txtData[0];
            
            Console.ReadKey();
        }

        public static void Swap<T>(IList<T> list, int indexA, int indexB)
        {
            T tmp = list[indexA];
            list[indexA] = list[indexB];
            list[indexB] = tmp;
        }

        
    }
}