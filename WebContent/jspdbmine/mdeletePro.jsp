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
<title>mdeletePro.jsp</title>
</head>
<body>
<h2>mdeletePro.jsp</h2>
<%
String id= request.getParameter("id");
String name= request.getParameter("name");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pw="123456";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pw);
	
	String sql="select id,name from memscore where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String rid=rs.getString("id");
		String rname=rs.getString("name");
		
		if(id.equals(rid) && name.equals(rname)){
			sql="delete from memscore where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate(); //delete 실행
			out.println("삭제 완료");
		}else{
			out.println("이름 오류");
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
response.sendRedirect("mselectProcess.jsp");
%>
</body>
</html>