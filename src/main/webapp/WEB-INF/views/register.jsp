<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>과제(회원가입)</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
 </head>
<body>



<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>회원가입</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index">홈</a>
        <a class="nav-link" href="login">로그인</a>
      </li>
    </ul>
  </div>  
</nav>



<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
	      <h2>회원가입</h2>
	        <form action="registerAction" method = "POST" >
				<div class="form-group">
			<a>아이디 : </a>
			<input type="text" class="form-control"  name = "userid"  value= "${member.userid}" >
				<a>비밀번호:</a>
				<input type="password" class="form-control"  name = "userpwd"  value= "${member.userpwd}">
			    <a>이름:</a>
			    <input type="text" class="form-control"  name = "username"  value= "${member.username}">
				
			    <button type="submit"  id = "registerBtn" >가입 완료</button>
			  </form>
		</div>
	</div>
</div>
</form>


</body>
</html>
  
  
  