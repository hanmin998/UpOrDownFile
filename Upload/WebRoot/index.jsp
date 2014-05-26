<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Upload file</title>
  </head>
  
  <body>
    <form method="post"action="uploadFileAccept.jsp" name="book" enctype="multipart/form-data">
    	<table cellspacing="0" cellpadding="3" border="1" width="474">
    		<tr>
    			<td align="center" colspan="2">录入书籍信息</td>
    		</tr>
    		<tr>
    			<td width="150">书名：</td>
    			<td width="324"><input type="text" name="bookname"></td>
    		</tr>
    		<tr>
    			<td>封面：</td>
    			<td><input type="file" name="photofile"></td>
    		</tr>
    		<tr>
    			<td>作者：</td>
    			<td><input type="text" name="author"></td>
    		</tr>
    		<tr>
    			<td>出版社：</td>
    			<td><input type="text" name="publisher"></td>
    		</tr>
    		<tr>
    			<td colspan="2" width="474"><input type="submit" name="提交"></td>
    		</tr>
    	</table>
    	
    </form>
  </body>
</html>
