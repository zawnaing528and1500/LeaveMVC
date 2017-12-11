using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Leave.App_Code
{
    public class ClassProgram1
    {
        public string printHello()
        {
            return "Hello! Zaw Naing";
        }
        
        public string[] getTrimData()
        {
            string s = "Item1,Item2, Item3, Item4";
            string[] values = s.Split(',');
            for (int i = 0; i < values.Length; i++)
            {
                values[i] = values[i].Trim();
            }
            return values;
        } 
    }
}