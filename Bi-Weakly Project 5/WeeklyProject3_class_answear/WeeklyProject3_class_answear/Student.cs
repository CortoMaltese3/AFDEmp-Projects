using System;

namespace WeeklyProject3_class_answear
{
    class Student : IComparable<Student>
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public int Age { get; set; }
        public double Height { get; set; }
        public int Tuition { get; set; }
        public DateTime Date { get; set; }
        public long Phone { get; set; }
        public Conduct StudentConduct { get; set; }

        public static SortingFilter SortingPoint { get; set; } //για να μη φτιαχνει κάθε φορά καινουριο sorting filter

        public Student()
        {

        }

        public Student(string firstName, string lastName, int age, double height, int tuition, DateTime date, long phone, Conduct studentConduct)
        {
            Name = firstName;
            Surname = lastName;
            Age = age;
            Height = height;
            Tuition = tuition;
            Date = date;
            Phone = phone;
            StudentConduct = studentConduct;
        }

        public override string ToString()
        {
            return string.Format("{0},{1},{2},{3},{4},{5},{6}", Name, Surname, Age, Height, Tuition, Date, Phone);
        }

        public int CompareTo(Student OtherStudent)
        {
            switch (SortingPoint)
            {      
                case SortingFilter.ByName:
                default:
                    return OtherStudent.Name.CompareTo(Name);
                case SortingFilter.ByAge:
                    return OtherStudent.Age.CompareTo(Age);
                case SortingFilter.ByPhone:
                    return OtherStudent.Phone.CompareTo(Phone);
            }
        }
    }

    enum SortingFilter
    {
        ByName,
        ByAge,
        ByPhone
    }

    enum Conduct
    {
        Poor,
        Good,
        Excellent
    }
}
