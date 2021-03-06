<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	
	<script type="text/javascript">
	$(document)
			.ready(function() {
				//确定
					$("#btn_save").click(
							function() {
								var properties = new Array();
				properties.push(["writeDate","隐患排查时间"]);
//		properties.push(["hiddenContent","隐患名称"]);
//		properties.push(["hiddenGradetemp","隐患等级"]);
		properties.push(["writeUser","排查人"]);
		properties.push(["writeCorp","排查单位"]);
		properties.push(["dutyMan","第一责任人"]);
		properties.push(["limitDate","要求整改日期"]);
								
								saveValidateRequired("#btn_save", properties,
										"hcSolutionApproveForm");
							});
					//返回
					$("#btn_back")
							.click(
									function() {
										location.href = "${ctx}/hcSolutionApproveAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&pstartDate=${param.pstartDate}&pendDate=${param.pendDate}&jstartDate=${param.jstartDate}&jendDate=${param.jendDate}&qhiddenContent=${param.qhiddenContent}&qhiddenGrade=${param.qhiddenGrade}&ec_id=${param.id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									});

				});
				
				function initId(name,addr){
$("[name=fileName_1]").attr("id","fileName_1");
$("[name=fileAddr_1]").attr("id","fileAddr_1");



$("[name=fileName_2]").attr("id","fileName_2");
$("[name=fileAddr_2]").attr("id","fileAddr_2");



 $("[name="+name+"]").attr("id","fileName_");
  $("[name="+addr+"]").attr("id","fileAddr_");
}
function setParameter(name,addr){
  initId(name,addr);
  
    showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);
           
}
function showUploadDialogAndRefresh(URL,tWidth,tHeight){
	dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
}  
		
		function fileClear(){
			 $("#fileName_").val("");
			 $("#fileAddr_").val("");
		}
		
		function getTypes(){
		var url="hcHiddenTypeAction.do?method=selectList";
		art.dialog({id:'editMod',title:'隐患类别选择', iframe:url, width:'700', height:'450',top:'10'});
	}
	
	function init(){
	var fileCount = '${fileCount}';
	if(fileCount != "0"){
		var count = parseInt(fileCount);
		for(var i=1;i<=count;i++){
			 var obj=document.getElementById('tr'+i);
			 if(obj.style.display=='none'){
			   obj.style.display='block';
			 }
		}
	}
}
	
	
	
</script>
</head>
<content tag="heading">
	质安隐患信息审核
</content>
<body>

	<html:form enctype="multipart/form-data" action="hcSolutionApproveAction.do"
		method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="qsegmentId" />
		<html:hidden property="qstationId" />
		<html:hidden property="pstartDate" />
		<html:hidden property="pendDate" />
		<html:hidden property="jstartDate" />
		<html:hidden property="jendDate" />
		<html:hidden property="qhiddenContent" />
		<html:hidden property="qhiddenGrade" />

		<html:hidden property="id" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<html:hidden property="line_id" value="${hcSolution.line_id}" />
		<html:hidden property="segment_id" value="${hcSolution.segment_id}" />
		<html:hidden property="station_id" value="${hcSolution.station_id}" />
		<fieldset>
			<legend>
				质安隐患信息管理-编辑
			</legend>
			<table class="formTable">
				<COLGROUP>
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
				</COLGROUP>
				<tr>
					<th width='100%' colspan="2" align="center" style="font-weight:bold;font-size:13px">
						排查信息
					</th>
				</tr>

				<tr>
					<td>
						线路：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="line_id" name="line_id"
							class="form_input" size="30" value="${line_name}" />
					</td>
					<td>
						标段：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="segment_id"
							name="segment_id" class="form_input" value="${segment_name}" />
					</td>
				</tr>


				<tr>
					<td>
						车站区间：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="station_id"
							name="station_id" class="form_input" value="${station_name}" />
					</td>
				</tr>
				<tr>
					<td>
						隐患排查时间:
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" id="writeDate" name="writeDate"
							class="form_input"
							value="<fmt:formatDate pattern="yyyy-MM-dd" value="${hcSolution.writeDate}"/>"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
				</tr>
				<tr>
					<td>
						排查人:
						<span class="redSpan">*</span>
					</td>
					<td>
						<html:text property="writeUser" value="${hcSolution.writeUser}"
							size="25" styleClass="text" />
					</td>
					<td>
						排查单位:
						<span class="redSpan">*</span>
					</td>
					<td>
						<html:text property="writeCorp" value="${hcSolution.writeCorp}"
							size="25" styleClass="text" />
					</td>
				</tr>
				<tr>
					<td>
						隐患名称:
						<span class="redSpan">*</span>
					</td>
					<td colspan="3">
						<html:hidden property="hiddenGradetemp"
							value="${hcSolution.hiddenType.id}" />
						<html:textarea property="hiddenContent"
							value="${hcSolution.hiddenContent}" readonly="true"
							styleClass="text" cols="40" rows="3" />
						<input type="button" class="button1" onclick="getTypes();"
							value="隐患类别选择">
					</td>
				</tr>
				<tr>
					<td>
						第一责任人:
						<span class="redSpan">*</span>
					</td>
					<td>
						<html:text property="dutyMan" value="${hcSolution.dutyMan}"
							size="25" styleClass="text" />
					</td>
					<td>
						隐患等级:
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="hiddenGrade"
							value="${hcSolution.hiddenGrade}" type="HiddenType" />
					</td>
				</tr>
				<tr>
					<td>
						隐患部位:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						<html:text property="hiddenPart" value="${hcSolution.hiddenPart}"
							styleClass="text" size="50" />
					</td>
				</tr>
				<tr>
					<td>
						隐患描述:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						<html:textarea property="hiddenDescription"
							value="${hcSolution.hiddenDescription}" styleClass="text"
							cols="90" rows="3" />
					</td>
				</tr>
				<tr>
					<td>
						消除要求:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						<html:textarea property="disposeDemand"
							value="${hcSolution.disposeDemand}" styleClass="text" cols="90"
							rows="3" />
					</td>
				</tr>
				<tr>
					<td>
						整改截止日期:
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" id="limitDate" name="limitDate"
							class="form_input"
							value="<fmt:formatDate pattern="yyyy-MM-dd" value="${hcSolution.limitDate}"/>"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					<td>
						整改下发日期:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" id="issuedDate" name="issuedDate"
							class="form_input"
							value="<fmt:formatDate pattern="yyyy-MM-dd" value="${hcSolution.issuedDate}"/>"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
				</tr>
				<tr>
					<th width='100%' colspan="2" align="center" style="font-weight:bold;font-size:13px">
						治理信息
					</th>
				</tr>
				<tr>
					<td>
						隐患治理内容:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						<html:textarea property="governContent"
							value="${hcSolution.governContent}" styleClass="text" cols="90"
							rows="3" />
					</td>
				</tr>
				<tr>
					<td>
						整改日期:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" id="reformDate" name="reformDate"
							class="form_input"
							value="<fmt:formatDate pattern="yyyy-MM-dd" value="${hcSolution.reformDate}"/>"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					<td>
						审核日期:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" id="reviewDate" name="reviewDate"
							class="form_input"
							value="<fmt:formatDate pattern="yyyy-MM-dd" value="${hcSolution.reviewDate}"/>"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
				</tr>
				<tr>
					<td>
						审核结果:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<ex:dictSelect type="CheckResult" property="auditResult"
							value="${hcSolution.auditResult}" showSelect="false" />
					</td>
					<td>
						审核人:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<html:text property="auditPerson"
							value="${hcSolution.auditPerson}" styleClass="text" />
					</td>
				</tr>
				<tr>
					<td>
						审核意见:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						<html:textarea property="auditOpinion"
							value="${hcSolution.auditOpinion}" styleClass="text" cols="90"
							rows="3" />
					</td>
				</tr>
				<tr>
					<th width='100%' colspan="2" align="center" style="font-weight:bold;font-size:13px">
						附件信息
					</th>
				</tr>
				<tr>
					<td>
						整改前照片上传:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" name="fileName_1" class="inputText" size="30" />
						<input type="button" icon="icon_currWeek"
							onclick="setParameter('fileName_1','fileAddr_1');"
							style="width: 76px; height: 65px; cursor: pointer" value="单附件上传"
							alt="进入文件上传页面" />
						<input type="button" icon="icon_delete" onclick="fileClear(this)"
							style="width: 76px; height: 65px; cursor: pointer" value="清空" />
						<c:if test="${hcSolution.annexAddr!=null}">
							<a
								href="<%=request.getContextPath()%>/hcSolutionAction.do?method=download&id=${hcSolution.id }&index=1">${hcSolution.annexName}</a>
						</c:if>
					</td>
					<td style="display: none">
						文件地址：
						<span class="noRedSpan">*</span>
					</td>
					<td style="display: none">
						<input type="text" name="fileAddr_1" class="inputText"
							readonly="readonly" size="30" />
					</td>
				</tr>
				<tr>
					<td>
						整改后照片上传:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" name="fileName_2" class="inputText" size="30" />
						<input type="button" icon="icon_currWeek"
							onclick="setParameter('fileName_2','fileAddr_2');"
							style="width: 76px; height: 65px; cursor: pointer" value="单附件上传"
							alt="进入文件上传页面" />
						<input type="button" icon="icon_delete" onclick="fileClear(this)"
							style="width: 76px; height: 65px; cursor: pointer" value="清空" />
						<c:if test="${hcSolution.governPicAddr!=null}">
							<a
								href="<%=request.getContextPath()%>/hcSolutionAction.do?method=download&id=${hcSolution.id }&index=1">${hcSolution.governPic}</a>
						</c:if>
					</td>
					<td style="display: none">
						文件地址：
						<span class="noRedSpan">*</span>
					</td>
					<td style="display: none">
						<input type="text" name="fileAddr_2" class="inputText"
							readonly="readonly" size="30" />
					</td>

				</tr>


			</table>
		</fieldset>

		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save" />
			<input id="btn_back" value="${texts['button.back']}" type="button"
				icon="icon_back" />
		</div>
	</html:form>
</body>
</html:html>
