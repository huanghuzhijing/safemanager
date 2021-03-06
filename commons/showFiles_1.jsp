<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
<!--

//-->
function openWin(url){
	window.open (url, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")
}
</script>
<fieldset><legend>附件信息</legend>
<table class="listTable" >
	<thead>
		<tr>
			<th width="8%">
				序&nbsp;&nbsp;&nbsp;&nbsp;号
			</th>
			<th>
				附件名称
			</th>
			<th width="15%">
				附件类型
			</th>
			<th width="15%">
				附件大小(K)
			</th>
			<th width="15%">
				操&nbsp;&nbsp;&nbsp;&nbsp;作
			</th>
		</tr>
	</thead>
	<c:forEach items="${pubannexLst_1}" var="annex" varStatus="index">
		<tr id="historytr${annex.id}" ondblclick="location.href='pubAnnexAction.do?method=download&id=${annex.id}'">
			<td>
				${index.count }
			</td>
			<td>
				${annex.filename}&nbsp;
			</td>
			<td>
				${annex.filetype}&nbsp;
			</td>
			<td>
				${annex.filesize}&nbsp;(K)
			</td>
			<td>
				<input type="button" class="button1" annexid="${annex.id}" 
					value="<fmt:message key="button.download"/>" name="download" icon="icon_download"
					onclick="location.href='pubAnnexAction.do?method=download&id=${annex.id}'" />
				 <c:if test="${fn:contains('doc,docx,ppt,xls,pdf',fn:toLowerCase(annex.filetype))}">
					<input type="button" class="button1"
						value="在线查看" name="download"
						icon="icon_view"
						onclick="openWin('pubAnnexAction.do?method=webOfficeView&id=${annex.id}&fileType=${fn:toLowerCase(annex.filetype)}');" />
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
</fieldset>