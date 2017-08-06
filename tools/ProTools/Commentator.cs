using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

namespace Commentator
{
    class Program
    {
        /// <summary>
        /// 
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

                // First, we save all the item's stats inside a dictionary
                var item = GetItemTemplate(line);

                // Finally, we create the comment and add it AND the SQL statement to the list
                result.Add($"-- {item["name"]}");
                result.Add(line);
            }

            // Saves to file
            Console.WriteLine($"Finished saving to: {args[1]}");
            File.AppendAllLines(args[1], result);
            Console.WriteLine("DONE!");
        }

        private static Dictionary<string, string> GetItemTemplate(string line)
        {
            var item = new Dictionary<string, string>();
            var keys = line.Split(new string[] { ") VALUES (" }, StringSplitOptions.None)[0]
                .Replace("REPLACE INTO `item_template` (", "")
                .Replace("`", "").Split(new string[] { ", " }, StringSplitOptions.None);
            var values = Regex.Replace(line.Split(new string[] { ") VALUES (" }, StringSplitOptions.None)[1]
                .Replace(");", "")
                .Replace("'", "")
                .Replace(@"\", ""), "[a-zA-Z], [a-zA-Z]", delegate (Match match) 
                {
                    return match.ToString().Replace(" ", "<REGEX>");
                })
                .Split(new string[] { ", " }, StringSplitOptions.None);
            values[3] = values[3].Replace("<REGEX>", " ");

            for (int i = 0; i < keys.Length; i++)
            {
                item.Add(keys[i], values[i]);
            }

            return item;
        }
    }
}
