using System;
using System.Drawing;
using System.IO;

public class ImageChecker
{
	public static void Main(String[] args) 
	{

		// Compare args[0] and args[1]
		// If they are very similar delete args[0]
		
		Bitmap imgOne = new Bitmap(Image.FromFile(args[0]));
		Bitmap imgTwo = new Bitmap(Image.FromFile(args[1]));
		
		if(ImgCompare(imgOne, imgTwo))
		{
			File.Delete(args[0]);
			Console.WriteLine("ImageChecker deleted the older image!");
		}
	}
	
	private static bool ImgCompare(Bitmap one, Bitmap two)
	{
		if(one.Width == two.Width && one.Height == two.Height)
		{
			int count = 0;

			for(int i = 0; i < one.Width; i++)
			{
				for(int j = 0; j < one.Height; j++)
				{
					Color oneColor = one.GetPixel(i, j);
					Color twoColor = two.GetPixel(i, j);
					
					if(!SimilarColors(oneColor, twoColor))
					{
						count++;
					}
				}
			}

			Console.WriteLine(count);
			if(count <=15000) 
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	private static bool SimilarColors(Color colorOne, Color colorTwo)
	{
		if (Math.Abs(colorOne.GetHue()-colorTwo.GetHue()) <= 36)
		{
			//Console.WriteLine("Hue");
			return true;
		}
		if (Math.Abs(colorOne.GetBrightness()-colorTwo.GetBrightness()) <= .1)
		{
			//Console.WriteLine("Hue");
			return true;
		}
		if (Math.Abs(colorOne.GetSaturation()-colorTwo.GetSaturation()) <= .1)
		{
			//Console.WriteLine("Hue");
			return true;
		}
		return false;
	}
}
