<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">危险源监控计划新版</content>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	var cmdIds='${userinfo.usercmd}';
	if(!isContains(cmdIds,",allDatas,")){
	$(".selectOrgan").hide()
	}
    getLines('${param.qlineId}','${param.qsegmentId}');
    getSections('${param.qlineId}','${param.qsegmentId}');
    selectYear();
    $("#plug_corpNames").val('${unit.f_name}');
})
	function newRisk(){
		location.href = 'riskPlanAction.do?method=edit';
	}
	function view(id){
	var url='riskPlanAction.do?method=view&queryFlag=t&planId='+id;
	commonUrl(url);
	}
	function del(p){
	 if(confirm('${texts['warning.delconfirm']}'))
	 {
	  location.href(p);
	 }
	}
	function selectOrgan(){
	var url='contentSelectAction.do?method=selectOrgans';
	art.dialog({id:'selectOrgan',title:'选择单位', iframe:url, width:'800', height:'450',top:'10'});
	}
	function selectYear(){
        var myDate= new Date(); 
	var startYear=myDate.getFullYear()-2;//起始年份 
	var endYear=myDate.getFullYear()+8;//结束年份 
	var obj=document.getElementById('planYear') 
	for (var i=startYear;i<=endYear;i++) 
	{ 
	obj.options.add(new Option(i,i)); 
	} 
	var yearNum='${param.qplanYear}'==''?'${year}':'${param.qplanYear}';
	$("#planYear").val(yearNum); 
    }
     function checkCmd(){
		
		
	}
</script>
</head>
<body>
  	<table class="queryTable" width="100%" cellpadding="0" cellspacing="4" border="0">
    	 <tr>
			<td class="queryTitle">
				<span>查询条件</span>
			</td>
		</tr>
		<tr>
			<td valign="top">
		  			<html:form action="riskPlanAction.do?method=queryList">
					  <html:hidden property="deptType" value="${deptType}"/>
						  <table align="left">
							  
							  <c:if test="${lineId==null}">
								<tr>
								<td>线路：</td>
							    <td >
								<select style="width: 240px" id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select>
								 </td>
							     <td>标段：</td>
							     <td >
							       <select id="qsectionId" name="qsegmentId" onchange="getWokPoints(this.value,'')"></select>
							    </td>
							     <td class="selectOrgan">编制单位：</td>
							     <td class="selectOrgan">
							     <input id="plug_corpNames" name="qunitName" type="text" size="40"/>
							     <input id="plug_corpIds" type="hidden" name="qunitId" value="${param.qunitId }"/>
							       <input type="button" class="selectOrgan" value="选择编制单位" onclick="selectOrgan()"/>
							    </td>
								</tr>
								 </c:if>
							  
							    
					 	
					 	<tr>
					 	<td>计划监控名称：</td>
							    <td >
							    <input name="qplanName" value="${param.qplanName }" type="text">
							    </td>
						<td>计划年份：</td>
							    <td >
							    <select id="planYear"  name="qplanYear" >
					             <option value="">--请选择年份--</option>
					            </select>
							    </td>
					    <td>计划周次：</td>
					    <td >
					    <input name="qplanWeek" value="${param.qplanWeek }" type="text">
					    </td>	    
					 	<td>
					 	<input type="submit" value="${texts['button.query']}" class="button1" />
							
					 	</td>
					 	</tr>
						  </table>
					  </html:form>
					  </td>
					  </tr>
					  </table>
<fieldset>
	<legend><fmt:message key="dtaq.common.list_field"/></legend>
<table class="commonTable" width="100%" border="0" cellspacing="0" cellpadding="0">
   	<tr>
   	<c:if test="${lineId!=null}">
   	<td width="90%" align="center">
										<font color="#50A2E6" size="2"><strong>线路：${lineId.line_name}&nbsp;&nbsp;&nbsp;&nbsp;标段：${segmentId.segment_name}</strong></font>
									</td>
   	</c:if>
   		
	</tr>
</table>
</fieldset>
<ec:table items="riskPlans" var="riskPlan"  action="riskPlanAction.do"
						title="" width="100%"  sortable="false" rowsDisplayed="10"
						imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
					  	<ec:row highlightRow="true" onclick="pullValue('${riskPlan.planId}');" ondblclick="showView('${riskPlan.planId}');">
								<ec:column property="rowcount" cell="rowCount" sortable="false"
								title="序号" width="5%" />
								<ec:column property="planName" title="计划监控名称" width="200px"/>
		<ec:column property="planYear" title="计划年份" width="80px"/>
		<ec:column property="planWeek" title="计划周次" width="80px"/>
		<ec:column property="annexaddress" title="附  件" width="250px">
			<c:if test="${riskPlan.annexaddress ne null}">
		      	<a href="riskPlanAction.do?method=download&riskplan_id=${risk.planId}">[${riskPlan.annexname}]</a>
		      </c:if>
		</ec:column>
		<ec:column property="unitId.f_name" title="计划编制单位" width="150px">
			
		</ec:column>
	 	<ec:column property="null" title="${texts['label.operate']}" width="180px" sortable="false">
	 		<div align="center">
				<input type="button" class="button1" onclick="view('${riskPlan.planId}')" value="<fmt:message key="label.detail"/>"/>
				
<%--				<c:if test="${fn:contains(userinfo.usercmd,'riskPlan_weave')==true}">--%>
<%--					<input type="button" class="button1" onclick="location.href='safedocRiskItemAction.do?method=list&planId=${risk.planId}'" value="<fmt:message key="button.weave"/>"/>--%>
<%--				</c:if>--%>
			</div>
		</ec:column>

</ec:row>
</ec:table>
</body>
</html:html>