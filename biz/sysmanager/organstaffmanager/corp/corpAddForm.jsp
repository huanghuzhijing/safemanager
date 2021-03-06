﻿<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
    //加载
    $(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		history.back(-1);
       });
       	//验证自动编码重复性
		$("#codeBlur").blur(function(){ 
			 checkBlurRuleCode('${ctx}');	
		}); 
		//
		$("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["corpcode","参建单位编号"];
			properties[1]=["corpname","参建单位名称"];
			properties[2]=["orderno","排序"];
			properties[3]=["organcode","组织机构代码"];
			saveValidateRequired("#btn_save",properties,"corpForm");
		}); 
		//
	 });
    //
    function checkOrganCode(obj){
    	var orgcode = obj.value;
    	$.ajax({
			   type: "POST",
			   url: "${ctx}/corpAction.do?method=checkOrganCode",
			   data: "orgcode="+orgcode,
			   success: function(msg){
			   		msg = msg.split(",");
					if(msg[0]=="no"){
						alert("该组织机构代码已被其它单位所用，请核实后再填报!");
						obj.value='';
						obj.focus();
						return;
					}
					else{
						return;
					}
			   }
			});
    }
</script>
</head>
	<content tag="heading">参建单位-新增</content>
<body>
	<html:form action="corpAction.do"  method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id"/>
		<html:hidden property="static_corptype" value="${static_corptype}"/>
		<fieldset >
		<legend>[基本信息]</legend>
			<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								参建单位编号：<span class="redSpan">*</span>
							</td>

							<td>
							<input id="codeBlur" onkeypress="return regInput0(this,String.fromCharCode(event.keyCode))" tableName="SYS_CORP" fieldValue="CORPCODE" name="corpcode" class="inputText" size="30" value="<ex:codeRlueDisPlay  tableName="SYS_CORP" fieldValue="corpcode" ruleCode="corpNo"  />" />
							</td>
							<td>
								参建单位名称：<span class="redSpan">*</span>
							</td>
							<td>
								<html:text maxlength="200" property="corpname" styleClass="inputText" size="65"/>
							</td>
						</tr>
						<tr>
						    <td>
								排序：<span class="redSpan">*</span>
							</td>
							<td>
								<ex:numberInput property="orderno" styleClass="inputText" maxlength="14" size="28"/>
							</td>
							<td>
								 单位类型：<span class="redSpan">*</span>
							</td>
							<td>
								${ctname}&nbsp;
							</td>
						</tr>	
						<tr>
							<td>
								组织机构代码：<span class="redSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="organcode" styleClass="inputText" size="30" onblur="checkOrganCode(this);"/>
							</td>
							<td>
								法人：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="chargeperson" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								地址：<span class="noRedSpan">*</span>
							</td>

							<td>
								<html:text maxlength="20" property="address" styleClass="inputText" size="30"/>
							</td>
							<td>
								邮编：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="postcode" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								电话：<span class="noRedSpan">*</span>
							</td>

							<td>
								<html:text maxlength="20" property="tel" styleClass="inputText" size="30"/>
							</td>
							<td>
								传真：<span class="noRedSpan">*</span>
							</td>
							<td><html:text maxlength="20" property="fax" styleClass="inputText" size="30"/>
							</td>
						</tr>
						
						
						
						<c:if test="${param.static_corptype=='SG'}">
						<tr>
							<td>
								公司资质等级和资质证书编号：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpLevel" styleClass="inputText" size="30"/>
							</td>
							<td>
								公司安全生产许可证编号：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpLicence" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								项目经理：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpPrjMan" styleClass="inputText" size="30"/>
							</td>
							<td>
								安&nbsp;&nbsp;全&nbsp;&nbsp;员：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpSafeMan" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								施&nbsp;&nbsp;工&nbsp;&nbsp;员：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpConstructMan" styleClass="inputText" size="30"/>
							</td>
							<td>
								资&nbsp;&nbsp;料&nbsp;&nbsp;员：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpMaterialMan" styleClass="inputText" size="30"/>
							</td>
						</tr>
						</c:if>
						
						
						<c:if test="${param.static_corptype=='JL'}">
						<tr>
							<td>
								资质等级和资质证书编号：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpLevel" styleClass="inputText" size="30"/>
							</td>
							<td>
								总监理工程师：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="superHeadMan" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								现场监理：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<html:text maxlength="20" property="corpSceneMan" styleClass="inputText" size="30"/>
							</td>
						</tr>
						</c:if>
						
						
						
						<tr>
							<td>
								备注：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<html:textarea property="remark" 
									onkeydown="textCounter('remark','spanSummary',200)"
									onkeyup="textCounter('remark','spanSummary',200)" />
								<span class="memoFont" id="spanSummary" style="display: inline">（非必选，200字以内）</span>
							</td>
						</tr>
					</table>
						</fieldset>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" class="button1" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" class="button1" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
