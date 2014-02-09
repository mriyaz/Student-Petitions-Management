<%-- 
    Document   : recommendationSubmit
    Created on : Jan 21, 2014, 1:00:42 AM
    Author     : adelahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String facultyID = request.getParameter("kfupmID");
    String studentID = request.getParameter("studentID");
    String petitionID = request.getParameter("petitionID");
    String studentName = "THE NAME OF " + studentID;
    String recommendation = request.getParameter("recommendation");
    String justification = request.getParameter("justification");
%>

<div class="alert alert-success">
    <p>Your recommendation about <%=studentID%>'s petition has been submitted. Your decision was '<%=recommendation%>' and your justification was '<%=justification%>'</p>
    <center>
        <button id="btn_closeRecommendationSubmitMessageArea" type="button" class="btn btn-default">Done</button>
        <script>
            $("#btn_recommendationSubmit").addClass("disabled");
            $("#btn_closeRecommendationSubmitMessageArea").click(function() {
                $("#btn_recommendationSubmit").removeClass("disabled");
                $("#panel_waitingPetitions").show();
                $("#panel_processedPetitions").show();
                $("#panel_processAPetition").hide();
                SAPMS.util.loadPage("faculty/processedPetitionList.jsp", "kfupmID:" + SAPMS.user.userID, "#panel_processedPetitions");
                SAPMS.util.loadPage("faculty/waitingPetitionList.jsp", "kfupmID:" + SAPMS.user.userID, "#panel_waitingPetitions");
            });
        </script>
    </center>
</div>

