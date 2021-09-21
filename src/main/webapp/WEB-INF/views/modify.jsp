<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>과제</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 --><link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
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
  <h1>과제</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index">홈</a>
      </li>

    </ul>
  </div>  
</nav>

<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
	      <h2>수정 페이지</h2>
	        <form action="modifyAction" method = "POST" >
				<div class="form-group">
				  <label for="usr">제목 수정:</label>
				  <input type="text" class="form-control"  name = "title"  value= "${view.title}"/>
				</div>
			    <input type="hidden" class="form-control"  name = "idx"  value= "${view.idx}"/>
			      <input type="hidden" class="form-control"  name = "num"  value= "${num}"/>
			    
			    <div class="form-group">
				  <label for="comment">내용 수정:</label>
				  <textarea class="form-control" rows="5"  name = "contents"   >${view.contents}</textarea>
				</div>
			    <button type="submit" id = "modifyBtn">수정완료</button>
			  </form>
		</div>
	</div>
</div>
</body>
</html>

<script >
	
	
	
	
	
	
	
	
</script>

<body>










</body>