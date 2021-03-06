<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle />
<html lang="en">
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/highcharts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/highcharts/highcharts.js"></script>
<script type="text/javascript" src="${ctx}/scripts/highcharts/exporting.js"></script>
<script type="text/javascript" src="${ctx}/scripts/highcharts/highcharts-zh_CN.js"></script>
 <script>	
	$(function () {
	Highcharts.setOptions({
			//global: {useUTC: false}
		});
    $('#container').highcharts({
    		labels:{
           
            items:[{
                html:'华中科技大学安全预警系统',
                style: { 
                    left: '300px',
                    top: '200px',
                    color:'#C0C0C0',
                    fontSize:'20px',
                    fontWeight:'bold',
                    fontFamily:'微软雅黑'
                }
            }]
        },
        
        chart: {
            type: 'line',
            inverted:'ture'
        },
         credits:{
        	enabled:false//不显示highCharts版权信息
        },
        title: {
            text: ${title}
        },
        
        xAxis: {
        	
        	 title: {
                text: '深度(m)'
            },
        	gridLineWidth: 1,
        	lineColor: '#000',
			tickColor: '#000',
           // categories: ${list_name}
            type:'category'
        },
        
        yAxis: {
        	opposite : 'true',
        	lineWidth: 2,
        	minorTickInterval: 'auto',
			lineColor: '#000',
			lineWidth: 1,
			tickWidth: 1,
			tickColor: '#000',
            title: {
                text: '累计偏移量(mm)'
            },
            tickInterval:0.5
        },
        tooltip: {
          //  enabled: false,
          //  formatter: function() {
           //     return '<b>'+ this.series.name +'</b><br/>'+this.x +': '+ this.y +'°C';
          //  }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: false
                },
                connectNulls:true,
                enableMouseTracking: false
            }
        },
        
        exporting: {
            type:'image/png',
            buttons: {
            	contextButton: {
           		 menuItems: [{
            		text: '导出PNG图片文件',
            		onclick: function() {
            			this.exportChart();
            		},
            		separator: false
           		 }]
            }
            }
        },
        
        series: ${dataTemp}
    });
    
    
});	
  </script>
</head>

<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="dtaqDataInfoQuery3Action.do?method=showComparePointTimes3">
					<input type="hidden" name="point_id" value="${point_id}">
					<input type="hidden" name="type_kind" value="${type_kind}">
					<table align="left">
						<tr>
							<td>项目名称：</td>
							<td>${dtaqStation.segment_id.line_id.line_name}</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>标段名称：</td>
							<td>${dtaqStation.segment_id.segment_name}</td>
							<td>车站区间：</td>
							<td>${dtaqStation.station_name}</td>
						</tr>
						<tr>
							<td>监测单位：</td>
							<td>${orgName}</td>
							<td>监测类型：</td>
							<td>${type.type_name}</td>
						</tr>
						<tr>
							<td>监测时间：</td>
							<td>
								<input type="text"  name="qstartDate"  class="inputText" value="${qstartDateTemp}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDateTemp}" onfocus="WdatePicker()" />
							</td>
							
							<td align="right" >
								<input type="submit"  icon="icon_query"   value="查  询" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	
	 	<div id="container" style="width:700px;height:1000px"></div>
	
</body>
</html>