using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeeklyProject3_class_answear
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            { 
                string[] lines = File.ReadAllLines(@"C:\Users\giorg\Documents\Coding\AFDEmp\C#\Bi-Weakly Project 3\Lab3.txt");

                List<Student> Students = new List<Student>();

                Console.WriteLine("The Lab3.txt contains the following list: ");

                foreach (string line in lines)
                {
                    Console.Write("\n" + line);
                }

                Console.WriteLine();

                for (int line=1; line<lines.Length; line++)
                {
                    string[] fields = lines[line].Split(',');
                    Student newStudent = new Student(fields[0], fields[1], int.Parse(fields[2]), double.Parse(fields[3]), int.Parse(fields[4]), DateTime.Parse(fields[5]), long.Parse(fields[6]), Conduct.Good);
                    Students.Add(newStudent);
                }

                Student.SortingPoint = SortingFilter.ByAge;
                Students.Sort();

                foreach(Student EveryStudent in Students)
                {
                    Console.WriteLine(EveryStudent);
                }
            }
            catch (Exception FileProblem)
            {
                Console.WriteLine(FileProblem);
                Console.WriteLine("File Problem");
            }

            Console.ReadKey();
        }
    }
}
