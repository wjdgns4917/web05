<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mupdateForm.jsp</title>
</head>
<body>
<h2>mupdateForm.jsp</h2>
<form action="mupdatePro.jsp" method="post">
<label for="id">ID</label>
<input type="text" id="id" name="id" /> <br />
<label for="name">NAME</label>
<input type="text" id="name" name="name" /> <br />
<label for="score">SCORE</label>
<input type="text" id="score" name="score" /> <br />
<label for="lv">LV</label>
<input type="text" id="lv" name="lv" /> <br />

<input type="submit" value="수정" /> <br />
<button onclick="location.href='mselectProcess.jsp'">조회</button>
</form>
</body>
</html>