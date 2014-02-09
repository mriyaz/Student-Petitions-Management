<%-- 
    Document   : info
    Created on : Jan 20, 2014, 6:04:10 PM
    Author     : adelahmed
--%>

<%@page import="banner.kfupm.edu.sa.DataServiceFault"%>
<%@page import="banner.kfupm.edu.sa.Student"%>
<%@page import="sa.edu.kfupm.sapms.data.SAPMS_Model"%>
<%@page import="sa.edu.kfupm.sapms.data.ExceptionInvalidStudentID" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    String accountID = request.getParameter("accountID");
    String uiType = request.getParameter("uiType");
    if (uiType == null)
    {
        uiType = "";
    }
    String parentID = request.getParameter("parentID");
    if (parentID == null)
    {
        parentID = "";
    }

    try
    {
        Student s = SAPMS_Model.getStudentInfo(accountID.substring(1));
        
        
%>
<!-- ############## Normal Page ################ -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <%                if (uiType.equals("accordian"))
                {
            %>
            <a data-toggle="collapse" data-parent="#<%=parentID%>"
               href="#collapseInfo<%=s.getSTUID()%>"> Hi <%=s.getSTUNAME()%>
            </a>
            <%
            }
            else
            {
            %>
            Hi
            <%=s.getSTUNAME()%>
            <%
                }
            %>
        </h4>
    </div>
    <%
        if (uiType.equals("accordian"))
        {
    %>
    <div id="collapseInfo<%=s.getSTUID()%>" class="panel-collapse collapse in">
        <%
        }
        else
        {
            
        %>

        <%
            }
        %>

        <div class="panel-body">
            <ul class="list-group">
                <li class="list-group-item"><span class="label label-primary">KFUPM
                        ID:</span> <%=s.getSTUID()%></li>
                <li class="list-group-item"><span class="label label-primary">Department:</span> <%=s.getDEPTDESC()%> (<%=s.getSTUDEPT()%>)</li>
                <li class="list-group-item"><span class="label label-primary">Major:</span>  <%=s.getMAJORDESC()%> (<%=s.getSTUMAJOR()%>)</li>
                <li class="list-group-item"><span class="label label-primary">Comulative GPA:</span> <%=s.getCGPA()%></li>
                <li class="list-group-item"><span class="label label-primary">Email:</span> <%=s.getSTUEMAIL()%></li>
                <li class="list-group-item"><span class="label label-primary">Mobile:</span> <%=s.getSTUPHONE()%></li>
            </ul>
        </div>
        <%
            if (uiType.equals("accordian"))
            {
        %>
    </div>
    <%
        }
    %>
</div>


<!-- ############## END Normal Page ################# --> 
<%
}
catch (ExceptionInvalidStudentID invalidStudentID)
{
//TODO build the appropriate page
%>
<!-- ############### Invalid Student ID Page ############### -->

<div class="alert alert-danger">The Student ID is invalid.</div>

<!-- ########### END Invalid Student ID Page ############# -->
<%
}
catch (DataServiceFault connectionError)
{
//TODO build the check network page
    // display error page mentioning that the netowrk is not working
%>
<!-- ############### Check Internet Connection Page ############### 

<div class="alert alert-danger">We are unable to connect to the KFUPM datastore. The issue will be resolved shortly. Please try again after a little while.</div>

 ########### END Check Internet Connection Page ############# -->


<%
    }

%>

