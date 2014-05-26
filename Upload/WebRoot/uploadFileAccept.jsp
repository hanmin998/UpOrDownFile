<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Upload File</title>
  </head> 
  <body>
    <%
    	//新建一个SmartUpload对象
    	SmartUpload su=new SmartUpload();
    	//上传初始化，pageContext为JSP内置对象
    	su.initialize(pageContext);
    	//设定允许上传的文件(通过扩展名限制)，仅允许jpg，bmp，gif文件
    	su.setAllowedFilesList("jpg,bmp,gif");
    	//上传文件
    	su.upload();
    	//将上传文件全部保存到指定目录
    	su.save("/upload",SmartUpload.SAVE_PHYSICAL);
     %>
     <table cellspacing="0" cellpadding="3" border="1" width="474">
     	<tr>
			<td width="150">书名：</td>
			<td width="324">
				<%=su.getRequest().getParameter("bookname") %>
			</td>     		
     	</tr>
     	<tr>
     		<td>封面：</td>
     		<td><img src="<%="upload/"+su.getFiles().getFile(0).getFieldName() %>" ></td>
     	</tr>
     	<tr>
     		<td>作者：</td>
     		<td><%=su.getRequest().getParameter("author") %></td>
     	</tr>
     	<tr>
     		<td>出版社：</td>
     		<td><%=su.getRequest().getParameter("publisher") %></td>
     	</tr>
     </table>
  </body>
</html>
