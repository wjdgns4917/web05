<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deleteForm.jsp</title>
</head>
<body>
<h2>deleteForm.jsp</h2>
<form action="deletePro.jsp" method="post">
<label for="id">ID</label>
<input type="text" id="id" name="id" /> <br />
<label for="pass">PASS</label>
<input type="text" id="pass" name="pass" /> <br />

<input type="submit" value="삭제" /> <br />
</form>
<button onclick="location.href='selectPro.jsp'">조회</button>
<button onclick="location.href='updateForm.jsp'">수정</button>
</body>
</html>