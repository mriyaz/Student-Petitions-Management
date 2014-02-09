<%-- 
    Document   : createNewPetition
    Created on : Jan 20, 2014, 6:04:24 PM
    Author     : adelahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String kfupmID = request.getParameter("kfupmID");
    String uiType = request.getParameter("uiType");
    String parentID = request.getParameter("parentID");
%>

<div class="panel panel-default">
    <script>
        window.SAPMS = window.SAPMS || {};
    </script>
    <div class="panel-heading">
        <h4 class="panel-title">
            <%
                if (uiType.equals("accordian"))
                {
            %> 
            <a data-toggle="collapse" data-parent="#<%=parentID%>" href="#collapseCreateNewPetition<%=kfupmID%>">
                Create New Petition
            </a>
            <%        } else
            {
            %>
            Create New Petition
            <%                }
            %>
        </h4>
    </div>
    <%
        if (uiType.equals("accordian"))
        {
    %>
    <div id="collapseCreateNewPetition<%=kfupmID%>" class="panel-collapse collapse">
        <%

        } else
        {
        %>

        <%                }
        %>
        <div class="panel-body">
            <div class="well">
                <p>Please write what you would like to petition for. Please give as much details as possible.</p>
                <span class="label label-primary">I want to:</span><br/>
                <textarea id="textarea_CreateNewPetition" class="form-control" placeholder="Enter your petition text here..."></textarea>
                <center>
                    <div class="btn-group">
                        <button id="btn_CreateNewPetitionSubmit" type="button" class="btn btn-default">Submit</button>
                        <script>
                            $("#panel_studentNewPetitionSubmitMessageArea").hide();

                            $("#btn_CreateNewPetitionSubmit").click(function() {
                                if ($("#textarea_CreateNewPetition").val() !== "")
                                {
                                    $("#panel_studentNewPetitionSubmitMessageArea").html(SAPMS.waitForLoading);
                                    SAPMS.util.loadPage("student/actions/submitNewPetition.jsp",
                                            "kfupmID:" + SAPMS.user.kfupmID + ",petitionText:" + $("#textarea_CreateNewPetition").val(),
                                            "#panel_studentNewPetitionSubmitMessageArea");
                                    $("#panel_studentNewPetitionSubmitMessageArea").show();
                                }
                            });
                        </script>
                        <button id="btn_CreateNewPetitionClear" type="button" class="btn btn-default">Reset</button>
                        <script>
                            $("#btn_CreateNewPetitionClear").click(function() {
                                $("#textarea_CreateNewPetition").val("");
                            });
                        </script>
                    </div>
                </center>
                <div id="panel_studentNewPetitionSubmitMessageArea" class="alert alert-success">
                </div>
            </div>
        </div>
    <%
            if (uiType.equals("accordian"))
            {
        %>
    </div>
    <%            }
    %>
</div>