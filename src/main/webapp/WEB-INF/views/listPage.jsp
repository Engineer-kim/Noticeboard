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

//--------------- 정렬 부분(10개 , 20개 ,30개)
function Change(idx){
    var pageNum = idx;
    var nowPaging = $("#pageUnit option:selected").val();
    var pageUnit = document.getElementById("pageUnit");

    
    
    if(nowPaging == 10){
        location.href="/board?num="+pageNum+"&pageUnit="+nowPaging;    
     }else if(nowPaging == 20){
        location.href="/board?num="+pageNum+"&pageUnit="+nowPaging;     
    }else if(nowPaging == 30){
        location.href="/board?num="+pageNum+"&pageUnit="+nowPaging;     
    } 
}








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
	      <td>
	      		<div class="form-group">
    				<select id="pageUnit" name="pageUnit">
        				<option value="10" <c:if test="${pageUnit == 10}">selected="selected"</c:if>>10개씩 보기</option>
        				<option value="20" <c:if test="${pageUnit == 20}">selected="selected"</c:if>>20개씩 보기</option>
        				<option value="30" <c:if test="${pageUnit == 30}">selected="selected"</c:if>>30개씩 보기</option>
    				</select>
				</div>
		   </td> 
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
			<%-- <c:forEach begin="1" end="${pageNum}" var="num">
    		<span>
     				<a href="board?num=${num}">${num}</a>
  			</span>
 			</c:forEach> --%>
 			
 			<c:if test="${prev}">
 				<span>[ <a href="board?num=${startPageNum - 1}">이전</a> ]</span>
			</c:if>
				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
  					<span>
  						 <c:if test="${select != num}">
   								<a href="board?num=${num}">${num}</a>
  						 </c:if>    
  
  							<c:if test="${select == num}">  <!-- -->
   								<b>${num}</b>
  							</c:if>
  					</span>
				</c:forEach>

				<c:if test="${next}">
 					<span>[ <a href="board?num=${endPageNum + 1}">다음</a> ]</span>
				</c:if>	
 			
 			
 			
 			
 			
 			
  			
  			<!-- 검색 부분  -->		
  			 <div> 
  			 <form  action="board" method="get">
  					<select name="searchType">
      					<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
						<option value="content" <c:if test="${condition eq 'contents' }">selected</c:if>>내용</option>
      						
  					</select>
  
  							<input type="text" name="keyword" value ="${keyword}"/>
  							<input type="hidden" name="num" value ="${select}"/>
  							<button type="submit" id=searchBtn >검색</button>
 					</form>
 			
 			</div>
  				<!--<form action="board?num=${num}" method="get"> <%-- <c:if test="${condition eq 'titlename' }">selected</c:if>	 --%>
					<label for="condition">검색조건</label>
					<select name="condition" id="condition">
						<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
						<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
					</select>
						<input type="text" name="keyword" id="keyword" placeholder="검색어 ..." value="${keyword }"/>
							<button type="submit">검색</button>
						</form><!-- condition이라는 파라미터 명으로 넘어간다. -->
				
				
  				
  
  
			
		</div>
	</div>
</div>


<script>

function Change(idx){
    var pageNum = idx;
    var nowPaging = $("#pageUnit option:selected").val();
    var pageUnit = document.getElementById("pageUnit");

    //debugger;
    
    if(nowPaging == 10){
        location.href="/board?num="+pageNum+"&pageUnit="+nowPaging;    
     }else if(nowPaging == 20){
        location.href="/board?num="+pageNum+"&pageUnit="+nowPaging;     
    }else if(nowPaging == 30){
        location.href="/board?num="+pageNum+"&pageUnit="+nowPaging;     
    } 
}

var pageUnit = document.getElementById('pageUnit');
pageUnit.addEventListener('change', function (e) {
	console.log(e.target.value);
	Change(e.target.value);
});


</script>




</body>
</html>
