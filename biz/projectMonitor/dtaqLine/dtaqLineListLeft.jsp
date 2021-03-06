<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<title>地铁线路</title>
	<head>
		<%@ include file="/commons/meta.jsp"%>
		<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
        <link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script type="text/javascript">

</script>
</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" width="230px">
					<div style="overflow: visible; width: 230px; height: 98%">
						<script language='javascript'>
								//显示树
							var dtaqLineTree = new dTree('dtaqLineTree');
							dtaqLineTree.setIconPath("${ctx}/scripts/dtree/");
							dtaqLineTree.add('-1',-99,'地铁线路','${ctx}/dtaqLineAction.do?method=list','','main','','','');
							
							<c:forEach items="${dtaqLines}" var="dtaqLine">
									dtaqLineTree.add('line_${dtaqLine.line_id}','-1','${dtaqLine.line_name}','${ctx}/dtaqSegmentAction.do?method=list&qlineId=${dtaqLine.line_id}','','main','','');
							</c:forEach>
							<c:forEach items="${dtaqSegments}" var="dtaqSegment">
									dtaqLineTree.add('segment_${dtaqSegment.segment_id}','line_${dtaqSegment.line_id.line_id}','${dtaqSegment.segment_name}','${ctx}/dtaqStationAction.do?method=list&qsegmentId=${dtaqSegment.segment_id}','','main','','');
							</c:forEach>
							document.write(dtaqLineTree);
							//metroLineTree.closeAll();
						</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
