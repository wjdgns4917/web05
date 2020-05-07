<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mdeleteForm.jsp</title>
</head>
<body>
<h2>mdeleteForm.jsp</h2>
<form action="mdeletePro.jsp" method="post">
<label for="id">ID</label>
<input type="text" id="id" name="id" /> <br />
<label for="name">NAME</label>
<input type="text" id="name" name="name" /> <br />

<input type="submit" value="삭제" /> <br />
</form>
<button onclick="location.href='mselectProcess.jsp'">조회</button>
<button onclick="location.href='mupdateForm.jsp'">수정</button>
</body>
</html>