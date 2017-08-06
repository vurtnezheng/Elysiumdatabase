using System;
using System.Collections.Generic;
using System.IO;

namespace Commentator
{
    class Program
    {
        /// <summary>
        /// Adds a comment to each statement
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {
            if (args.Length < 2)
            {
                Console.WriteLine("Syntax: Commentator.exe <source file> <destination file>");
                return;
            }

            if (!File.Exists(args[0]))
            {
                Console.WriteLine($"{args[0]} doesn't exist!");
                return;
            }
            if (File.Exists(args[1])) File.Delete(args[1]);

            Console.WriteLine("Commentator");
            Console.WriteLine("===========");

            var result = new List<string>();
            var file = File.ReadAllLines(args[0]);
            foreach (var line in file)
            {
                Console.WriteLine($"Checking line: {line}");

                // First, we save all the item's stats inside an array
                var item = line.Split(new string[] { ") VALUES (" }, StringSplitOptions.None)[1].Replace(");", "").Replace("'", "").Split(new string[] { ", " }, StringSplitOptions.None);

                // Next, we get the individual values that we want to append in the comment
                var name = item[3].Replace(@"\", "");

                // Finally, we create the comment and add it AND the SQL statement to the list
                result.Add($"-- {name}");
                result.Add(line);
            }

            // Saves to file
            Console.WriteLine($"Finished saving to: {args[1]}");
            File.AppendAllLines(args[1], result);
            Console.WriteLine("DONE!");
            Console.ReadKey();
        }
    }
}
