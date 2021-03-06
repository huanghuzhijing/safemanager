﻿<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			$("[name='rolename']").blur(function(){
				$("[name='annexmodulename']").val($(this).val()+"帮助文档") ;
			});
			//
			$("#btn_save").click(function(){
				
				$.ajax({
				   type: "POST",
				   url: "${ctx}/sysRoleAction.do?method=checkrolename",
				   data: "id=${param.f_rid}&rolename="+$("input[name='f_rname']").val(),
				   success: function(msg){
				   		 if(msg=="no"){ 
				   		 		alert("此角色名 已存在!");     
						  }else{
						      //  $("#btn_save").addClass("z-btn-dsb");
						  	//	$("#btn_save").attr("disabled","disabled");
						  	//	document.forms[0].submit();
						  		var properties=new Array(); 
								properties[0]=["f_rname","角色名"];
								properties[1]=["f_rstate","有效状态"];
								properties[2]=["qmidName","所属模块"];
								saveValidateRequired("#btn_save",properties,"sysRoleForm");
						  }
				   }
				});
			}); 
			//
			$("#btn_back").click(function(){ 
				location.href='sysRoleAction.do?method=list&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}&ec_id=${param.f_rid}&qrolename=${param.qrolename}&midName=${param.midName}';
			}); 
			//
		});
				function showUploadDialogAndRefresh(URL,tWidth,tHeight)
{
	dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	//window.open(URL,"",dlgFeatures);
	//window.location.reload();
	//window.open (URL, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
}   
	//清空
		function fileClear(){
			 $("#fileName_").val("");
			 $("#fileAddr_").val("");
		}
		
		
	</script>
</head>
<content tag="heading">
	系统角色权限配置
</content>
<body >
   
		
	<html:form enctype="multipart/form-data" action="sysRoleAction.do" method="POST">
		<input type="hidden" name="method" value="save">
		<html:hidden property="f_rid" />
		<html:hidden property="flag" value="${param.flag}" />
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${param.f_rid}" />
		<html:hidden property="midName" />
		<html:hidden property="qrolename" />
		<fieldset>
			<legend>
				角色管理
			</legend>
			<table class="formTable" >
				    <COLGROUP>
						<COL class="tdLeftOne">
				        <COL class="tdRightOne">
					</COLGROUP>
					  <tr>
					    <td >角 色 名：<span class="redSpan">*</span></td>
					    <td>
					    	<html:text property="f_rname" styleClass="inputText" maxlength="100" size="48"/>
						</td>
					  </tr>
					  <tr>
					    <td >有效状态：<span class="noRedSpan">*</span></td>
					    <td >
					      <ex:dictSelect property="f_rstate" type="RoleDone"/>
						</td>
					  </tr>		
					  <tr>
					    <td >所属模块：<span class="redSpan">*</span></td>
					    <td>
					    <html:select property="qmidName" value="${qmidName}">
								<html:option value="">请选择</html:option>
								<c:forEach items="${lists}" var="f_mid1">
									<html:option value="${f_mid1.f_mid}" >${f_mid1.f_mname}</html:option>
								</c:forEach>
									
							</html:select>
						</td>
					  </tr>
					  <tr>
					    <td >角色说明：<span class="noRedSpan">*</span></td>
					    <td >
					    	<html:textarea property="remark" ></html:textarea>（4000字以内）
					    </td>
					  </tr>
					
					  <tr>
						<td>
							帮助文档名称：<span class="noRedSpan">*</span>
						</td>
							<td >
						       <span style="float: left;"><input type="text" id="fileName_" name="fileName_"
							class="inputText" size="30" value="${sysModuleInfo.annexRoleName}" /></span>
						<span style="float: inherit;margin-left:5px;"><input type="button" icon="icon_currWeek"
							onclick="javascript:showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);"
							style="width: 76px; height: 65px; cursor: pointer" value="文件上传"
							alt="进入文件上传页面" /></span>
						<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_"/>--%>
						<input type="button" icon="icon_delete" onclick="fileClear(this)"
							style="width: 76px; height: 65px; cursor: pointer" value="清空" />
							<c:if test="${sysModuleInfo.annexRoleAddr!=null}">
								<a href="<%=request.getContextPath()%>/sysRoleAction.do?method=downloadSingle&f_rid=${sysModuleInfo.f_rid}">${sysModuleInfo.annexRoleName}</a>
							</c:if>
<%--							<html:text property="fileName_" styleClass="inputText"	value="${compCompleteCheck.reportAnnex}" maxlength="100" size="30"/>--%>
						</td>
						<td style="display:none">
							制度文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="fileAddr_" class="inputText" readonly="readonly" size="30" value="${sysModuleInfo.annexRoleAddr}"/>
							
						</td>
					</tr>
			</table>
			</fieldset>
			 <c:if test="${param.flag==1}"><c:set var="tabstate1" value="true"></c:set></c:if>
	        <c:if test="${param.flag==2}"><c:set var="tabstate2" value="true"></c:set></c:if>
		<ex:tab id="dockjTab" width="100%">
		 
			<ex:tabItem name="lab1" url="${ctx}/sysRoleAction.do?method=edit&flag=1&f_rid=${param.f_rid}&qrolename=${param.qrolename}&midName=${param.midName}" selected="${tabstate1}" label="新系统角色权限信息" >
				<c:if test="${param.flag == '1'}">
					<%@ include file="/biz/sysmanager/sysmaintain/sysRole/sysRoleCompetenceForm.jsp" %>
				</c:if>
			   </ex:tabItem>
		   <ex:tabItem name="lab2"  url="${ctx}/sysRoleAction.do?method=edit&flag=2&f_rid=${param.f_rid}&qrolename=${param.qrolename}&midName=${param.midName}" label="老系统角色权限信息" selected="${tabstate2}">
		   	<c:if test="${param.flag == '2'}">
				<%@ include file="/biz/sysmanager/sysmaintain/sysRole/oldsysRoleCompetenceForm.jsp" %>
			</c:if>
		   </ex:tabItem>
		</ex:tab>
	</html:form>
	<div  class="saveDiv">
				<input id="btn_save" type="button"  icon="icon_save"  value="${texts['button.save']}" />
				<input id="btn_back" type="button"  icon="icon_back" value="${texts['button.back']}" />
			</div>
</body>
</html:html>
