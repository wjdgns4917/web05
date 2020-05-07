<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jdbcTest.jsp</title>
</head>
<body>
<%
Connection conn=null;
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:orcl";

boolean connect=false;

try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url, "scott", "123456");
	connect=true;
}catch(Exception e){
	connect=false;
	e.printStackTrace();
}

%>
<h2>jdbcTest.jsp</h2>
<%
if(connect==true){%>
	<h3>연결 성공</h3>
<%}else{%>
	<h3>연결 실패</h3>
<%} %>



</body>
</html>