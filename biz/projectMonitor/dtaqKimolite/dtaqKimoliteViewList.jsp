<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle />
<html:html>
<head>
<title><fmt:message key="base.dataDict.title" />
</title>

<style type="text/css">
	.titleDiv{ color:#50A2E6;font-size:13px;font-weight: bold ;padding-left:10px; }
	.defbtn{ display:none ; }
	.editTd{ text-align:left ; padding-left:10px; }
	.defTd{ text-align:center ; }
</style>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	function del(id,station_id){
		location.href = "${ctx}/dtaqKimoliteAction.do?method=delete&kimolite_id="+id+"&station_id="+station_id ;
	}
	
	function upd(id){
		location.href = "${ctx}/dtaqKimoliteAction.do?method=edit&kimolite_id="+id ;
	}
</script>
</head>
<body>
		  <fieldset>
		  <legend></legend>
		  <table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		   		<thead>
		   			<tr>
		   				<th>文件名</th>
		   			</tr>
		   		</thead>
		   		<tbody>
		   			<c:if test="${dtaqKimolite != null}">
		   			<tr>
		   				<td>
		   					<c:if test="${dtaqKimolite.attach_name != null}">
								<a href="${ctx}/dtaqKimoliteAction.do?method=download&id=${dtaqKimolite.kimolite_id}">${dtaqKimolite.attach_name}</a>
							</c:if>
		   				</td>
		   			</tr>
		   			</c:if>
		   		</tbody>
		   </table>
		  </fieldset>
		   <c:if test="${dtaqKimolite.attach_name != null}">
		   <fieldset>
		<legend>
			<strong>水土信息</strong>
		</legend>	
		   		<table>
		   			<tr>
		   				<td><div style="width:710px; overflow:scroll;">${dtaqKimolite.content}</div></td>
		   			</tr>
		   		</table>
		   		</fieldset>
		   </c:if>		   
	
</body>
</html:html>