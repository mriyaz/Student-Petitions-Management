<%-- 
    Document   : submitNewPetition
    Created on : Jan 20, 2014, 10:43:35 PM
    Author     : adelahmed
--%>

<%@page import="sa.edu.kfupm.sapms.data.SAPMS_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    window.SAPMS = window.SAPMS || {};
</script>
<%
    String kfupmID = request.getParameter("kfupmID");
    String petitionText = request.getParameter("petitionText");
    SAPMS_Model.createPetition(kfupmID, petitionText);
%>

<p>Your petition has been submitted successfully. An email has been sent to your KFUPM email address with the details of this submission</p>
<center>
    <button id="btn_closeSubmitNewPetitionMessageArea" type="button" class="btn btn-default">Done</button>
    <script>
        $("#btn_CreateNewPetitionSubmit").addClass("disabled");
        $("#btn_closeSubmitNewPetitionMessageArea").click(function() {
            $("#btn_CreateNewPetitionSubmit").removeClass("disabled");
            SAPMS.util.loadPage("student/createNewPetition.jsp", "kfupmID:" + SAPMS.user.kfupmID + ",uiType:accordian,parentID:accordianStudent", "#panel_createNewPetition");
            SAPMS.util.loadPage("student/petitionList.jsp", "kfupmID:" + SAPMS.user.accountID + ",uiType:accordian,parentID:accordianStudent", "#panel_submittedPetitionList");
        });
    </script>
</center>