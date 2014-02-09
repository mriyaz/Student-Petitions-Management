<%-- 
    Document   : transcript
    Created on : Jan 20, 2014, 6:03:59 PM
    Author     : adelahmed
--%>


<%@page import="banner.kfupm.edu.sa.DataServiceFault"%>
<%@page import="banner.kfupm.edu.sa.Course"%>
<%@page import="banner.kfupm.edu.sa.Student"%>
<%@page import="sa.edu.kfupm.sapms.data.SAPMS_Model"%>
<%@page import="java.util.Date"%>
<%@page import="sa.edu.kfupm.sapms.data.SAPMS_Util_V1"%>
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

        java.util.List<banner.kfupm.edu.sa.Course> transcript = SAPMS_Model.getStudentTranscript(accountID.substring(1));

%>
<!-- ############## Normal Page ################ -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <%                if (uiType.equals("accordian"))
                {
            %> 
            <a data-toggle="collapse" data-parent="#<%=parentID%>" href="#collapseTranscript<%=s.getSTUID()%>">
                Transcript
            </a>
            <%        }
            else
            {
            %>
            Transcript
            <%                }
            %>
        </h4>
    </div>
    <%
        if (uiType.equals("accordian"))
        {
    %>
    <div id="collapseTranscript<%=s.getSTUID()%>" class="panel-collapse collapse">
        <%

        }
        else
        {
        %>

        <%                }
        %>

        <div class="panel-body">
            <div class="list-group">
                <%
                    for (Course course : transcript)
                    {
                        String color = "";
                        if (course.getGRADE().equals("A+") || course.getGRADE().equals("A") )
                        {
                            color = " list-group-item-success";
                        }
                        else if (course.getGRADE().equals("B+") || course.getGRADE().equals("B") )
                        {
                            color = " list-group-item-info";
                        }
                        else if (course.getGRADE().equals("C+") || course.getGRADE().equals("C") )
                        {
                            color = " list-group-item-warning";
                        }
                        else if (course.getGRADE().equals("D+") || course.getGRADE().equals("D") )
                        {
                            color = " list-group-item-danger";
                        }
                %>      
                <a href="#" class="list-group-item<%=color%>">
                    <h4 class="list-group-item-heading"><%= course.getCOURSEID()%> <%= course.getCOURSENAME()%> (<%=course.getCREDITHOURS()%> Hrs.)</h4>
                    <span class="badge"><%= course.getGRADE()%></span>
                    <p class="list-group-item-text">Term: <%= course.getTERM()%></p>
                    
                </a>
                <%
                    }
                %>

            </div>
        </div>
        <div id="panel_studentTranscriptFooter" class="panel-footer"><center>Generated on <%= (new Date()).toString()%></center></div>
                <%
                    if (uiType.equals("accordian"))
                    {
                %>
    </div>
    <%            }
    %>
</div>

<!-- ########### END Invalid Student ID Page ############# -->
<%
}
catch (DataServiceFault connectionError)
{
//TODO build the check network page
    // display error page mentioning that the netowrk is not working
%>
<!-- ############### Check Internet Connection Page ############### -->

<div class="alert alert-danger">We are unable to connect to the KFUPM datastore. The issue will be resolved shortly. Please try again after a little while.</div>

<!-- ########### END Check Internet Connection Page ############# -->


<%
    }

%>