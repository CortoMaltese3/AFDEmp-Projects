using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeeklyProject3_v4
{
    public class Student
    {
        //TODO : add conduct behavior? list? enum?
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Age { get; set; }
        public string Height { get; set; }
        public string Tuition { get; set; }
        public string Date { get; set; }
        public string Phone { get; set; }

        public Student()
        {

        }


        public Student(string firstName, string lastName, string age, string height, string tuition, string date, string phone)
        {
            FirstName = firstName;
            LastName = lastName;
            Age = age;
            Height = height;
            Tuition = tuition;
            Date = date;
            Phone = phone;
        }

        public override string ToString()
        {
            return string.Format("{0},{1},{2},{3},{4},{5},{6}", FirstName, LastName, Age, Height, Tuition, Date, Phone);
        }
    }


}
