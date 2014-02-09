<%-- 
    Document   : student
    Created on : Jan 20, 2014, 6:03:16 PM
    Author     : adelahmed
--%>
<%

    String accountID = request.getParameter("accountID");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel-group" id="accordionStudent">
    <script>
        window.SAPMS = window.SAPMS || {};
        $("#div_login").hide();
        $("#div_nav").show();
        $("#div_student").show();
        $("#div_faculty").hide();
    </script>
    <div id="panel_studentInfo">

    </div>
    <script>
        SAPMS.util.loadPage("student/info.jsp",
                "accountID:" + SAPMS.user.accountID + ",uiType:accordian,parentID:accordianStudent",
                "#panel_studentInfo");
    </script>
    <!-- Student Transcript -->
    <div id="panel_studentTranscript">
    </div>
    <script>
        SAPMS.util.loadPage("student/transcript.jsp",
                "accountID:" + SAPMS.user.accountID + ",uiType:accordian,parentID:accordianStudent",
                "#panel_studentTranscript");
    </script>
    <!-- Submit New Petition -->
    <div id="panel_createNewPetition">
    </div>
    <script>
        SAPMS.util.loadPage("student/createNewPetition.jsp", "kfupmID:" + SAPMS.user.accountID + ",uiType:accordian,parentID:accordianStudent", "#panel_createNewPetition");
    </script>
    <!-- Submitted Petitions -->
    <div id="panel_submittedPetitionList" class="panel panel-default">
    </div>
    <script>
        SAPMS.util.loadPage("student/petitionList.jsp", "kfupmID:" + SAPMS.user.accountID + ",uiType:accordian,parentID:accordianStudent", "#panel_submittedPetitionList");
    </script>
</div>
