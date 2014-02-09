<%-- 
    Document   : petitionList
    Created on : Jan 20, 2014, 6:03:48 PM
    Author     : adelahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String kfupmID = request.getParameter("kfupmID");
    String uiType = request.getParameter("uiType");
    String parentID = request.getParameter("parentID");
%>

<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <%
                if (uiType.equals("accordian"))
                {
            %> 
            <a data-toggle="collapse" data-parent="#<%=parentID%>" href="#collapseSubmittedPetitions<%=kfupmID%>">
                Submitted Petitions
            </a>
            <%        } else
            {
            %>
            Submitted Petitions
            <%
                }
            %>
        </h4>
    </div>
    <%
        if (uiType.equals("accordian"))
        {
    %>
    <div id="collapseSubmittedPetitions<%=kfupmID%>" class="panel-collapse collapse">
        <%

        } else
        {
        %>

        <%                }
        %>
    <div class="panel-body">
        <!-- <div class="well"> -->
        <div class="panel-group" id="accordionSubmittedPetitionsList">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordionSubmittedPetitionsList" href="#collapseOne">
                            Collapsible Group Item #1
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordionSubmittedPetitionsList" href="#collapseTwo">
                            Collapsible Group Item #2
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordionSubmittedPetitionsList" href="#collapseThree">
                            Collapsible Group Item #3
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                    </div>
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