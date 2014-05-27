<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*,java.sql.*,java.io.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>upload file to database</title>
  </head>
  
  <body>
    <%
	    //-- 将上传的图片保存为一个文件   
	    //新建一个SmartUpload对象
	    SmartUpload su=new SmartUpload();
	    //上传初始化，pageContext为jsp内置对象
	    su.initialize(pageContext);
	    //设定允许上传的文件（通过扩展名限制），仅允许jpg，bmp，gif文件
	    su.setAllowedFilesList("jpg,bmp,gif");
	    //上传文件
	    su.upload();
	    //将上传文件全部保存到指定目录
	    su.save("/upload",SmartUpload.SAVE_VIRTUAL);
    %>
    <%
	    //将上传的图片放入到数据库表的对应字段中
	    String filename=su.getFiles().getFile(0).getFilePathName();
	    String url = "jdbc:mysql://localhost:3306/book?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "root";
	    Connection conn=null;
	    Class.forName("com.mysql.jdbc.Driver");
	    conn=DriverManager.getConnection(url, user, password);
	    FileInputStream bookImageFile=new FileInputStream(filename);
	    String sql="insert into book(bookName,bookImage,author,publisher) values (?,?,?,?)";
	    PreparedStatement ps=conn.prepareStatement(sql);
	    ps.setString(1,su.getRequest().getParameter("bookname"));
	    ps.setBinaryStream(2,bookImageFile,bookImageFile.available());
	    ps.setString(3,su.getRequest().getParameter("author"));
	    ps.setString(4,su.getRequest().getParameter("publisher"));
	    ps.execute();
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
     		<td>
     			<img src="ShowImage?bookname=<%=su.getRequest().getParameter("bookname") %>
     								&author=<%=su.getRequest().getParameter("author") %>
     								&publisher=<%=su.getRequest().getParameter("publisher") %>">
     		</td>
     	</tr>
     	<tr>
     		<td>作者： </td>
     		<td><%=su.getRequest().getParameter("author") %></td>
     	</tr>
     	<tr>
     		<td>出版社：</td>
     		<td><%=su.getRequest().getParameter("publisher") %></td>
     	</tr>
	</table>
  </body>
</html>
