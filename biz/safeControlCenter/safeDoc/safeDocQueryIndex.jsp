<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="28px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/safeControlCenter/safeDoc/safeDocHead.jsp" border="0" scrolling="no" noresize="noresize"/>  
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="safeDocAction.do?method=queryListLeft" border="0" scrolling="auto" noresize="noresize"  />
	<!--	<frame name="main" src="dataEmulationAction.do?method=list" border="0" scrolling="yes" noresize="noresize" />-->
	
	<frame name="main" src="safeDocAction.do?method=queryList&qlineId=${qlineId}&qsegmentId=${qsegmentId}" border="0" scrolling="yes" noresize="noresize" />
	
	</frameset>
  </frameset>
</html>
