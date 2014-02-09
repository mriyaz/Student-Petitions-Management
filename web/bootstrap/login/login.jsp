
<%@page import="sa.edu.kfupm.sapms.data.SAPMS_Util_V1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String kfupmID = "";
    String accountID = "";

    if (email != null)
    {
        accountID = email.substring(0, email.indexOf("@"));
        if (email.startsWith("s19") || email.startsWith("s20") || email.startsWith("g19") || email.startsWith("g20"))
        {
            // student user
            kfupmID = email.substring(1, email.indexOf("@"));
        }
        else
        {
            // faculty 
            //TODO kfupmID = GET_KFUPM_ID_OF_FACULTY_FROM_KFUPM_DB_USING_ITC_USER_ID
            kfupmID = "1961342";
        }
    }
%>

<div class="panel panel-default">
    <script>
        window.SAPMS = window.SAPMS || {};
        $("#div_student").hide();
        $("div_faculty").hide();
        $("#div_nav").hide();
        $("#div_login").show();
    </script>
    <!-- Default panel contents -->
    <div class="panel-heading">Login Panel</div>
    <div class="panel-body">
        <p>Welcome to the Student Academic Petition Management System (SAP-MS).</p>
        <p>You may use your KFUPM Email credentials to log-into the system</p>
    </div>
    <div class="well">
        <div class="input-group">
            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;Email &nbsp;&nbsp;&nbsp;</span>
            <input type="email" class="form-control" id="field_Email" placeholder="KFUPM Email" value="s200880820@kfupm.edu.sa">
        </div>
        <div class="input-group">
            <span class="input-group-addon">Password</span>
            <input type="password" class="form-control" id="field_Password" placeholder="KFUPM Email Password" value="network">
        </div>
        <%
            String signUserIn = SAPMS_Util_V1.signUserIn(email, password);
            if (signUserIn.equals("START"))
            {
        %>
        <div id="alert_loginError" class="alert alert-danger"></div>
        <script>
            $("#alert_loginError").hide();
        </script>
        <%        }
        else if (signUserIn.equals("FACULTY"))
        {
        %>
        <div id="alert_loginError" class="alert alert-danger"></div>
        <script>
            $("#alert_loginError").hide();
            SAPMS.user.userType = '<%="FACULTY"%>';
            SAPMS.user.isUserLoggedIn = true;
            SAPMS.user.accountID = '<%=accountID%>';
            SAPMS.user.kfupmID = '<%=kfupmID%>';
            SAPMS.util.loadPage("faculty/facultyPage.jsp", 'accountID:' + SAPMS.user.accountID, "#div_faculty");
            SAPMS.util.loadPage("nav/navbar.jsp", "", "#div_nav");
        </script>
        <%        }
        else if (signUserIn.equals("STUDENT"))
        {
        %>
        <div id="alert_loginError" class="alert alert-danger"></div>
        <script>
            $("#alert_loginError").hide();
            SAPMS.user.userType = '<%="STUDENT"%>';
            SAPMS.user.isUserLoggedIn = true;
            SAPMS.user.accountID = '<%=accountID%>';
            SAPMS.user.kfupmID = '<%=kfupmID%>';
            SAPMS.util.loadPage("student/studentPage.jsp", 'accountID:' + SAPMS.user.accountID, "#div_student");
            SAPMS.util.loadPage("nav/navbar.jsp", "", "#div_nav");
        </script>
        <%                }
        else
        {
        %>
        <div id="alert_loginError" class="alert alert-danger">Please enter a valid email and password.</div>
        <script>
            $("#alert_loginError").show();
        </script>
        <%            }
        %>
        <center>
            <div class="btn-group">
                <button type="button" class="btn btn-default" id="btn_SignIn">Sign in</button>
                <script>
                    $("#btn_SignIn").unbind('click');
                    $("#btn_SignIn").click(function() {
                        SAPMS.util.loadPage("login/login.jsp",
                                "email:" + $("#field_Email").val() + ",password:" + $("#field_Password").val(),
                                "#div_login");
                    });
                </script>
                <button type="button" class="btn btn-default" id="btn_Reset">Reset</button>
                <script>
                    $("#btn_Reset").click(function() {
                        $("#field_Email").val('');
                        $("#field_Password").val('');
                    });
                </script>
            </div>
        </center>
    </div>
</div>