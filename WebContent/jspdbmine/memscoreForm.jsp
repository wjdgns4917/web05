<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memscoreForm.jsp</title>
</head>
<body>
<h2>memscoreForm.jsp</h2>
<form action="memberPro.jsp" method="post">
<label for="id">ID</label>
<input type="text" id="id" name="id" /> <br />
<label for="name">NAME</label>
<input type="text" id="name" name="name" /> <br />
<label for="score">SCORE</label>
<input type="text" id="score" name="score" /> <br />
<label for="lv">LV</label>
<input type="text" id="lv" name="lv" /> <br />
<input type="submit" value="입력" /> <br />
</form>
<button onclick="location.href='mslectProcess.jsp'">조회</button>
<button onclick="location.href='mupdateForm.jsp'">수정</button>
</body>
</html>