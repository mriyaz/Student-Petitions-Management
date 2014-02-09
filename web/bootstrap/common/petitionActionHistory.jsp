<%@page import="sa.edu.kfupm.sapms.data.SAPMS_Util_V1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
	String petitionID = request.getParameter("petitionID");
%>
<div class="panel-group" id="accordionActionHistory">
	<div class="panel panel-warning">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordionActionHistory"
					href="#collapseActionHistory"> Action History of <%=petitionID%>
					</a>
			</h4>
		</div>
		<div id="collapseActionHistory" class="panel-collapse collapse">
			<div class="panel-body">
				<!-- ------- NEW ACCORDIAN ------------ -->
				<div class="panel-group" id="accordionActionList">
					<%
						for (int i = 0; i < SAPMS_Util_V1.getRandomInRange(3, 8); i++)
						{
							int actionID = SAPMS_Util_V1.getRandomInRange(245123, 965245);
							String actionTitle = SAPMS_Util_V1.getRandomCourseTitle();
					%>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
							
								<a data-toggle="collapse" data-parent="#accordionActionList"
									href="#collapseAction<%=actionID%>"><span class="badge">20-JUN-2013 to 23-JUN-2013</span> Action about <%=actionTitle%>
								</a>
								
							</h4>
						</div>
						<div id="collapseAction<%=actionID%>"
							class="panel-collapse collapse">
							<div class="panel-body">
								<div id="div_action_<%=actionID%>"></div>
								<script>
											SAPMS.util.loadPage('common/petitionAction.jsp', 'petitionID:123456,actionID:<%=actionID%>', 
													'#div_action_<%=actionID%>');
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
</div>