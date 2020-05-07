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
<title>mupdatePro.jsp</title>
</head>
<body>
<h2>mupdatePro.jsp</h2>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String score=request.getParameter("score");
String lv=request.getParameter("lv");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pw="123456";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pw);
	
	String sql="select * from memscore where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String rid=rs.getString("id");
		String rname=rs.getString("name");
		if(id.equals(rid) && name.equals(rname)){
			sql="UPDATE memscore SET score=?, lv=? WHERE id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, score);
			pstmt.setString(2, lv);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
			
			out.println("memscore update done");
		}else{
			out.println("name 불일치");
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
response.sendRedirect("mselectProcess.jsp");
%>
</body>
</html>