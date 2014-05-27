package file;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class ShowImage extends HttpServlet{

	@Override
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
		String url = "jdbc:mysql://localhost:3306/book?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "root";
		String driver_class="com.mysql.jdbc.Driver";
		try {
			Class.forName(driver_class);
		} catch (java.lang.ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("加载驱动失败:"+e.getMessage());
		}
		try {
			Connection conn=DriverManager.getConnection(url, user, password);
			Statement st=conn.createStatement();
			String sql="select bookImage from book where bookName='"+codeToString(request.getParameter("bookname"))
						+"'and author='"+codeToString(request.getParameter("author"))
						+"'and publisher='"+codeToString(request.getParameter("publisher"))+"'";
			ResultSet rs=st.executeQuery(sql);
			if(rs.next()){
				int len=10*1024*1024;
				InputStream in=rs.getBinaryStream("bookImage");
				OutputStream toClient=response.getOutputStream();
				response.setContentType("image/jpg");//或者gif等
				byte[] P_Buf=new byte[len];
				int i;
				while((i=in.read(P_Buf))!=-1){
					toClient.write(P_Buf, 0, i);
				}
				in.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String codeToString(String s){
		return s;
	}
	
}
