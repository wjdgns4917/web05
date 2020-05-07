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
<title>mselectProcess.jsp</title>
</head>
<body>
<h2>mselectProcess.jsp</h2>
<table border="1" width="500">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>점수</td>
		<td>레벨</td>
	</tr>
	<%
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String user="scott";
		String pw="123456";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url,user,pw);
		
		String sql="SELECT * FROM memscore";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			String id=rs.getString("id");
			String name=rs.getString("name");
			String score=rs.getString("score");
			String lv=rs.getString("lv");
		%>	
			<tr>
				<td><%=id %></td>
				<td><%=name %></td>
				<td><%=score %></td>
				<td><%=lv %></td>
			</tr>
		<% }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null){try{rs.close();}catch(Exception e){}}
		if(pstmt!=null){try{pstmt.close();}catch(Exception e){}}
		if(conn!=null){try{conn.close();}catch(Exception e){}}
	}
		%>
</table>
<button onclick="location.href='memscoreForm.jsp'">입력</button>
<button onclick="location.href='mselectProcess.jsp'">조회</button>
<button onclick="location.href='mupdateForm.jsp'">수정</button>
<button onclick="location.href='mdeleteForm.jsp'">삭제</button>
</body>
</html>