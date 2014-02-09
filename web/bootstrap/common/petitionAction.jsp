<%-- 
    Document   : petitionAction
    Created on : Jan 23, 2014, 11:51:34 PM
    Author     : adelahmed
--%>
<%@page import="sa.edu.kfupm.sapms.data.SAPMS_Util_V1"%>
<%
	String petitionID = request.getParameter("petitionID");
	String actionID = request.getParameter("actionID");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">FACULTY's Reply on Action <%=actionID%></h3>
	</div>
	<div class="panel-body">
		<span class="label label-danger">Question:</span> 25-JUN-2013
		<p>
			<%
				StringBuilder sb = new StringBuilder();
				for (int j = 0; j < SAPMS_Util_V1.getRandomInRange(10, 180); j++)
				{
					sb.append(SAPMS_Util_V1.getRandomCourseTitle()).append(" ");
				}
			%>
			<%=sb.toString()%>
		</p>
		<span class="label label-success">Answer</span> 29-JUN-2013
		<p>
			<%
				sb = new StringBuilder();
				for (int j = 0; j < SAPMS_Util_V1.getRandomInRange(10, 280); j++)
				{
					sb.append(SAPMS_Util_V1.getRandomCourseTitle()).append(" ");
				}
			%>
			<%=sb.toString()%>
		</p>
	</div>
</div>
