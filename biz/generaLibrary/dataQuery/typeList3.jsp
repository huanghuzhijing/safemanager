<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp"%>
<ec:table items="dtaqDatas" var="data" action="dtaqDataQueryAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  		<ec:row highlightRow="true" onclick="pullValue('${data.data_id}');" ondblclick="showView('${data.data_id}');">
		<ec:column property="rowcount" cell="rowCount"  title="序号" width="5%"/>
  <ec:column property="part_id" title="监测部位" width="120px">
	  		<c:forEach items="${parts}" var="part">
	  			<c:if test="${part.part_id == data.part_id}">
	  				<c:out value="${part.part_name}"></c:out>
	  			</c:if>
	  		</c:forEach>
	  </ec:column>
  <ec:column property="point_code" title="测点编码" width="120px">
  	<span style="color:#286fdb;cursor:pointer" onclick="showPointDetail(${data.point_id})">${data.point_code}</span>
  </ec:column>
  <ec:column property="write_date" title="监测日期" width="120px" format="yyyy-MM-dd" cell="date" />
  <ec:column property="curr_value" title="${type.current_value_title}" width="140px" />
  <ec:column property="change_rate" title="${type.change_rate_title}" width="140px" />
  <ec:column property="total_change" title="${type.total_change_title}" width="140px" />
  <ec:column property="warn_state" title="预警状态" width="140px">
  	<div id="v_warn_state_${idx}" class="state${data.warn_state}" style="width:50px;display:block;height:18px;"></div>
  </ec:column>
</ec:row>
</ec:table>