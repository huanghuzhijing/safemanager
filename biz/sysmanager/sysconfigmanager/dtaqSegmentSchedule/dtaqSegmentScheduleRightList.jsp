<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		var oper_id="";
		//
		$(document).ready(function(){
			//
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			$("#btn_view").hide();
			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);
			//
			$("#btn_add").click(function(){ 
				location.href='dtaqSegmentScheduleAction.do?method=create&station_id=${param.station_id}&station_state=${param.station_state}&station_type=${param.station_type}'; 
			}); 
			//
			$("#btn_edit").click(function(){
				var url='dtaqSegmentScheduleAction.do?method=edit&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='dtaqSegmentScheduleAction.do?method=delete&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			//
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
			
			//
		});
		//刷新
		function pageRefresh(){
			document.forms[0].action='dtaqSegmentScheduleAction.do?method=list';
    		document.forms[0].submit();
		}
		//详细页面
		function showView(id){
	    	var url ='dtaqSegmentScheduleAction.do?method=view&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&viewFlag=true'+'&ec_crd='+$("[name='ec_rd']").val(); 
			commonUrl(url);
	  	}
	  	//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;
		}
	function del(obj){
	 ret = window.confirm('${texts['dtaq.common.delete.msg']}');
		 $.ajax({
				   type: "POST",
				   url: "${ctx}/dtaqSegmentScheduleAction.do?method=validateDelete",	
				   data:"sch_id="+obj,	
				   success: function(msg){
				   if(msg=='no'){
				   alert('被形象进度图形维护所使用，禁止删除');
				   }else{
				if(ret){
					document.forms[0].action='dtaqSegmentScheduleAction.do?method=delete&sch_id='+obj+'&station_id=${param.station_id}&station_state=${param.station_state}&station_type=${param.station_type}'; 
					document.forms[0].submit();
				}
				   }
				   }
				   })
				
			}
	</script>
</head>

<body >
<html:form enctype="multipart/form-data" action="dtaqSegmentScheduleAction.do?method=list&station_id=${param.station_id}&station_state=${param.station_state}&station_type=${param.station_type}" method="POST">

     <fieldset>
    	<legend>信息列表</legend>
    	<c:if test="${param.station_state == '1' && param.station_id != null}">
			<div  class="listButtonDiv">
						<input id="btn_add" value="${texts['button.new']}" type="button" icon="icon_add" />
			</div>
 		</c:if>
  <table class="listTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
	<tr align="center" height="23">
	      <th align="center" width="15%">标段</th>
	      <th align="center" width="15%">车站/区间</th>
		  <th align="center" width="15%">创建时间</th>
		    <c:if test="${param.station_type=='S'}">
		  <th align="center" width="15%">形象进度平面图模板</th>
		  <th align="center" width="15%">形象进度坡面图模板</th>
		  </c:if>
		    <c:if test="${param.station_type=='P'}">
		  <th align="center" width="15%">形象进度平面图模板</th>
		  </c:if>
		   <c:if test="${param.station_state == '1'}">
		  <th align="center" width="15%">操作</th>
		  </c:if>
	</tr>
		<c:forEach items="${dtaqSegmentSchedules}" var="dtaqSegmentSchedule">
				<tr  align="center" height="20">
		  <td>${dtaqSegmentSchedule.segment.segment_name}</td>
		  <td>${dtaqSegmentSchedule.station.station_name}</td>
		  <td>${dtaqSegmentSchedule.upload_date}</td>
		  <c:if test="${dtaqSegmentSchedule.station.station_type=='S'}">
		  <td>
		     <a href='dtaqSegmentScheduleAction.do?method=download&type=plane&sch_id=${dtaqSegmentSchedule.sch_id}'">${dtaqSegmentSchedule.plane_name}</a>
		 </td>
		  <td>  <a href='dtaqSegmentScheduleAction.do?method=download&type=section&sch_id=${dtaqSegmentSchedule.sch_id}'">${dtaqSegmentSchedule.section_name }</a>
		</td>
		  </c:if>
		  <c:if test="${dtaqSegmentSchedule.station.station_type=='P'}">
		  <td><a href='dtaqSegmentScheduleAction.do?method=download&type=schematic&sch_id=${dtaqSegmentSchedule.sch_id}'">${dtaqSegmentSchedule.schematic_name}</a>
		</td>
		  </c:if>
		  <c:if test="${dtaqSegmentSchedule.station.station_state == '1'}">
		   <td>
		   <input type="button" class="button1" value="编辑" onclick="location.href='dtaqSegmentScheduleAction.do?method=edit&sch_id=${dtaqSegmentSchedule.sch_id}&station_id=${dtaqSegmentSchedule.station.station_id}&station_state=${dtaqSegmentSchedule.station.station_state}&station_type=${dtaqSegmentSchedule.station.station_type}'">
		   <input type="button" class="button2" value="删除" onclick="del('${dtaqSegmentSchedule.sch_id}')">
		
		
		</td>
		</c:if>
		</tr>		
		</c:forEach>
		
		
     </table>
     </fieldset>
</html:form>
</body>
</html:html>
