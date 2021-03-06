<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			var parcelIds=parent.$("#plugTemp_parcelIds").val();
			var parcelNames=parent.$("#plugTemp_parcelNames").val();
			var parcelCodes=parent.$("#plugTemp_parcelCodes").val();
			$.each( $(".cbox_select"), function(i, obj){
				if(parcelIds.indexOf(","+$(this).val()+",")>-1){
					obj.checked=true;
				}
			});
			//
			$("#btn_save").click(function(){
				var operObj = $("[name='select_id']:checked");
       			var length = operObj.length;
       			if(length==0){
					alert("请至少选择一个地块");
				}else{
				parcelIds="";
				parcelNames="";
				parcelCodes="";
					 $("[name='select_id']:checked").each(function(i){
		       			if(parcelIds==""){
								parcelIds=","+$(this).val()+",";
							}else{
								parcelIds=parcelIds+$(this).val()+",";
							}
							if(parcelNames==""){
								parcelNames=$(this).attr("paramName");
							}else{
								parcelNames=parcelNames+","+$(this).attr("paramName");
							}
							if(parcelCodes==""){
								parcelCodes=$(this).attr("paramArray");
							}else{
								parcelCodes=parcelCodes+","+$(this).attr("paramArray");
							}
						
		       		 })
		       		 	    parent.$("#plug_parcelIds").val(parcelIds); 
							parent.$("#plug_parcelNames").val(parcelNames);
							parent.$("#plug_parcelCodes").val(parcelCodes);
					        parent.art.dialog({id:'commonDialog1'}).close();
		
				}
			});
			//
			//
			$("#btn_close").click(function(){
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
			
		});
	</script>
</head>
<body>
	 <table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="contentSelectAction.do?method=selectParcels&queryType=${param.queryType}">
					<table class="queryContentTable">
						<tr>
							<td >
								地块编号：
							</td>
							<td>
								<html:text property="qparcelCode" styleClass="inputText" maxlength="100"></html:text>
							</td>
								<td >
								地块名称：
							</td>
							<td>
								<html:text property="qparcelName" styleClass="inputText" maxlength="100"></html:text>
							</td>
							<td >
								所属地区：
							</td>
							<td>
								<ex:dictSelect property="qlocation" type="Location" />
							</td>
							<td >
								<input type="submit" value="${texts['button.query']}" icon="icon_query" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="landParcels" var="landParcel" 
		action="contentSelectAction.do?method=selectParcels&queryParcleType=${param.queryParcelType}" title=""  locale="zh_CN"
	  	sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
	  	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="8%"/>
			<ec:column property="landParcelCode" title="地块编号" />
			<ec:column property="landParcelName" title="地块名称" />
			<ec:column property="location" calcTitle="location" title="所属区位"
				width="8%">
				<ex:dicDisplay dictIdentify="Location"
					dictValue="${landParcel.location}" />
			</ec:column>
			<ec:column property="area" calcTitle="area" title="地块面积(亩)">
				<fmt:formatNumber pattern="#,##0.00" value="${landParcel.area}" />
			</ec:column>
						<ec:column property="null" title="选择" width="8%">
				<input name='select_id' value="${landParcel.id}" type="checkbox" class="cbox_select" paramName="${landParcel.landParcelName}" paramArray="${landParcel.landParcelCode}">
			</ec:column>	
		</ec:row>
	</ec:table>
		<div class="saveDiv">
			<input id="btn_save" type="button"  icon="icon_save"  value="${texts['button.save']}"  />
			<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}"  />
		</div>
</body>
</html:html>
