<%-- 
    Document   : askStudent
    Created on : Jan 21, 2014, 12:12:39 AM
    Author     : adelahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String studentID = request.getParameter("studentID");
    String petitionID = request.getParameter("petitionID");
    String studentName = "THE NAME OF " + studentID;
%>

<script>
    $("#panel_questionMessageArea").hide();
</script>

<p>Ask <%=studentName%> a question about the petition.</p>
<textarea id="textarea_question" class="form-control" placeholder="Enter your question here..."></textarea>
<center>
    <div class="btn-group">
        <button id="btn_questionSubmit" type="button" class="btn btn-default">Submit</button>
        <script>
            $("#panel_studentNewPetitionSubmitMessageArea").hide();

            $("#btn_questionSubmit").click(function() {
                if ($("#textarea_CreateNewPetition").val() !== "")
                {
                    $("#panel_questionMessageArea").html(SAPMS.waitForLoading);
                    SAPMS.util.loadPage("faculty/actions/askStudentSubmit.jsp",
                            "kfupmID:" + SAPMS.user.userID + ",petitionText:" + $("#textarea_question"),
                            "#panel_questionMessageArea");
                    $("#panel_questionMessageArea").show();
                }
            });
        </script>
        <button id="btn_questionClear" type="button" class="btn btn-default">Reset</button>
        <script>
            $("#btn_questionClear").click(function() {
                $("#textarea_question").val("");
            });
        </script>
    </div>
</center>
<div id="panel_questionMessageArea" class="alert alert-success">
</div>
