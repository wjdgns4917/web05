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
<title>deletePro.jsp</title>
</head>
<body>
<h2>deletePro.jsp</h2>
<%
String id= request.getParameter("id");
String pass= request.getParameter("pass");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pw="123456";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pw);
	
	String sql="select id,pass from member where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery(); //실행
	if(rs.next()){
		String rid=rs.getString("id");
		String rpass=rs.getString("pass");
		
		if(id.equals(rid) && pass.equals(rpass)){
			sql="delete from member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate(); //delete 실행
			out.println("삭제 완료");
		}else{
			out.println("패스워드 오류");
		}
	}else{
		out.println("id 오류");
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