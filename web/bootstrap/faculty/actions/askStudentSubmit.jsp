<%-- 
    Document   : askStudentSubmit
    Created on : Jan 21, 2014, 12:26:28 AM
    Author     : adelahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String studentID = request.getParameter("studentID");
    String petitionID = request.getParameter("petitionID");
    String studentName = "THE NAME OF " + studentID;
%>

<p>Question sent to <%=studentID%>.</p>
<center>
    <button id="btn_closeQuestionSubmitMessageArea" type="button" class="btn btn-default">Done</button>
    <script>
        $("#btn_questionSubmit").addClass("disabled");
        $("#btn_closeQuestionSubmitMessageArea").click(function() {
            $("#btn_questionSubmit").removeClass("disabled");
            $("#panel_waitingPetitions").show();
            $("#panel_processedPetitions").show();
            $("#panel_processAPetition").hide();
            SAPMS.util.loadPage("faculty/processedPetitionList.jsp", "kfupmID:" + SAPMS.user.userID, "#panel_processedPetitions");
            SAPMS.util.loadPage("faculty/waitingPetitionList.jsp", "kfupmID:" + SAPMS.user.userID, "#panel_waitingPetitions");
        });
    </script>
</center>
