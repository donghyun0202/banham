<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page import ="com.project.banham.user.UserVO" %> 
<% 	
	String name;
	String id;
	String pw;
	String email;
	String phone;
	String gender;
	String birthyear;
	
	UserVO vo = (UserVO)session.getAttribute("userSession");
	if (vo != null){
		id = vo.getUser_id();
		name = vo.getUser_name();
		email = vo.getUser_email();
		phone = vo.getUser_phone();
		gender = vo.getUser_gender();
		birthyear = vo.getUser_birthyear();
		
	}else{
		id = "";
		name = "";
		email = "";
		phone = "";
		gender = "";
		birthyear = "";
	}
	
%>
<title>Insert title here</title>
	<link href="${path}/resources/css/mypage/mypageChangeInfo.css" rel="stylesheet"/>
</head>
<body>
	<!-- 회원정보확인 PAGE 1 START-->
     <div class="myInfoPwCheckWrap">
         <div class="checkWrap">
             <div class="inputWrap">
                 <h3>회원정보확인</h3>
                 <table id="myPagetable">
                     <tr>
                         <td><p>아이디</p></td>
                         <td><h4 id="id" style="margin-left: 10px;"><%=id %></h4></td>
                     </tr>
                     <tr>
                         <td><p>비밀번호</p></td>
                         <td><input type="password" placeholder="비밀번호를 입력하세요." id="input_password"></td>
                     </tr>
                 </table>
                 
             </div>
             <div class="buttonWrap">
                 <input type="button" value="확인" onclick="infoPwButton()">
             </div>
         </div>
     </div>
     <!-- 회원정보확인 PAGE 1  END-->

     <!-- 회원정보확인 PATE 2 START -->
     <div class="myInfoModifyWrap" style="display: none;">
         <table>
             <tr>
                 <td>이름</td>
                 <td><%=name %></td>
                 <td></td>
             </tr>
             <tr>
                 <td>아이디</td>
                 <td><%=id %></td>
                 <td></td>
             </tr>
             <tr>
                 <td>비밀번호</td>
                 <td><input type="password" id="mypassword" readonly/></td>
                 <td><input type="button" value="수정" onclick="changeClick(this.id,'<%=id %>','<%=email %>','<%=phone %>')" id="password"></td>
             </tr>
             <tr>
                 <td>생년월일</td>
                 <td><%=birthyear %></td>
                 <td></td>
             </tr>
             <tr>
                 <td>이메일</td>
                 <td id='myemail'><%=email %></td>
                 <td><input type="button" value="수정" onclick="changeClick(this.id,'<%=id %>','<%=email %>','<%=phone %>')" id="email"></td>
             </tr>
             <tr>
                 <td>연락처</td>
                 <td id='myphone'><%=phone %></td>
                 <td><input type="button" value="수정" onclick="changeClick(this.id,'<%=id %>','<%=email %>','<%=phone %>')" id="phone"></td>
             </tr>
             <tr>
                 <td>성별</td>
                 <td>여성</td>
                 <td></td>
             </tr>
         </table>
         <div class="modifytextWrap">
         	<p>* 확인을 누르셔야 변경이 완료됩니다. *</p>
         </div>
         <div class="modifyButtonWrap">
             <input type="button" value="취소" onclick="deleteinfoChange('<%=email %>','<%=phone %>')">
             <input type="button" value="확인" class="okCheck" onclick="modifyInfoClick('<%=id %>','<%=email %>','<%=phone %>')">
         </div>
     </div>
     <!-- 회원정보확인 PATE 2 END -->
     
     <!-- MODAL -->
    <div id="Infomodal" class="InfoexplainWrap">
        <div class="InfoexplainBox">
            <div class="InfochangeWrap">
            </div>
        </div>    
    </div>
    
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="${path}/resources/js/mypageChangeInfo_modal.js"></script>
    <script src="${path}/resources/js/mypageChangeInfo.js"></script>
</body>
</html>