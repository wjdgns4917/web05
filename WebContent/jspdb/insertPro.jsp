<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String addr=request.getParameter("addr");

//db에 연결
Connection conn=null;
PreparedStatement pstmt=null;
String str="";

try{
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pw="123456";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pw);
	//접속 성공
	String sql="INSERT INTO MEMBER VALUES(?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	pstmt.setString(4, addr);
	//실행
	pstmt.executeUpdate(); //insert 실행
}catch(Exception e){
	out.print("접속 실패");
}finally{
	if(pstmt!=null)
		try{pstmt.close();}catch(Exception e){ }
	if(conn!=null)
		try{conn.close();}catch(Exception e){ }
}
//response.sendRedirect("insertForm.jsp");
response.sendRedirect("selectPro.jsp");
out.println("<h3>member에 레코드 추가</h3>");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertPro.jsp</title>

<h2>insertPro.jsp</h2>
ID: <%=id %> <br />
PASS: <%=pass %> <br />
NAME: <%=name %> <br />
ADDR: <%=addr %> <br />
