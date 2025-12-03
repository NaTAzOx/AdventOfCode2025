List<string> ReadInFile(string filePath)
{
    List<string> lines = new List<string>();
    try
    {
        using (StreamReader reader = new StreamReader(filePath))
        {
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                lines.Add(line);
            }
        }
    }
    catch (Exception e)
    {
        Console.WriteLine("An error occurred: " + e.Message);
    }
    return lines;
}

Console.WriteLine("Reading file content:");
List<string> fileLines = ReadInFile("input.txt");
long result = 0;
foreach (string line in fileLines)
{
    int greatest = 0;
    int second_greatest = 0;
    int third_greatest = 0;
    int fourth_greatest = 0;
    int fifth_greatest = 0;
    int sixth_greatest = 0;
    int seventh_greatest = 0;
    int eighth_greatest = 0;
    int ninth_greatest = 0;
    int tenth_greatest = 0;
    int eleventh_greatest = 0;
    int twelth_greatest  = 0;
    int index = 0;
    foreach (char character in line)
    {
        int number = Int32.Parse(character.ToString());
        if (number > greatest && index < line.Length - 11)
        {
            greatest = number;
            second_greatest = 0;
            third_greatest = 0;
            fourth_greatest = 0;
            fifth_greatest = 0;
            sixth_greatest = 0;
            seventh_greatest = 0;
            eighth_greatest = 0;
            ninth_greatest = 0;
            tenth_greatest = 0;
            eleventh_greatest = 0;
            twelth_greatest = 0;
        } else if (number > second_greatest && index < line.Length - 10)
        {
            second_greatest = number;
            third_greatest = 0;
            fourth_greatest = 0;
            fifth_greatest = 0;
            sixth_greatest = 0;
            seventh_greatest = 0;
            eighth_greatest = 0;
            ninth_greatest = 0;
            tenth_greatest = 0;
            eleventh_greatest = 0;
            twelth_greatest = 0;
        } else if (number > third_greatest && index < line.Length - 9)
        {
            third_greatest = number;
            fourth_greatest = 0;
            fifth_greatest = 0;
            sixth_greatest = 0;
            seventh_greatest = 0;
            eighth_greatest = 0;
            ninth_greatest = 0;
            tenth_greatest = 0;
            eleventh_greatest = 0;
            twelth_greatest = 0;
        } else if (number > fourth_greatest && index < line.Length - 8)
        {
            fourth_greatest = number;
            fifth_greatest = 0;
            sixth_greatest = 0;
            seventh_greatest = 0;
            eighth_greatest = 0;
            ninth_greatest = 0;
            tenth_greatest = 0;
            eleventh_greatest = 0;
            twelth_greatest = 0;
        } else if (number > fifth_greatest && index < line.Length - 7)
        {
            fifth_greatest = number;
            sixth_greatest = 0;
            seventh_greatest = 0;
            eighth_greatest = 0;
            ninth_greatest = 0;
            tenth_greatest = 0;
            eleventh_greatest = 0;
            twelth_greatest = 0;
        } else if (number > sixth_greatest && index < line.Length - 6)
        {
            sixth_greatest = number;
            seventh_greatest = 0;
            eighth_greatest = 0;
            ninth_greatest = 0;
            tenth_greatest = 0;
            eleventh_greatest = 0;
            twelth_greatest = 0;
        } else if (number > seventh_greatest && index < line.Length - 5)
        {
            seventh_greatest = number;
            eighth_greatest = 0;
            ninth_greatest = 0;
            tenth_greatest = 0;
            eleventh_greatest = 0;
            twelth_greatest = 0;
        } else if (number > eighth_greatest && index < line.Length - 4)
        {
            eighth_greatest = number;
            ninth_greatest = 0;
            tenth_greatest = 0;
            eleventh_greatest = 0;
            twelth_greatest = 0;
        } else if (number > ninth_greatest && index < line.Length - 3)
        {
            ninth_greatest = number;
            tenth_greatest = 0;
            eleventh_greatest = 0;
            twelth_greatest = 0;
        } else if (number > tenth_greatest && index < line.Length -2)
        {
            tenth_greatest = number;
            eleventh_greatest = 0;
            twelth_greatest = 0;
        } else if (number > eleventh_greatest && index < line.Length - 1)
        {
            eleventh_greatest = number;
            twelth_greatest = 0;
        } else if (number > twelth_greatest)
        {
            twelth_greatest = number;
        }
        index += 1;
    }
    long assembly = Int64.Parse(greatest.ToString() + second_greatest.ToString() + third_greatest.ToString() + fourth_greatest.ToString() + fifth_greatest.ToString() +
    sixth_greatest.ToString() + seventh_greatest.ToString() + eighth_greatest.ToString() + ninth_greatest.ToString() + tenth_greatest.ToString() + eleventh_greatest.ToString() +
    twelth_greatest.ToString());

    result += assembly;
    Console.WriteLine(result);
} 

