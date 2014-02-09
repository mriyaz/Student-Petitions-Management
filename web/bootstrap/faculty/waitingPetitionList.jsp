<%-- 
    Document   : waitingPetitionList
    Created on : Jan 20, 2014, 11:35:55 PM
    Author     : adelahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String facultyID = request.getParameter("facultyID");

    String[] studentIDList =
    {
        "200912340", "201065240", "201298530"
    };
    String[] studentNames =
    {
        "Saleh Al-Ghamdi", "Ahmed Al-Muhammadi", "Ali Alsaggaf"
    };
%>
<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordionFaculty" href="#collapseWaitingPetitions">
                Waiting Petition List
            </a>
        </h4>
    </div>
    <div id="collapseWaitingPetitions" class="panel-collapse collapse in">
        <div class="panel-body">
            <!-- <div class="well"> -->

            <div class="panel-group" id="accordionWaitingPetitionsList">
                <%
                    for (int i = 0; i < studentIDList.length; i++)
                    {
                %>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordionWaitingPetitionsList" href="#collapse<%=studentIDList[i]%>">
                                <%= studentIDList[i]%> <%= studentNames[i]%>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse<%=studentIDList[i]%>" class="panel-collapse collapse">
                        <div class="panel-body">
                            <p><%= "I want to: I am a graduating student. I want to register ICS 411 or else I will not graduate"%></p>
                            <button id="btn_processPetition<%=studentIDList[i]%>" type="button" class="btn btn-default">Process</button>
                            <script>
                                $("#btn_processPetition<%=studentIDList[i]%>").click(function() {
                                    SAPMS.util.loadPage("faculty/actions/processWaitingPetition.jsp", "studentID:<%=studentIDList[i]%>", "#panel_processAPetition");
                                });
                            </script>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>