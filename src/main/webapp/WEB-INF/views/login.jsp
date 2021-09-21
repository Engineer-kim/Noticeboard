<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


<form id ="login" method="post">
		<div>
               <tr>
                     <th><div id="buttonB1">아이디</div></th>
                     <td><input type="text" id="userId" name="userId"></td>
               </tr>
                <tr>
                     <th><div id="buttonB1">비밀번호</div></th>
                     <td><input type="password" id="userPwd" name="userPwd"></td>
                 </tr>
                </table>
                <input type="button" value="로그인" id="loginBtn">
        </div>
<script>
        $(function() {
            $('#loginBtn').mouseenter(function() {
                $(this).css('cursor','pointer') ;
            }).mouseout(function() {
                $(this).css('cursor','normal') ;
            }).click(function() {
                loginCheck() ;
            }) ;
        }) ;
        
        function submitCheck() {
            var userId  = $('#userId' ).val() ;
            var userPwd = $('#userPwd').val() ;
            $.ajax({
                type : "POST",
                url: '/web/login',
                data: {userId:userId, userPwd:userPwd},
                success: function(data) {
                    if(data == "false")
                        alert('잘못된 아이디이거나, 비밀번호가 틀렸습니다.') ;
                    else
                        location.href="idex" ; // home.do로 돌아가시면 됩니다.
                }
            }) ;
        }
        
        $('.loginInput').keydown(function(key) {
            if(key.keyCode == 13) {
                $('#loginBtn').click() ;
            }
        }) ;
    </script>
</form>

 --%>







</head>
<body>

</body>
</html>