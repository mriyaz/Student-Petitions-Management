<%-- 
    Document   : recommendation
    Created on : Jan 21, 2014, 12:45:20 AM
    Author     : adelahmed
--%>
<%
    String studentID = request.getParameter("studentID");
    String petitionID = request.getParameter("petitionID");
    String studentName = "THE NAME OF " + studentID;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<center>
    <select id='select_recommendation' class="form-control">
        <option>--SELECT RECOMMENDATION--</option>
        <option>Recommended</option>
        <option>Not Recommended</option>
    </select>
</center>
<br/>
<p>Please write your justification for your decision</p>
<textarea id="textarea_justification" class="form-control" placeholder="Enter your justification here..."></textarea>
<center>
    <div class="btn-group">
        <button id="btn_recommendationSubmit" type="button" class="btn btn-default">Submit</button>
        <script>
            $("#btn_recommendationSubmit").click(function() {
                if ($("#select_recommendation").val() !== "--SELECT RECOMMENDATION--"){
                 SAPMS.util.loadPage("faculty/actions/recommendationSubmit.jsp",
                 "kfupmID:" + SAPMS.user.userID + ",studentID:201098760,petitionID:123456,recommendation:" + $("#select_recommendation").val() + 
                         ",justification:" + $("#textarea_justification").val(),
                 "#panel_recommendationMessageArea");
                 $("#panel_recommendationMessageArea").show();
                }
            });
        </script>
        <button id="btn_recommendationClear" type="button" class="btn btn-default">Reset</button>
        <script>
            $("#btn_recommendationClear").click(function() {
                $("#textarea_justification").val("");
            });
        </script>
    </div>
</center>
<div id="panel_recommendationMessageArea"></div>
<script>
    $("#panel_questionMessageArea").hide();
</script>

