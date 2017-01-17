import java.util.*;

public void setup() {
	String lines[] = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) {
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
}
public int findFirstVowel(String sWord){
  	for (int i = 0; i < sWord.length(); i++)
  	{	

  		if (!sWord.contains("a") && !sWord.contains("e") && !sWord.contains("i") && !sWord.contains("o") && !sWord.contains("u"))
  		{
  			return -1;
  		}
  		if (sWord.substring(i, i+1).equals("a") || sWord.substring(i, i+1).equals("e") || sWord.substring(i, i+1).equals("i") || sWord.substring(i, i+1).equals("o") || sWord.substring(i, i+1).equals("u"))
  		{
  			return i;
  		}  
  		else if (sWord.substring(i, i+2).contains("qu"))
  		{
  			return -2; 			
  		}
  		else if (!sWord.substring(i, i+1).equals("a") || !sWord.substring(i, i+1).equals("e") || !sWord.substring(i, i+1).equals("i") || !sWord.substring(i, i+1).equals("o") || !sWord.substring(i, i+1).equals("u"))
  		{
  			return -3;
  		}
    }
  	return -4;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	String tWord = sWord.substring(2, sWord.length());
	String t2Word = new String();
	String r2Word = new String();
	for (int i = 0; i < sWord.length(); i++)
	{	
		if (findFirstVowel(sWord) == -3)
		{
			if (sWord.substring(i, i+1).equals("a") || sWord.substring(i, i+1).equals("e") || sWord.substring(i, i+1).equals("i") || sWord.substring(i, i+1).equals("o") || sWord.substring(i, i+1).equals("u"))
			{
				t2Word = sWord.substring(i-1, sWord.length());
				r2Word = sWord.substring(0, i-1);
				if (!t2Word.substring(0, 1).equals("a") && !t2Word.substring(0, 1).equals("e") && !t2Word.substring(0, 1).equals("i") && !t2Word.substring(0, 1).equals("o") && !t2Word.substring(0, 1).equals("u"))
				{
					t2Word = sWord.substring(i, sWord.length());
					r2Word = sWord.substring(0, i);
				}
			}
		}
	}

	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else if(findFirstVowel(sWord) == 0)
	{
		return sWord + "way";
	}
	else if(findFirstVowel(sWord) == -2)
	{
		return tWord + "quay";
	}
	else if(findFirstVowel(sWord) == -3)
	{
		return t2Word + r2Word + "ay";
	}
	else
	{
		return "ERROR!";
	}
}
