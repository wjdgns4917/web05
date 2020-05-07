<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateForm.jsp</title>
</head>
<body>
<h2>updateForm.jsp</h2>
<form action="updatePro.jsp" method="post">
<label for="id">ID</label>
<input type="text" id="id" name="id" /> <br />
<label for="pass">PASS</label>
<input type="text" id="pass" name="pass" /> <br />
<label for="name">NAME</label>
<input type="text" id="name" name="name" /> <br />
<label for="addr">ADDR</label>
<input type="text" id="addr" name="addr" /> <br />
<input type="submit" value="수정"/> <br />
</form>
<button onclick="location.href='selectPro.jsp'">조회</button>

</body>
</html>