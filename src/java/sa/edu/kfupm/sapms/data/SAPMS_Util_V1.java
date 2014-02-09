package sa.edu.kfupm.sapms.data;


import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SAPMS_Util_V1
{

    static private SAPMS_Model model = new SAPMS_Model();

    private static String[] GRADES =
    {
        "A+", "A", "B+", "B", "C+", "C", "D+", "D", "F", "NP", "NF"
    };
    public static String[] SUBJECTS =
    {
        "ICS", "MATH", "IAS", "COE", "ISE", "SIA", "SWE"
    };
    public static String CAPITAL_ALPHABETS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static String SMALL_ALPHABETS = "abcdefghijklmnopqrstuvwxyz";
    public static Random RND = new Random();

    public static String getRandomGrade()
    {
        return GRADES[RND.nextInt(GRADES.length)];
    }

    public static int getRandomInRange(int min, int max)
    {
        return RND.nextInt((max - min) + 1) + min;
    }

    public static String getRandomSubject()
    {
        return SUBJECTS[RND.nextInt(SUBJECTS.length)];
    }

    public static String getRandomCourseTitle()
    {
        StringBuilder sb = new StringBuilder();
        for (int wordCount = 0; wordCount < RND.nextInt(4) + 1; wordCount++)
        {
            // first letter is capital
            sb.append(CAPITAL_ALPHABETS.charAt(RND.nextInt(CAPITAL_ALPHABETS.length())));
            for (int wordLength = 0; wordLength < RND.nextInt(8) + 1; wordLength++)
            {
                sb.append(SMALL_ALPHABETS.charAt(RND.nextInt(SMALL_ALPHABETS.length())));
            }
            sb.append(" ");
        }
        return sb.toString();
    }

    public static String signUserIn(String email, String password)
    {
        if (email == null || password == null)
        {
            return "START";
        }
        if (email.equals("adelahmed@kfupm.edu.sa") && password.equals("network"))
        {
            return "FACULTY";
        }
        else if (email.equals("s200880820@kfupm.edu.sa") && password.equals("network"))
        {
            return "STUDENT";
        }
        return "UNKNOWN";
    }

}
