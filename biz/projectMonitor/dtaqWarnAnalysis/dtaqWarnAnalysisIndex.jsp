<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="28px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/projectMonitor/dtaqWarnAnalysis/dtaqWarnAnalysisHead.jsp" border="0" scrolling="no" 

noresize="noresize"/>  
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="dtaqWarnAnalysisAction.do?method=tree" border="0" scrolling="auto" 

noresize="noresize"  />
	
	
	<frame name="main" src="dtaqWarnAnalysisAction.do?method=list" border="0" scrolling="yes" 

noresize="noresize" />
	
	</frameset>
  </frameset>
</html>
