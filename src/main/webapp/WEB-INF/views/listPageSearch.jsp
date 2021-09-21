<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>과제</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
 <script type="text/javascript"> 
$(document).ready(function() {
    $("#writeBtn").click(function(){
    	location.href ="write";
    	
    	
    });
  
    
	$(".boardListItem").click(function(e){
		var idx = $(this).data('boardId');
		deleteBoard(idx);
		alert(idx);
	});
	
	
	
	

	 
	

function deleteBoard(idx) {
	//console.log(idx);
	//
	if ( confirm("이글을 정말 삭제하시겠습니까? ")) {
		 

		
		
		
		
		
		
		
		//deleteAction
   	$.ajax({
   			url:'/web/deleteAction?idx=' + idx,//GET 방식일떄
   		    type:'GET', 
//    		    contentType : "application/json; charset=utf-8",
   		    async: false, 
   		     timeout :1000,
//    		    data:JSON.stringify({'idx': idx}), //보낼 데이터,   //post방식일떄 body에 내장해서 호출
   			
   		    success: function(data) {
   		   	location.href = location.href; //새로고침 
   		    },
   		    error: function(err) {
   		       
   		    }
   	})
			
	}

function modifyBoard(idx) {
		//console.log(idx);
		//
		{
			 //location.href="modify";
			   $.ajax({
					url:'/web/modifyAction?idx=' + idx,
					type: 'GET' ,
					 async: false, 
		   		     timeout :1000,
			   
		   		  success: function(data) {
		   		       
		   		    },
		   		    error: function(err) {
		   		       
		   		    }
			   
		   });
				
		}
}

//---------------







//-----------------	
	//
}

})

// html+= "<tr> <td><a href = 'view?idx=" + item.idx + "'>" + item.title + "</a></td> </tr>"
// + "<button type='button' class='btn btn-primary' align='right' id = 'deleteBtn'>글삭제</button></td> </tr>"
// <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>

</script>
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
	      <h2>게시판</h2>
			<table id="example" class="display" style="width:100%">
		        <thead>
		            <tr>
		                <td>게시물 번호</td>
		                <td>제목</td>
		                <td>내용</td>
		                 
		            </tr>
		        </thead>
		        
		        <!-- <tbody id = "listArea"> -->
		        
		        <c:forEach items="${list}" var="board">
				 	<tr>
					<td>${board.idx}  </td>
					<td><a href="modify?idx=${board.idx}">${board.title}</a></td>
					<td>${board.contents} </td>
					<td><button type="button" class="boardListItem" data-board-id="${board.idx}" id = "deleteBtn">삭제하기</button></td>
					<!--  <td>${Board.image}</td>  -->		        
					</tr>
		        </c:forEach>
		        
		        
		        
		    </table>
			<button type="button" class="btn btn-primary" id = "writeBtn">글쓰기</button>
			 
			 
			<!-- 페아장 처리 -->
			<c:forEach begin="1" end="${pageNum}" var="num">
    		<span>
     				<a href="board/listPageSearch?num=${num}">${num}</a>
  			</span>
 			</c:forEach>
  			
  			<!-- 검색 부분  -->		
 
  				<div>
  					<select name="searchType">
      					<option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option><!-- test 내부에는 조건이 들어가고, 이 조건이 참인 경우 <c:if> ~ </c:if> 사이에 있는 문자인 selected를 출력, 거짓인 경우 아무것도 출력하지 않습니다. -->
        				<option value="content" <c:if test="${searchType eq 'contents'}">selected</c:if>>내용</option>
      				</select>
  
  							<input type="text" name="keyword" value ="${keyword}" />
  
  							<button type="button" id=searchBtn>검색</button>
 			     </div>
 			     	<script>
							document.getElementById("searchBtn").onclick = function () {
    						let searchType = document.getElementsByName("searchType")[0].value;
  							let keyword =  document.getElementsByName("keyword")[0].value;
  							
  							location.href = "/board?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
  							//console.log(searchType)
  							//console.log(keyword)
  							};
					</script>
 			<!-- <script>
 				document.getElementById("searchBtn").onclick = function () {
 			    
 				  let searchType = document.getElementsByName("searchType")[0].value;
 				  let keyword =  document.getElementsByName("keyword")[0].value;
 				  
 				  console.log(searchType)
 				  console.log(keyword)
 				 };
			</script> -->
  				
  
  
			
		</div>
	</div>
</div>
</body>
</html>
