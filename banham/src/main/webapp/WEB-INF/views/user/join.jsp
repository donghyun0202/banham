<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banham Sign Up Page</title>
	<!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- style -->
    <link href="${path}/resources/css/reset.css" rel="stylesheet"/>
    <link href="${path}/resources/css/user/join.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$( document ).ready(function() {
	        console.log( "회원가입 PAGE loaded" );
	        // 회원가입 Form 유효성 검증
			let checkID = RegExp(/^[a-z0-9]{6,20}$/); // 아이디 유효성 검사(영문 혹은 영문+숫자를 조합하여 6~20자리로 입력해 주세요.)
			let checkPW = RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/); //비밀번호 유효성 검사(영문 대소문자, 숫자, 특수문자( !@#$%^&*()_+~ ) 중 3개 이상을 조합하여 8자리 이상 입력해 주세요.)
	        let checkName = RegExp(/^[가-힣]|[A-Z]|[a-z]$/); // 이름 유효성 검사(한글 또는 영문으로 입력해주세요.)
	        let checkPhone = RegExp(/^[0-9]+$/);// 연락처 유효성 검사 (숫자만 입력해주세요.)        
	        let checkEmail = RegExp(/^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$/); // 이메일 유효성 검사(이메일 형식으로 입력해주세요.)
	        let checkBirthyear = RegExp(/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/); //생년월일 유효성 검사(숫자 8자리만 입력해주세요.)
	        let checkDuplicateId = 0;
	        function checkForm() { 
	        	// 아이디 CHECK
		        $('#user_id').blur(function() {
					var user_id = $('#user_id').val();
					$.ajax({
						url : '/user/idCheck?userId='+ user_id,
						type : 'get',
						success : function(data) {
							console.log("1 = 중복o / 0 = 중복x : " + data);							
							if (data == 1) {
								// 1 : 아이디 중복
								$("#id_check p").text("사용중인 아이디입니다. 다시 입력해주세요.");
								checkDuplicateId = 1;
								//$("#user_id").focus();
			                    return false;
			                    
								} else {
									// 0: 아이디 중복 X
									if(user_id == ""){
										$('#id_check p').text('아이디를 입력해주세요 :)');
										//$("#user_id").focus();
					                    return false;			
										
									} else {
										// 아이디 유효성 검사
										if(checkID.test(user_id) == true){
											$('#id_check p').text("");
											//$("#user_password").focus();
											checkDuplicateId = 0;
						                    return true;
										}else{
											$('#id_check p').text("아이디는 영문 혹은 영문+숫자를 조합하여 6~20자리로 입력해 주세요.");
											//$("#user_id").focus();
						                    return false;
										}
										
									}
									
								}
							}, error : function() {
									console.log("실패");
							}
						});
					});
				
				//비밀번호 CHECK
		        $('#user_password').blur(function(){
		        	user_password = $("#user_password").val();
		        	if(user_password == "" ){                
	                    $("#pw_check p").text("비밀번호를 입력해주세요");
	                    //$("#user_password").focus();
	                    return false;
	                }else{
	                    if(!checkPW.test(user_password)) {
	                        $("#pw_check p").text("최소 하나의 영문 대소문자, 숫자, 특수문자를 포함하여 8자리 이상이어야 합니다.");
	                        //$("#user_password").focus();                
	                        return false;
	                    }else{
	                    	$("#pw_check p").text("");
	                        //$("#user_email").focus();
	                        return true;                          
	                    }
	                }
		        });
				
				// 이메일 CHECK
		        $('#user_email').blur(function(){
		        	user_email = $("#user_email").val();
		        	if(user_email == "" ){                
	                    $("#email_check p").text("이메일을 입력해주세요");
	                    //$("#user_email").focus();
	                    return false;
	                }else{
	                    if(!checkEmail.test(user_email)) {
	                        $("#email_check p").text("이메일 형식이 아닙니다.확인 후 다시 입력해주세요.");
	                        //$("#user_email").focus();                
	                        return false;
	                    }else{
	                    	$("#email_check p").text("");
	                        //$("#user_name").focus();
	                        return true;                          
	                    }
	                }
		        });
				
		     	// 이름 CHECK
		        $('#user_name').blur(function(){
		        	user_name = $("#user_name").val();
		        	if(user_name == "" ){                
	                    $("#name_check p").text("이름을 입력해주세요");
	                    //$("#user_name").focus();
	                    return false;
	                }else{
	                    if(!checkName.test(user_name)) {
	                        $("#name_check p").text("한글 또는 영문으로 입력해주세요.");
	                        //$("#user_name").focus();                
	                        return false;
	                    }else{
	                    	$("#name_check p").text("");
	                        //$("#user_birthyear").focus();
	                        return true;                          
	                    }
	                }
		        });
		     	
		     	// 생년월일 CHECK
		        $('#user_birthyear').blur(function(){
		        	user_birthyear = $("#user_birthyear").val();
		        	if(user_birthyear == "" ){                
	                    $("#birthyear_check p").text("생년월일을 입력해주세요.");
	                    //$("#user_birthyear").focus();
	                    return false;
	                }else{
	                    if(!checkBirthyear.test(user_birthyear)) {
	                        $("#birthyear_check p").text("생년월일 숫자 8자리만 입력해주세요.");
	                       // $("#user_birthyear").focus();                
	                        return false;
	                    }else{
	                    	$("#birthyear_check p").text("");
	                        //$("#user_gender").focus();
	                        return true;                          
	                    }
	                }
		        });
		     	
		      //성별 CHECK
	        	$("select[name=select_gender]").change(function(){
		        	user_gender = $("select[name=select_gender] option:selected").text();
		        	console.log(user_gender);
		        	if(user_gender == "성별" ){                
	                    //$("#gender_check p").text("성별을 선택해주세요.");
	                    //$("select[name=select_gender]").focus();
	                    return false;
	                }else{
                    	$("#gender_check p").text("");
                    	$('#user_gender').attr('value', user_gender);
                    	//$("#user_phone").focus();
                        return true;                          
                    }
		        });
		     	
		     	// 핸드폰번호 CHECK
		        $('#user_phone').blur(function(){
		        	user_phone = $("#user_phone").val();
		        	if(user_birthyear == "" ){                
	                    $("#phone_check p").text("핸드폰 번호를 입력해주세요.");
	                    //$("#user_phone").focus();
	                    return false;
	                }else{
	                    if(!checkPhone.test(user_phone)) {
	                        $("#phone_check p").text("숫자만 입력해주세요.");
	                        //$("#user_phone").focus();                
	                        return false;
	                    }else{
	                    	$("#phone_check p").text("");
	                        return true;                          
	                    }
	                }
		        });
	        }
	        checkForm();
	        
	     	// button 클릭시        
	        $('#join').click(function(){
	            if($("#user_id").val() == "" || $("#user_password").val() == "" || $("#user_name").val() == "" || $("#user_birthyear").val() == "" || $("#user_email").val() == "" || $("#user_phone").val() == ""){                  
	                swal('회원가입 실패!', "공백을 입력하세요.", 'warning');
	                return false;
	            }else if($("#user_gender").val() == "성별" || $("#user_gender").val() == ""){
	            	swal('회원가입 실패!', "성별을 선택해주세요.", 'warning');
	            	$("#gender_check p").text("성별을 선택해주세요.");
	            	return false;
	            }else if(!checkID.test($("#user_id").val()) || !checkPW.test($("#user_password").val()) || !checkName.test($("#user_name").val()) || !checkPhone.test($("#user_phone").val()) || !checkEmail.test($("#user_email").val()) || !checkBirthyear.test($("#user_birthyear").val())){
	            	swal('회원가입 실패!', "형식에 맞춰 작성해주세요.", 'warning');                          
	                return false;
	            }else if(checkDuplicateId == 1){
	            	swal('회원가입 실패!', "아이디 중복입니다, 확인 후 다시 입력하세요.", 'warning');
	                return false;
	            }else {
	                $("form").submit();
	                return true;
	            }                      
	        });    
	        
	    });
	       
	</script>
</head>
<body>
<form method="post">
	<div class="mainWrap">
        <div class="joinWrap">
            <a href="/"><img class="logo" src="${path}/resources/images/logo/logo_pink.png" alt=""></a>
            <div class="joinBox">
                <div class="itemBox">
                    <input id="user_id" type="text" placeholder="아이디" name="user_id"><br>
                    <img src="${path}/resources/images/icon/user.png" alt="">
                </div>
                <div class="textWrap" id="id_check"><p></p></div>
                <div class="itemBox">
                    <input id="user_password" type="password" placeholder="비밀번호" name="user_password"><br>
                    <img src="${path}/resources/images/icon/lock.png" alt="">
                </div>
                <div class="textWrap" id="pw_check"><p></p></div>
                <div class="itemBox">
                    <input id="user_email" type="text" placeholder="이메일" name="user_email"><br>
                    <img src="${path}/resources/images/icon/email.png" alt="">
                </div>
                <div class="textWrap" id="email_check"><p></p></div>
                <div class="itemBox">
                    <input id="user_name" type="text" placeholder="이름" name="user_name"><br>
                    <img src="${path}/resources/images/icon/user.png" alt="">
                </div>
                <div class="textWrap" id="name_check"><p></p></div>
                <div class="itemBox">
                    <input id="user_birthyear" type="text" placeholder="생년월일 8자리" name="user_birthyear"><br>
                    <img src="${path}/resources/images/icon/calendar.png" alt="">
                </div>
                <div class="textWrap" id="birthyear_check"><p></p></div>
                <div class="itemBox">
                    <select class="selectBox" name="select_gender">
                        <option value="gender">성별</option>
                        <option value="female">여성</option>
                        <option value="male">남성</option>
                    </select>
                    <img src="${path}/resources/images/icon/genders.png" alt="">
                    <input id="user_gender" type="hidden" name="user_gender" ><br>
                </div>
                <div class="textWrap" id="gender_check"><p></p></div>
                <div class="itemBox">
                    <input id="user_phone" type="text" placeholder="휴대전화번호" name="user_phone"><br>
                    <img src="${path}/resources/images/icon/smartphone.png" alt="">
                </div>
                <div class="textWrap" id="phone_check"><p></p></div>
                <input type="button" id ="join" value="회원가입">
                <div class="footerWrap">
                    <p>copyright © 반함_반려동물과 함께 All Rights Reserved.</p>
                </div>
            </div>
        </div>
        <div class="imgWrap">
    
        </div>
    </div>
</form>
</body>
</html>