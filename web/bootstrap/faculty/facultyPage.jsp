<%-- 
    Document   : facultyPage
    Created on : Jan 20, 2014, 4:26:53 AM
    Author     : adelahmed
--%>

<script>
    window.SAPMS = window.SAPMS || {};

    $("#div_login").hide();
    $("#div_faculty").show();
    $("#div_nav").show();
    $("#div_student").hide();
</script>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="panel_processAPetition">
</div>
<div class="panel-group" id="accordionFaculty">
    <div id="panel_waitingPetitions">
    </div>
    <script>
        SAPMS.util.loadPage("faculty/waitingPetitionList.jsp", "accountID:" + SAPMS.user.accountID, "#panel_waitingPetitions");
    </script>
    <div id="panel_processedPetitions">
    </div>
    <script>
        SAPMS.util.loadPage("faculty/processedPetitionList.jsp", "accountID:" + SAPMS.user.accountID, "#panel_processedPetitions");
    </script>
</div>