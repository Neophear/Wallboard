using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Utilities
/// </summary>
public static class Utilities
{
	public static int ConvertFractionToLevel(string fraction)
	{
        string[] parts = fraction.Split('/');

        double numerator = int.Parse(parts[0]);
        double denominator = int.Parse(parts[1]);
        
        int level = 1;

        if (numerator != 0 && denominator != 0)
            level = (int)Math.Floor(numerator / denominator * 2) + 1;

        return level > 3 ? 3 : level;
	}
}