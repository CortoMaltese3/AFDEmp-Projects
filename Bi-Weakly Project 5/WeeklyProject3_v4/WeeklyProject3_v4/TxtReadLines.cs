using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeeklyProject3_v4
{
    public class TxtReadLines
    {
        public int LineCount()
        {
            int lineCount = File.ReadLines(@"C:\Users\giorg\Documents\Coding\AFDEmp\C#\Bi-Weakly Project 3\Lab3test.txt").Count();
            return lineCount;
        }

    }
}
