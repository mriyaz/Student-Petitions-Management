package sa.edu.kfupm.sapms.data;

public class SAPMS_Login_V1
{
	private String email = "UNKNOWN";
    private String kfupmID = "UNKNOWN";
    private String loginStatus = "FAIL"; // SUCCESS, FAIL
    private String userType = "UNKNOWN";

    public SAPMS_Login_V1()
    {
    }
    
   
    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getKfupmID()
    {
        return kfupmID;
    }

    public void setKfupmID(String kfupmID)
    {
        this.kfupmID = kfupmID;
    } 

    public String getLoginStatus()
    {
        return loginStatus;
    }

    public void setLoginStatus(String loginStatus)
    {
        this.loginStatus = loginStatus;
    }

    public String getUserType()
    {
        return userType;
    }

    public void setUserType(String userType)
    {
        this.userType = userType;
    }
} 