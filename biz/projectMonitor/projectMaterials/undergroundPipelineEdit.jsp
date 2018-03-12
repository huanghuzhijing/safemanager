<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<title></title>

<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<style type="text/css">
.button2 {
	border-right: #3333ff 1px solid;
	border-top: #3333ff 1px solid;
	font-size: 9pt;
	border-left: #3333ff 1px solid;
	color: #3333ff;
	border-bottom: mediumpurple 1px solid;
	font-family: "verdana", "arial", "����";
	background-color: transparent;
	event: expression(onmouseover =   function() { 
 this . style . background = '#D1D8DD', this . style . color = '#1679AA'
}

</style>
<script language="javascript">
//var rule = "gif,jpg,jpeg,png,bmp";
var rule = "jpg";
function onchangeFile(fileObject){
	var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3}$/ig;
	var suffixError = "";
	var value = fileObject.value;
	if(filePath.test(value)==false){
		suffixError = "该文件未找到，请检查导入文件所在文件夹\n";
	}else{
		var ruleStr = ","+rule+",";
		var suffix = value.substring(value.lastIndexOf(".") + 1).toLowerCase();
		if(ruleStr.indexOf(","+suffix+",") <= -1){
			suffixError = "文件格式不合法,正确的文件格式为:" + rule;
		}
	}
	if(suffixError !=""){
		alert(suffixError);
		fileObject.outerHTML=fileObject.outerHTML.replace(/value=\w/g,'');
		return false;
	}
}
function initId(name,addr){
$("[name=fileName_1]").attr("id","fileName_1");
$("[name=fileAddr_1]").attr("id","fileAddr_1");



$("[name=fileName_2]").attr("id","fileName_2");
$("[name=fileAddr_2]").attr("id","fileAddr_2");

$("[name=fileName_3]").attr("id","fileName_3");
$("[name=fileAddr_3]").attr("id","fileAddr_3");

$("[name=fileName_4]").attr("id","fileName_4");
$("[name=fileAddr_4]").attr("id","fileAddr_4");


 $("[name="+name+"]").attr("id","fileName_");
  $("[name="+addr+"]").attr("id","fileAddr_");
}
function setParameter(name,addr){
  initId(name,addr);
  
    showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);
    
   
}
function showUploadDialogAndRefresh(URL,tWidth,tHeight)
{
	dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	//window.open(URL,"",dlgFeatures);
	//window.location.reload();
	//window.open (URL, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
}   

function validateData(object){
	var value = object.value;
	if(isNaN(value)){
		alert("该值必须为数字类型");
		object.value = "";
		object.focus();
	}
}

function init(){
	var fileCount = '${fileCount}';
	if(fileCount != "0"){
		var count = parseInt(fileCount) ;
		for(var i=1;i<=count;i++){
			var obj = jQuery("#tr"+i);
			if(obj.is(":hidden")){
				obj.show() ;
			}
		}
	}
}

jQuery(document).ready(function(){
	init() ;
	$("#btn_back").click(function(){
       		document.forms[0].action='projectMaterialsAction.do?method=list&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&ec_id=${projectMaterials.materials_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}';   
	    	document.forms[0].submit(); 
       });
       $("#btn_insert").click(function (){
    var tableObj = document.getElementById("tableObj");
    var currentRow = tableObj.insertRow();
    currentRow.align = "center";
   
    var rowsCount = tableObj.rows.length-1;
    currentRow.insertCell().innerHTML = rowsCount;
   currentRow.insertCell().innerHTML = '<input type="text" name="type" class="text" size="3"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="name" class="text" size="3"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="bury_times" class="text" size="3"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="lay_method" class="text" size="3"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="basic_layer_situations" class="text" size="3"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="material" class="text" size="3"/>';
    
   currentRow.insertCell().innerHTML = '<input type="text" name="connect_type" class="text" size="3"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="cross_section_form" class="text" size="3"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="cross_section_diameter" class="text" size="3" maxlength="18" onchange="validateData(this)"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="wall_thickness" class="text" size="3" maxlength="18" onchange="validateData(this)"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="pipeline_buried_deep" class="text" size="3" maxlength="18" onchange="validateData(this)"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="min_horizontal_distance" class="text" size="3" maxlength="18" onchange="validateData(this)"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="pipeline_structural_relation" class="text" size="3"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="pressure_size" class="text" size="3"  maxlength="18" onchange="validateData(this)"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="stratum_type" class="text" size="3"/>';
   currentRow.insertCell().innerHTML = '<input type="text" name="handle_way" class="text" size="3"/>';
   currentRow.insertCell().innerHTML = '<input type="hidden" name="pipeline_id"/><input type="button" id="delete" class="button2" onclick="removeMySiteRow(this,this)" value="删 除" />';
 })
})

function add(){
	var object4 = jQuery("#tr4") ;
	if(!object4.is(":hidden")){
		alert("上传附件个数最多不允许超过4个!");
	}else{
		for(var i=1 ;i<5;i++){
			var obj = jQuery("#tr"+i);
			if(obj.is(":hidden")){
				obj.css("display","block") ;
				break ;
			}
		}
	}
}


 

function removeMySiteRow(pipeline_id,ob){
    var tableId = document.getElementById("tableObj");
	if(window.confirm("确定删除？")){
		if(pipeline_id != null && pipeline_id != ""){
		$.ajax({
					type: "POST",
					url : "${ctx}/undergroundPipelineAction.do?method=deleteInfo",
					data: "pipeline_id="+pipeline_id,
					success: function(msg){
						responsedeleteInfo(msg);
					}
				});
			}
		($(ob).parent().parent()).remove();
	}
}

function responsedeleteInfo(selResponse){
	var text = selResponse;
	if(text == "no"){
		alert("删除失败！");
	}
}
function setMySiteNos(obj){
	if(null != obj){
	   var rowsLength = obj.rows.length;
	   if(rowsLength > 0){
	       for(var i = 1;i < rowsLength;i++){
		      obj.rows(i).cells(0).innerText = i;
	       }
		}
	}
}

function findSiteTD(o){
	if (o.nodeName=="TR"||o.nodeName=="TABLE") return;
	if(o.nodeName=="TD")
	   return (o);
	else
	   return (o.parentElement);
}

function deleteFile(){
	for(var m=4; m>=1; m--){
		var obj=document.getElementById('tr'+m);
		var obj = jQuery("#tr"+m) ;
		if(!obj.is(":hidden")){
			if(m == 1){
				var displayFile1 = jQuery("#displayFile1") ;
				if(displayFile1.length > 0 ){
					displayFile1.hide();
				}
			}else{
				obj.hide() ;
			}
			var fileObj = document.getElementById('file'+m);
			var fileObj = jQuery("#file"+m) ;
			fileObj.val("") ;
			jQuery("[name='fileName_"+m+"']").val("") ;
			jQuery("[name='fileAddr_"+m+"']").val("") ;
			break;
		}
	}
}
</script>
</head>
<body>
<fieldset>
	<legend><strong>备注</strong></legend>
	<table width="98%" border="0" cellpadding="2" cellspacing="4">
		<tr>
			<td width="110px" class="label"><font color="#50A2E6" size="2"><strong>必填项说明：</strong></font></td>
			<td><font color="#9EC3DA" size="2"><strong>报表标题为蓝色背景的列为必填项，如果用户未输入该项数值，则保存时该行将被过滤掉！</strong></font></td>
		</tr>
		<tr>
			<td width="110px" class="label"><font color="#50A2E6" size="2"><strong>数据导入说明：</strong></font></td>
			<td><font color="#9EC3DA" size="2"><strong>如果报表信息是最近一次的填报的历史记录时，导入数据后，历史记录信息将被替换掉；
<br>如果报表信息为已有的填报数据时，导入数据后，将在已有的数据后面进行累加！</strong></font></td>
		</tr>
	</table>
</fieldset>
<fieldset>
	<legend><strong>周边地下管线信息</strong></legend>
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td align="center" width="60%">
				<font color="#50A2E6" size="2"><strong>
				工程资料类型：<ex:dicDisplay dictIdentify="MaterialsType" dictValue="${projectMaterials.materials_type}" /></strong></font>
				</td>
			<td align="right" width="40%">
				<input type="button" class="button1" id="btn_insert" icon="icon_add" value="新增行" />
				<input type="button" class="button1" value="导出填报模板" icon="icon_edit" onclick="location.href='${ctx}/undergroundPipelineAction.do?method=modelDownLoad'" >
				<input type="button" class="button1" value="数据导入" icon="icon_add" onclick="location.href='${ctx}/undergroundPipelineAction.do?method=showExcelImport&flagPage=${flagPage }&importType=undergroundPipeline&materials_id=${projectMaterials.materials_id}&materials_type=${projectMaterials.materials_type}&lineId=${lineId}&segmentId=${segmentId}&station_id=${projectMaterials.station_id}&station_state=${station_state}&station_type=${station_type}&startDate=${startDate}&endDate=${endDate}'">&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<html:form action="undergroundPipelineAction.do" method="POST" enctype="multipart/form-data" styleClass="form">
			    <input type="hidden" name="method" value="save"/> 
				  <html:hidden property="materials_id" value="${projectMaterials.materials_id}"/>
				  <html:hidden property="materials_type" value="${projectMaterials.materials_type}"/>
				  <html:hidden property="station_id" value="${projectMaterials.station_id}"/>
				   <html:hidden property="flagPage" value="${flagPage}"/>  
				 
				  
			      <html:hidden property="lineId" value="${lineId}"/>
			      <html:hidden property="segmentId" value="${segmentId}"/>
				  <html:hidden property="stationId" value="${stationId}"/>
				  <html:hidden property="station_state" value="${station_state}"/>
				  <html:hidden property="station_type" value="${station_type}"/>
				  <html:hidden property="startDate" value="${startDate}"/>
				  <html:hidden property="endDate" value="${endDate}"/>
			    <table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead align="center">
						<tr>
							<th width='5%'>序号</th>
							<th width='5%'>类型</th>
							<th width='5%' bgcolor="#50A2E6">名称</th>
							<th width='5%'>埋设年代</th>
							<th width='5%'>铺设方法</th>
							<th width='5%'>基础垫层情况</th>
							<th width='5%'>材质</th>
							<th width='5%'>接头类型</th>
							<th width='5%'>横断面形状</th>
							<th width='5%'>横断面直径mm</th>
							<th width='5%'>壁管厚度mm</th>
							<th width='5%'>管线埋深</th>
							<th width='5%'>最短水平距离</th>
							<th width='5%'>管线与结构位置关系</th>
							<th width='5%'>压力大小</th>
							<th width='5%'>所处地层类型</th>
							<th width='5%'>处理方式</th>
							<th width='5%'>操作</th>
						</tr>
					</thead>
					<c:set value="0" var="index"></c:set>
					<c:forEach items="${undergroundPipelines}" var="undergroundPipeline">
						<c:set value="${index+1}" var="index"></c:set>
						<tr align="center">
							<td>${index}</td>
							<td><html:text property="type" value="${undergroundPipeline.type}" styleClass="text" size="3"/></td>
							<td><html:text property="name" value="${undergroundPipeline.name}" styleClass="text" size="3" /></td>
							<td><html:text property="bury_times" value="${undergroundPipeline.bury_times}" styleClass="text" size="3" /></td>
							<td><html:text property="lay_method" value="${undergroundPipeline.lay_method}" styleClass="text" size="3" /></td>
							<td><html:text property="basic_layer_situations" value="${undergroundPipeline.basic_layer_situations}" styleClass="text" size="3" /></td>
							<td><html:text property="material" value="${undergroundPipeline.material}" styleClass="text" size="3" /></td>
							<td><html:text property="connect_type" value="${undergroundPipeline.connect_type}" styleClass="text" size="3" /></td>
							<td><html:text property="cross_section_form" value="${undergroundPipeline.cross_section_form}" styleClass="text" size="3" /></td>
							<td><html:text property="cross_section_diameter" value="${undergroundPipeline.cross_section_diameter}" styleClass="text" size="3"  maxlength="18" onchange="validateData(this)"/></td>
							<td><html:text property="wall_thickness" value="${undergroundPipeline.wall_thickness}" styleClass="text" size="3"  maxlength="18" onchange="validateData(this)"/></td>
							<td><html:text property="pipeline_buried_deep" value="${undergroundPipeline.pipeline_buried_deep}" styleClass="text" size="3"  maxlength="18" onchange="validateData(this)"/></td>
							<td><html:text property="min_horizontal_distance" value="${undergroundPipeline.min_horizontal_distance}" styleClass="text" size="3"  maxlength="18" onchange="validateData(this)"/></td>
							<td><html:text property="pipeline_structural_relation" value="${undergroundPipeline.pipeline_structural_relation}" styleClass="text" size="3" /></td>
							<td><html:text property="pressure_size" value="${undergroundPipeline.pressure_size}" styleClass="text" size="3"  maxlength="18" onchange="validateData(this)"/></td>
							<td><html:text property="stratum_type" value="${undergroundPipeline.stratum_type}" styleClass="text" size="3" /></td>
							<td><html:text property="handle_way" value="${undergroundPipeline.handle_way}" styleClass="text" size="3" /></td>
							<td>
								<html:hidden property="pipeline_id" value="${undergroundPipeline.pipeline_id}"/>
								
								<button class="button2" value="${texts['button.delete']}" onclick="removeMySiteRow('${undergroundPipeline.pipeline_id}',this)"/>${texts['button.delete']}</td>
						</tr>
					</c:forEach>
				</table>
				<table class="def_table" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead align="center">
						<tr>
							<th width='100%' colspan="2" align="left">图片信息</th>
						</tr>
					</thead>
					 <tr id=tr1 style="display:block">
				      	<td>图片附件1</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_1" value="${projectMaterials.underLine_attach_name1 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_1','fileAddr_1');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		<html:button property="addFileBtn" styleClass="button1" value="添加附件" onclick="add()" />
				      		<input type="button" class="button1" id="delBtn" icon="icon_delete" value="删除附件" onclick="deleteFile()">
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectMaterials.underLine_attach_address1!=null}">
								<a href="<%=request.getContextPath()%>/undergroundPipelineAction.do?method=download&materials_id=${projectMaterials.materials_id }&index=1">${projectMaterials.underLine_attach_name1}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_1" value="${projectMaterials.underLine_attach_address1 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
					 <tr id=tr2 style="display:none">
				      	<td>图片附件2</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_2" value="${projectMaterials.underLine_attach_name2 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_2','fileAddr_2');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectMaterials.underLine_attach_address2!=null}">
								<a href="<%=request.getContextPath()%>/undergroundPipelineAction.do?method=download&materials_id=${projectMaterials.materials_id }&index=2">${projectMaterials.underLine_attach_name2}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_2" value="${projectMaterials.underLine_attach_address2 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				     <tr id=tr3 style="display:none">
					 <td>图片附件3</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_3" value="${projectMaterials.underLine_attach_name3 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_3','fileAddr_3');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectMaterials.underLine_attach_address3!=null}">
								<a href="<%=request.getContextPath()%>/undergroundPipelineAction.do?method=download&materials_id=${projectMaterials.materials_id }&index=3">${projectMaterials.underLine_attach_name3}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_3" value="${projectMaterials.underLine_attach_address3 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				     <tr id=tr4 style="display:none">
					 <td>图片附件4</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_4" value="${projectMaterials.underLine_attach_name4 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_4','fileAddr_4');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectMaterials.underLine_attach_address4!=null}">
								<a href="<%=request.getContextPath()%>/undergroundPipelineAction.do?method=download&materials_id=${projectMaterials.materials_id }&index=4">${projectMaterials.underLine_attach_name4}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_4" value="${projectMaterials.underLine_attach_address4 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				</table>
			    <div align="center">
					<input type="submit" class="saveButton" icon="icon_save" value="${texts['button.save']}"/>&nbsp;&nbsp;
					<input type="button" value="${texts['button.back']}" icon="icon_back" class="backButton" id="btn_back">
			    </div>
			</html:form>
			
</fieldset>
</body>
</html>