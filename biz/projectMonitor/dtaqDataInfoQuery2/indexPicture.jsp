<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="28px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/projectMonitor/dtaqDataInfoQuery2/pictureHead.jsp" border="0" scrolling="no" 

noresize="noresize"/>  
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="dtaqDataInfoQuery2Action.do?method=treePicture" border="0" scrolling="auto" 

noresize="noresize"  />
	
	
	<frame name="main" src="dtaqDataInfoQuery2Action.do?method=listPicture" border="0" scrolling="yes" 

noresize="noresize" />
	
	</frameset>
  </frameset>
</html>
