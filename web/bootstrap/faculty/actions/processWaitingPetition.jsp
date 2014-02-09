<%@page import="sa.edu.kfupm.sapms.data.SAPMS_Util_V1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
	String studentID = request.getParameter("studentID");
	String petitionID = request.getParameter("petitionID");
%>
<script>
	$("#panel_waitingPetitions").hide();
	$("#panel_processedPetitions").hide();
	$("#panel_processAPetition").show();
</script>
<div class="well">
	<div id="processWaitingPetition">
		<p>
			<button id="btn_abort" type="button" class="btn btn-default btn-lg">
				<span class="glyphicon glyphicon-arrow-left"></span> Abort and Go
				Back
			</button>
			<script>
				$("#btn_abort").click(function() {
					$("#panel_waitingPetitions").show();
					$("#panel_processedPetitions").show();
					$("#panel_processAPetition").hide();
				});
			</script>
		</p>
		<div id="processWaitingPetition_StudentInfo"></div>
		<script>
			$("#processWaitingPetition_StudentInfo").html(SAPMS.waitForLoading);
			SAPMS.util.loadPage("student/info.jsp",	"kfupmID:" + <%=studentID%>,"#processWaitingPetition_StudentInfo");
		</script>
		<div id="processWaitingPetition_StudentTranscript"></div>
		<script>
			$("#processWaitingPetition_StudentTranscript").html(SAPMS.waitForLoading);
			SAPMS.util.loadPage("student/transcript.jsp", "kfupmID:"+<%=studentID%>,"#processWaitingPetition_StudentTranscript");
		</script>
		<div id="processWaitingPetition_Petition">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">The Petition</h3>
				</div>
				<div class="panel-body">GET THE PETITION TEXT FROM THE
					PETITION ID</div>
			</div>
		</div>
		<div id="div_petitionActionHistory"></div>
		<script>
		SAPMS.util.loadPage("common/petitionActionHistory.jsp", "petitionID:XXXXXXXX", "#div_petitionActionHistory");
		</script>
		<p>&nbsp;</p>
		<div class="panel-group" id="accordionProcessPetition<%=studentID%>">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse"
							data-parent="#accordionProcessPetition<%=studentID%>"
							href="#collapseAskStudent"> Ask Student <%=studentID%>
						</a>
					</h4>
				</div>
				<div id="collapseAskStudent" class="panel-collapse collapse in">
					<div class="panel-body">
						<div id="div_askStudent"></div>
						<script>
							SAPMS.util.loadPage("faculty/askStudent.jsp", "studentID:200912340,petitionID:123456", "#div_askStudent");
								</script>
					</div>
				</div>
			</div>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse"
							data-parent="#accordionProcessPetition<%=studentID%>"
							href="#collapseSeekAdvice"> Seek Advice </a>
					</h4>
				</div>
				<div id="collapseSeekAdvice" class="panel-collapse collapse">
					<div class="panel-body">SEEK ADVICE PANEL</div>
				</div>
			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse"
							data-parent="#accordionProcessPetition<%=studentID%>"
							href="#collapseRecommendation"> Recommendation </a>
					</h4>
				</div>
				<div id="collapseRecommendation" class="panel-collapse collapse">
					<div class="panel-body">
						<div id="div_recommendation"></div>
						<script>
							SAPMS.util.loadPage("faculty/recommendation.jsp", "studentID:200912340,petitionID:123456", "#div_recommendation");
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
