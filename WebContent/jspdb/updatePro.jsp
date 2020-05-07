<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updatePro.jsp</title>
</head>
<body>
<h2>updatePro.jsp</h2>
<%
String id= request.getParameter("id");
String pass= request.getParameter("pass");
String name= request.getParameter("name");
String addr= request.getParameter("addr");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pw="123456";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pw);
	
	String sql="select * from member where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String rid= rs.getString("id");
		String rpass= rs.getString("pass");
		if(id.equals(rid) && pass.equals(rpass)){
			sql="UPDATE MEMBER SET name=?, addr=? WHERE id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, addr);
			pstmt.setString(3, id);
			pstmt.executeUpdate(); //업데이트 실행
			
			out.println("member update done");
		}else{
			out.println("pass 불일치");
		}
	}else{
		out.println("id 불일치");
	}
}catch(Exception e){
	
}finally{
	if(rs!=null){try{rs.close();}catch(Exception e){}}
	if(pstmt!=null){try{pstmt.close();}catch(Exception e){}}
	if(conn!=null){try{conn.close();}catch(Exception e){}}
}
response.sendRedirect("selectPro.jsp");
%>
</body>
</html>