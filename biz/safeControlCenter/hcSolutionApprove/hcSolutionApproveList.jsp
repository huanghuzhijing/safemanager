<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
	<script type="text/javascript">
           var oper_id="";
		jQuery(document).ready(function(){
		
		//获取线路标段工点
		    getLines('${param.qlineId}','${param.qsectionId}');
		    getSections('${param.qlineId}','${param.qsectionId}');
		    getWokPoints('${param.qsectionId}','${param.qworkPointId}');
			
			//控制按钮	
			$("#btn_confirm").hide();
			$("#btn_back").hide();	
					
			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);	
			
			

			//确认
			$("#btn_confirm").click(function(){		  
				ret = window.confirm('是否确认提交');
				if(ret){
					var url='hcSolutionApproveAction.do?method=report&flag=0&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			}); 
			//撤回
			$("#btn_back").click(function(){		  
				ret = window.confirm('是否确认撤回');
				if(ret){
					var url='hcSolutionApproveAction.do?method=report&flag=1&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			}); 
				
			//编辑
			$("#btn_edit").click(function(){		  
				var url='hcSolutionApproveAction.do?method=edit&id='+oper_id+'&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&pstartDate=${param.pstartDate}&pendDate=${param.pendDate}&jstartDate=${param.jstartDate}&jendDate=${param.jendDate}&qhiddenContent=${param.qhiddenContent}&qhiddenGrade=${param.qhiddenGrade}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='hcSolutionApproveAction.do?method=delete&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});

			
			//详情
			$("#btn_view").click(function(){ 
			
				showView(oper_id);
			});
							
		});
		
		//详细页面
		function showView(id){
		   
	    	var url ='hcSolutionApproveAction.do?method=view&id='+id+'&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&pstartDate=${param.pstartDate}&pendDate=${param.pendDate}&jstartDate=${param.jstartDate}&jendDate=${param.jendDate}&qhiddenContent=${param.qhiddenContent}&qhiddenGrade=${param.qhiddenGrade}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
			commonUrl(url);
	  	}
		
		
		
		//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;
			var operObj = $("input[type=radio][name='select_id'][checked]");
			if(operObj.attr("state")==0||operObj.attr("state")==2){
			$("#btn_confirm").show();
			$("#btn_back").hide();	
						
			}else if(operObj.attr("state")==1){
			$("#btn_back").show();				
			$("#btn_confirm").hide();	
					
			}		
		}
		
		//指令码判断
		function checkCmd(){
			var cmdIds='${userinfo.usercmd}';
		}
		

		
</script>
</head>
<content tag="heading">
	质安隐患信息审核
</content>
<body>
	<table class="queryTable">

		<tr>
			<td class="queryTitle">
				<span>查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="hcSolutionApproveAction.do">
					<table align="left">
						<tr>
							<td align="right">
								线路：
							</td>
							<td>
								<select id="qlineId" name="qlineId"  
									onchange="getSections(this.value,'')">
<!--									<option  selected="selected">${lineId }</option>  -->
									</select>
							</td>
							<td align="right">
								标段：
							</td>
							<td>
								<select id="qsectionId" name="qsectionId"
									onchange="getWokPoints(this.value,'')">
<!--									<option  selected="selected">${segmentId }</option> -->
									</select>
							</td>

							<td align="right">
								车站/区间：
							</td>
							<td>
								<select id="qworkPointId" name="qworkPointId"></select>
							</td>
						</tr>
						<tr>
							<td align="right">
								排查日期：
							</td>
							<td>
								<input type="text" name="pstartDate" class="inputText"
									value="${pstartDate}" onfocus="WdatePicker()" />
								--
								<input type="text" name="pendDate" class="inputText"
									value="${pendDate}" onfocus="WdatePicker()" />
							</td>
						</tr>
						<tr>
							<td align="right">
								截止日期：
							</td>
							<td>
								<input type="text" name="jstartDate" class="inputText"
									value="${jstartDate}" onfocus="WdatePicker()" />
								--
								<input type="text" name="jendDate" class="inputText"
									value="${jendDate}" onfocus="WdatePicker()" />
							</td>
						</tr>
						<tr>
							<td align="right">
								隐患类别 ：
							</td>
							<td>
								<!--								<ex:dictSelect property="qhiddenContent" type="HiddenContent" />-->
								<html:select property="qhiddenContent" styleId="qhiddenContent"
									name="hcSolutionApproveForm">
									<html:option value="">
										<fmt:message key="dictSelect.select" />
									</html:option>
									<html:optionsCollection name="types" value="id"
										label="sortName" />
								</html:select>
							</td>
							<td>
								隐患等级 ：
							</td>
							<td>
								<ex:dictSelect property="qhiddenGrade" type="HiddenType" />
							</td>

							<td align="right">
								<input type="submit" value="查询" icon="icon_query" />
							</td>
						</tr>


					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<fieldset>
		<legend>
			信息列表
		</legend>

		<div class="listButtonDiv">
			<input id="btn_view" value="${texts['button.detail']}" type="button"
				icon="icon_view" />
			<input id="btn_edit" value="${texts['button.edit']}" type="button"
				icon="icon_edit" />
			<input id="btn_delete" value="${texts['button.delete']}"
				type="button" icon="icon_delete" />
			<input id="btn_confirm" type="button" icon="icon_confirm" value="确认" />
			<input id="btn_back" type="button" icon="icon_back" value="撤回" />
		</div>

		<ec:table items="hcSolutions" var="hcSolution"
			action="hcSolutionApproveAction.do?method=list" title="" width="100%"
			sortable="false" rowsDisplayed="10"
			imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			locale="zh_CN" retrieveRowsCallback="limit"
			filterRowsCallback="limit" sortRowsCallback="limit">
			<ec:row highlightRow="true"
				onclick="pullValue('${hcSolution.id}','');"
				ondblclick="showView('${hcSolution.id}');">
				<ec:column property="rowcount" cell="rowCount" sortable="false"
					title="序号" width="5%" />
				<ec:column property="null" sortable="false" title="选择" width="5%">
					<input name="select_id" value="${hcSolution.id}" type="radio"
						state="${hcSolution.affirmStatus}" />
				</ec:column>
				<ec:column property="hiddenContent" title="隐患名称" width="12%">
				${hcSolution.hiddenContent}
			</ec:column>
				<ec:column property="hiddenGrade" title="隐患等级" width="5%">
					<ex:dicDisplay dictIdentify="HiddenType"
						dictValue="${hcSolution.hiddenGrade}" />
				</ec:column>
				<ec:column property="dutyMan" title="第一责任人" width="5%">
				${hcSolution.dutyMan}
			</ec:column>
				<ec:column property="writeDate" title="排查日期" width="5%">
					<fmt:formatDate value="${hcSolution.writeDate}"
						pattern="yyyy-MM-dd" />
				</ec:column>
				<ec:column property="limitDate" title="截止日期" width="5%">
					<fmt:formatDate value="${hcSolution.limitDate}"
						pattern="yyyy-MM-dd" />
				</ec:column>
				<ec:column property="auditResult" title="审核结果" width="5%">
					<ex:dicDisplay dictIdentify="CheckResult"
						dictValue="${hcSolution.auditResult}" />
				</ec:column>
				<ec:column property="affirmStatus" title="确认状态" width="5%">
					<ex:dicDisplay dictIdentify="AffirmStatus"
						dictValue="${hcSolution.affirmStatus}" />
				</ec:column>


			</ec:row>
		</ec:table>
	</fieldset>
</body>

</html:html>