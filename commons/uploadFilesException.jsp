﻿<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%> 
<ex:bundle />

<html:html>
	<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<%--<meta http-equiv="x-ua-compatible" content="ie=7" />--%>
<!--css -->
<%--<link href="<c:url value="/styles/main.css"/>" type="text/css" rel="stylesheet">--%>
<link href="<c:url value="/styles/default.css"/>" type="text/css" rel="stylesheet">
		<%@ include file="/commons/meta_uploadify.jsp"%>
		 <script type="text/javascript" src="${ctx}/scripts/public.js"></script>	
<script type="text/javascript" src="${ctx}/scripts/checkform.js"></script>	
<link rel="STYLESHEET" type="text/css" href="<c:url value="/scripts/button/style/button.css"/>" />
<link rel="STYLESHEET" type="text/css" href="<c:url value="/scripts/button/style/icon.css"/>" />
<script language="javascript" src="${ctx}/scripts/button/script/pico-button.js"></script>
 
		<script type="text/javascript">
		var  typeName="";
   	$(document).ready(function(){
		//
		  
		 var ctx=location.href;
		ctx=ctx.substr(0,ctx.lastIndexOf("/"));
	 
    //上传代码 
 
			 $("#flex_fileupload").uploadify({ 
          'uploader'       : ctx+'/scripts/uploadify/uploadify.swf',
          'script'         : 'servlet/UploadFYException?mainTableName=${param.mainTableName}', 
          'cancelImg'      : ctx+'/scripts/uploadify/cancel.png', 
          'fileDataName'   : 'flex_fileupload', 
          'auto'           : true, 
          'folder'    	 : '/upload',  
          'multi'          : true, 
          'buttonImg'      :ctx+'/scripts/uploadify/btn.jpg', 
          'height'         : 30, // The height of the flash button
		'width'         : 110, // The width of the flash button
		'wmode ':'opaque',
          'buttonText'     : ' ', 
          'simUploadLimit' : 1, 
          'sizeLimit'      : 502309019, 
          'queueSizeLimit' : 1, 
          'fileDesc'       : '所有文件',  
          'fileExt'        : '*.*',   
      	   onComplete: function (event, queueID, fileObj, response, data) {
      	   		var strs=response.split("@@");
      	   		  $("#btn_save_2").show();
      	   		$("[name='file_Name']").val(strs[0]);
      	   		$("[name='file_Addr']").val(strs[1]);
      	   		$("[name='file_Type']").val(strs[2]);
      	   		$("[name='file_realSize']").val(strs[3]);
      	   		 $("[name='file_Size']").val(strs[3]);
		   }, 
		   onError: function(event, queueID, fileObj) { 
       			alert("文件:" + fileObj.name + "上传失败"); 
 		   },
 		   onCancel: function(event, queueID, fileObj){ 
 				alert("取消了" + fileObj.name); 
 		   } 
      });
       $("#btn_save_2").hide();
      $("#btn_save_2").click(function(){
       var tr="";
      if('${param.mainTableName}'=="emergencyMember"||'${param.mainTableName}'=="accidentDeal"){
      if($("[name='attach_type']").val()==""){
      alert("请选择附件类型");
      }else{
  
       var d = new Date();
       var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
      
                            
     
         tr='<tr><td>'+$("[name='file_Name']").val()+'</td><td>'+typeName+'</td><td><ex:employeeName id="${param.empId}"/></td><td>'+str
		     +'</td><td><a href="javascript:#" onclick="deleteFile(this);">删除</a>'
		     +'<input type="hidden" name="file_Id"    value=""  />'
		     +'<input type="hidden" name="file_Addr"    value="'+$("[name='file_Addr']").val()+'"  />'
		      +'<input type="hidden" name="file_Name"    value="'+$("[name='file_Name']").val()+'"  />'
		       +'<input type="hidden" name="file_Type"    value="'+$("[name='file_Type']").val()+'"  />'
		        +'<input type="hidden" name="attach_Type"    value="'+$("[name='attach_type']").val()+'"  />'
		        +'<input type="hidden" name="file_realSize"    value="'+$("[name='file_realSize']").val()+'"  />'
		     +'</td></tr>';
		     
		    
      }
     
      }
      
      

      
      
      
      else{
        tr='<tr><td>'+$("[name='file_Name']").val()+'</td><td>'+$("[name='file_Type']").val()
		     +'</td><td>'+$("[name='file_Size']").val()
		     +'(K)</td><td><a href="javascript:#" onclick="deleteFile(this);">删除</a>'
		     +'<input type="hidden" name="file_Id"    value=""  />'
		     +'<input type="hidden" name="file_Addr"    value="'+$("[name='file_Addr']").val()+'"  />'
		      +'<input type="hidden" name="file_Name"    value="'+$("[name='file_Name']").val()+'"  />'
		       +'<input type="hidden" name="file_Type"    value="'+$("[name='file_Type']").val()+'"  />'
		        +'<input type="hidden" name="file_realSize"    value="'+$("[name='file_realSize']").val()+'"  />'
		     +'</td></tr>';
      }
      
		  
		      	parent.$("#documentlist").append(tr);
		      	$("[name='file_Name']").val("");
      	   		$("[name='file_Addr']").val("");
      	   		$("[name='file_Type']").val("");
      	   		$("[name='file_realSize']").val("");
      	   		 $("[name='file_Size']").val("");
		      	 $("#btn_save_2").hide();
       
      });
        $("#btn_close_2").click(function(){
        
        	parent.art.dialog({id:'newwindow'}).close();
      	});
	});	  
	 
	function formatSize(fsize)
			{
				re=/(\d{1,3})(?=(\d{3})+(?:$|\.))/g;
				return fsize.toString().replace(re,"$1,");
			}
			
		function changeVal(){		
		 var  typeVal=$("[name='attach_type']").val();
		 
		 $.ajax({
			    url:"contentSelectAction.do?method=checkType&typeVal="+typeVal+"",
			    type:'get',
			    dataType:'text',
			    success:function(data){
			   
		       typeName=data;
			    }
			   });		 
		
		 
		}	
		</script>
		<title></title>
	</head>
	<body  >
	<br/>
 	 <center>
 	 <html:form enctype="multipart/form-data" action="accidentDealAction.do"
		method="POST">
		<table cellpadding="0" cellspacing="0" class="dvtable" align="center"  >
            <tr>
									<td>
										文件名称：<span class="redSpan">*</span>
									</td>
									<td colspan="3">
										<input type="text" name="file_Name" class="inputText" maxlength="100" size="40" />
										<input type="file" name="flex_fileupload" id="flex_fileupload" />
										<input type="hidden" name="file_Addr" />
										<input type="hidden" name="uploadMan" />
										<input type="hidden" name="uploadDate" />
									</td>
								</tr>
									
										<tr>
									<td>
										 
									</td>
									<td>
										 <br/> 
									</td>
									</tr>
									<c:if test="${param.mainTableName=='emergencyMember'||param.mainTableName=='accidentDeal'}">
								<tr>
									<td>
										附件类型：<span class="redSpan">*</span>
									</td>
									
									<td>

									<c:if test="${param.mainTableName=='emergencyMember'}">
									<ex:dictSelect type="AttachTypeSelectEmer" property="attach_type" onchange="changeVal()"/>
                                     </c:if>
                                     <c:if test="${param.mainTableName=='accidentDeal'}">
									<ex:dictSelect type="AttachTypeSelectAccident" property="attach_type" onchange="changeVal()"/>
                                     </c:if>    
							        </td>
									
										</tr>
										</c:if>
										
								<tr>
									<td>
										文件类型：<span class="redSpan">*</span>
									</td>
									<td colspan="3">
										
										<input type="text" name="file_Type"  class="showText" readonly="readonly" size="40" />
									
									</td>
									</tr>
									
										<tr>
									<td>
										 
									</td>
									<td>
										 <br/> 
									</td>
									</tr>
								 
								<tr>
									<td>
										文件大小：<span class="redSpan">*</span>
									</td>
									<td  >
											<span style="display:inline-block"><input type="text" name="file_Size" id="filesize" class="showText" readonly="readonly" size="40" /></span>
									<span style="display:inline-block"><input type="hidden" name="file_realSize"  class="showText" readonly="readonly" size="30"/>KB</span>
									
									</td>
								</tr>
								<tr style="display:none">
									<td>
										文件地址：<span class="redSpan">*</span>
									</td>
									<td>
										<input type="text" name="file_Addr"  class="showText" readonly="readonly"  size="30"/>
									</td>
								</tr>
        </table>
       <div class="saveDiv">
					<input type="button" id="btn_save_2" class="button1" value="确  定" icon="icon_save"  />
					&nbsp;&nbsp;
					<input type="button" id="btn_close_2" class="button1"	value="关 闭" icon="icon_close"  />
		</div>
		</html:form>
	 </center>
	</body>
</html:html>
