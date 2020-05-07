<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<% 
String id=request.getParameter("id");
String name=request.getParameter("name");
String score=request.getParameter("score");
String lv=request.getParameter("lv");

Connection conn=null;
PreparedStatement pstmt=null;
String str="";

try{
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pw="123456";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pw);
	
	String sql="INSERT INTO MEMSCORE VALUES(?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, score);
	pstmt.setString(4, lv);
	
	pstmt.executeUpdate();
}catch(Exception e){
	out.print("접속 실패");
}finally{
	if(pstmt!=null)
		try{pstmt.close();}catch(Exception e){}
	if(conn!=null)
		try{conn.close();}catch(Exception e){}
}
response.sendRedirect("mselectProcess.jsp");
out.println("<h3>member에 레코드 추가</h3>");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberPro.jsp</title>
<h2>memberPro.jsp</h2>
ID: <%=id %> <br />
NAME: <%=name %> <br />
SCORE: <%=score %> <br />
LV: <%=lv %> <br />
