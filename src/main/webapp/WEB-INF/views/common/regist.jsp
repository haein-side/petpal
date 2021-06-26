<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            li > button {
                background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 60%; 
                height: 50px; 
                font-size: 16px; 
                font-weight: 600;
                border-radius: 30px;
                margin-bottom: 15px;
                margin-left: 20%;
            }
            li > button:hover {
                background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid; 
            }

            li > img {
                width: 50%;
                height: 50%;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: 15px;
                margin-right: 15px;
                text-align: center;
            }
            .loginForm > input {
                width: 60%;
                height: 50px;
                border-radius: 30px;
                margin-bottom: 20px;
                border: 1px solid rgb(175, 175, 175);
                margin-left: 20%; 
            }
            td > input {
            	height: 40px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
            }
            tr, td {
            	font-size: 17px;
				height: 55px;
				text-align: left;
			}
            td > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
            }
            div > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid;
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                margin-left: 20px;
            }
            td > input::placeholder {
                font-size: 15px;
                color:#a1a1a1;
            }
            
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">
		
		 <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
		
        <!--Google Font link-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	

        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.css"> 
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick-theme.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/animate.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/iconfont.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/magnific-popup.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootsnav.css">

        <!-- xsslider slider css -->


        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/xsslider.css">-->




        <!--For Plugins external css-->
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/plugins.css" />-->

        <!--Theme custom css -->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>

<body data-spy="scroll" data-target=".navbar-collapse">

        <!-- Preloader -->
        <div id="loading">
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div><!--End off Preloader -->

            <jsp:include page="../user/common/userHeader.jsp"/>
            <!--Home Sections-->

     <section id="loginconfirm" class="login">
           <div class="loginForm" style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 50px; margin-bottom: 50px; box-shadow: 3px 3px 3px 3px rgb(204, 204, 204);">
              <h2 style="text-align: center; color: gray; margin-top: 30px;">회원가입</h2><br>
				<form action="${ pageContext.servletContext.contextPath }/user/regist" method="post" id="regist" name="form" onsubmit="return validate();">
                    <table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px;">
						<tr>
							<td>아이디</td>
							<td><input type="text" id="userId" placeholder="영문 대소문자와 숫자 4~12자리" name="userId" required></td>
							<td>
							<input type="hidden" id="idCheck" name="idCheck" value="fail">
							<button onclick="return duplicationCheck()" type="button">중복확인</button>
							</td>
						</tr>
						<tr id="hiddenMessage" style="display: none;">
						<td></td>
						<td>
							<p id="checkMessage" style="font-size : 20px; color: red;"/>
						</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="userName" id="userName" placeholder="이름을 입력하세요" required></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type="text" id="userNickName" name="userNickName" placeholder="닉네임을 입력하세요" required></td>
	                        <td>
	                        <input type="hidden" id="nameCheck" name="nameCheck" value="fail">
	                        <button onclick="return duplicationNickCheck()" type="button">중복확인</button>
	                        </td>
						</tr>
						<tr id="hiddenNickMessage" style="display: none;">
						<td></td>
						<td>
							<p id="checkNickMessage" style="font-size : 20px; color: red;"/>
						</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요" required></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="userPwdCheck" id="userPwdCheck" placeholder="비밀번호를 확인해 주세요" required></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" id="userPhone" name="userPhone" placeholder="전화번호 입력하세요" required></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" id="userEmail" name="userEmail" placeholder="이메일 입력하세요" required></td>
	                        <td>
	                        <input type="hidden" id="emailCheck" name="emailCheck" value="fail">
	                        <button onclick="return duplicationEmailCheck()" type="button">중복확인</button>
	                        </td>
						</tr>
	                    <tr id="hiddenEmailMessage" style="display: none;">
						<td></td>
						<td>
							<p id="checkEmailMessage" style="font-size : 20px; color: red;"/>
						</td>
						</tr>
	                    <tr>
	                    	<td>뉴스레터 이메일 수신 동의</td>
	                    	<td>
	                    	<label name="newsletter" style="font-size: 15px; font-weight: normal; padding-right: 30px;">
	                    	<input type="radio" id="newsletter" name="newsletter" style="width: 15px;" value="Y" checked> 동의</label>
	                    	<label name="newsletter" style="font-size: 15px; font-weight: normal; padding-right: 30px;">
	                    	<input type="radio" id="newsletter" name="newsletter" style="width: 15px;" value="N"> 거절</label>
	                    	</td>
	                    </tr>	
	                    <tr>
	                    	<td>댓글알림 이메일 수신 동의</td>
	                    	<td>
	                    	<label name="notion" style="font-size: 15px; font-weight: normal; padding-right: 30px;">
	                    	<input type="radio" id="notion" name="notion" style="width: 15px;" value="Y" checked> 동의</label>
	                    	<label name="notion" style="font-size: 15px; font-weight: normal; padding-right: 30px;">
	                    	<input type="radio" id="notion" name="notion" style="width: 15px;" value="N"> 거절</label>
	                    	</td>
	                    </tr>	
	                    <tr style="height: 150px;">
	                    	<td>이용약관</td>
	                    	<td><textarea class="form-control" disabled style="height: 90%; resize:none;">
**제1조 목적**
본 이용약관은 “(주)펫팔”(이하 “사이트”)의 서비스의 이용조건과 운영에 관한 제반사항 규정을 목적으로 합니다.

**제2조 용어의 정의**
본 약관에서 사용되는 주요한 용어의 정의는 다음과 같습니다.
회원 : 사이트의 약관에 동의하고 개인정보를 제공하여 회원등록을 한 자로서, 사이트와의 이용계약을 체결하고 사이트를 이용하는 이용자를 말합니다.
이용계약 : 사이트 이용과 관련하여 사이트와 회원간에 체결 하는 계약을 말합니다.
회원 아이디(이하 “ID”) : 회원의 식별과 회원의 서비스 이용을 위하여 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.
비밀번호 : 회원이 부여받은 ID와 일치된 회원임을 확인하고 회원의 권익보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.
운영자 : 서비스에 홈페이지를 개설하여 운영하는 운영자를 말합니다.
해지 : 회원이 이용계약을 해약하는 것을 말합니다.

**제3조 약관외 준칙**
운영자는 필요한 경우 별도로 운영정책을 공지 안내할 수 있으며, 본 약관과 운영정책이 중첩될 경우 운영정책이 우선 적용됩니다.

**제4조 이용계약 체결**
이용계약은 회원으로 등록하여 사이트를 이용하려는 자의 본 약관 내용에 대한 동의와 가입신청에 대하여 운영자의 이용승낙으로 성립합니다. 회원으로 등록하여 서비스를 이용하려는 자는 사이트 가입신청 시 본 약관을 읽고 아래에 있는 “동의합니다”를 선택하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.

**제5조 서비스 이용 신청**
회원으로 등록하여 사이트를 이용하려는 이용자는 사이트에서 요청하는 제반정보(이용자ID, 비밀번호, 닉네임 등)를 제공해야 합니다. 타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 사이트 이용과 관련하여 아무런 권리를 주장할 수 없으며, 관계 법령에 따라 처벌 받을 수 있습니다.

**제6조 개인정보처리방침**
사이트 및 운영자는 회원가입시 제공한 개인정보 중 비밀번호를 가지고 있지 않으며 이와 관련된 부분은 사이트의 개인정보처리방침을 따릅니다. 운영자는 관계법령이 정하는 바에 따라 회원등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력을 합니다. 회원의 개인정보보호에 관하여 관계법령 및 사이트가 정하는 개인정보처리방침에 정한 바에 따릅니다. 단, 회원의 귀책사유로 인해 노출된 정보에 대해 운영자는 일체의 책임을 지지 않습니다. 운영자는 회원이 미풍양속에 저해되거나 국가안보에 위배되는 게시물 등 위법한 게시물을 등록 · 배포할 경우 관련기관의 요청이 있을시 회원의 자료를 열람 및 해당 자료를 관련기관에 제출할 수 있습니다.

**제7조 운영자의 의무**
운영자는 이용회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 가급적 빨리 처리하여야 합니다. 다만, 개인적인 사정으로 신속한 처리가 곤란한 경우에는 사후에 공지 또는 이용회원에게 쪽지, 전자우편 등을 보내는 등 최선을 다합니다. 운영자는 계속적이고 안정적인 사이트 제공을 위하여 설비에 장애가 생기거나 유실된 때에는 이를 지체 없이 수리 또는 복구할 수 있도록 사이트에 요구할 수 있습니다. 다만, 천재지변 또는 사이트나 운영자에 부득이한 사유가 있는 경우, 사이트 운영을 일시 정지할 수 있습니다.

**제8조 회원의 의무**
회원은 본 약관에서 규정하는 사항과 운영자가 정한 제반규정, 공지사항 및 운영정책 등 사이트가 공지하는 사항 및 관계법령을 준수하여야 하며, 기타 사이트의 업무에 방해가 되는 행위, 사이트의 명예를 손상시키는 행위를 해서는 안됩니다. 회원은 사이트의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다. 이용고객은 아이디 및 비밀번호 관리에 상당한 주의를 기울여야 하며, 운영자나 사이트의 동의 없이 제3자에게 아이디를 제공하여 이용하게 할 수 없습니다. 회원은 운영자와 사이트 및 제3자의 지적 재산권을 침해해서는 안됩니다. 회원은 사회통념상 타인에게 혐오감을 줄 수 있는 콘텐츠를 사이트 내 게재하여서는 안되며, 운영자는 회원이 이와 같은 콘텐츠를 게재하였음을 발견 시 운영자는 즉각적으로 탈퇴 조치를 시행합니다.

**제9조 서비스 이용시간**
서비스 이용시간은 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 단, 사이트는 시스템 정기점검, 증설 및 교체를 위해 사이트가 정한 날이나 시간에 서비스를 일시중단 할 수 있으며 예정된 작업으로 인한 서비스 일시 중단은 사이트의 홈페이지에 사전에 공지하오니 수시로 참고하시길 바랍니다. 단, 사이트는 다음 경우에 대하여 사전 공지나 예고없이 서비스를 일시적 혹은 영구적으로 중단할 수 있습니다.
(1) 긴급한 시스템 점검, 증설, 교체, 고장 혹은 오동작을 일으키는 경우
(2) 국가비상사태, 정전, 천재지변 등의 불가항력적인 사유가 있는 경우
(3) 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지한 경우
(4) 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우 전항에 의한 서비스 중단의 경우 사이트는 사전에 공지사항 등을 통하여 회원에게 통지 합니다.
단, 사이트가 통제할 수 없는 사유로 발생한 서비스의 중단에 대하여 사전공지가 불가능한 경우에는 사후공지로 대신합니다.

**제10조 서비스 이용 해지**
회원이 사이트와의 이용계약을 해지하고자 하는 경우에는 회원 본인이 온라인을 통하여 등록해지신청을 하여야 합니다. 한편, 사이트 이용해지와 별개로 사이트에 대한 이용계약 해지는 별도로 하셔야 합니다. 해지신청과 동시에 사이트가 제공하는 사이트 관련 프로그램이 회원관리 화면에서 자동적으로 삭제됨으로 운영자는 더 이상 해지신청자의 정보를 볼 수 없습니다.

**제11조 서비스 이용 제한**
회원은 다음 각 호에 해당하는 행위를 하여서는 아니되며 해당 행위를 한 경우에 사이트는 회원의 서비스 이용 제한 및 적법한 조치를 취할 수 있으며 이용계약을 해지하거나 기간을 정하여 서비스를 중지할 수 있습니다.
(1) 회원 가입시 혹은 가입 후 정보 변경시 허위 내용을 등록하는 행위
(2) 타인의 사이트 이용을 방해하거나 정보를 도용하는 행위
(3) 사이트의 운영진, 직원 또는 관계자를 사칭하는 행위
(4) 사이트, 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위
(5) 다른 회원의 ID를 부정하게 사용하는 행위
(6) 다른 회원에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위
(7) 범죄와 결부된다고 객관적으로 판단되는 행위
(8) 기타 관련 법령에 위배되는 행위

**제12조 게시물의 관리**
회사는 항상 불량 게시물 및 자료에 대하여 모니터링을 하여야 하며, 불량 게시물 및 자료를 발견하거나 신고를 받으면 해당 게시물 및 자료를 삭제하고 이를 등록한 회원에게 주의를 주어야 합니다. 한편, 이용회원이 올린 게시물에 대해서는 게시자 본인에게 책임이 있으니 회원 스스로 본 이용약관에서 위배되는 게시물은 게재해서는 안됩니다. 정보통신윤리위원회 등 공공기관의 시정요구가 있는 경우 혹은 불량 게시물로 판단되는 경우 회사는 회원의 사전 동의 없이 게시물을 삭제하거나 이동 할 수 있습니다. 불량게시물의 판단기준은 다음과 같습니다.
(1) 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
(2) 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
(3) 불법복제 또는 해킹을 조장하는 내용인 경우
(4) 영리를 목적으로 하는 광고일 경우
(5) 범죄와 결부된다고 객관적으로 인정되는 내용일 경우. 단, 사전에 허락을 받은 경우에는 이에 속하지 않음
(6) 다른 이용자 또는 제3자와 저작권 등 기타 권리를 침해하는 경우
(7) 기타 관계법령에 위배된다고 판단되는 경우  사이트 및 운영자는 게시물 등에 대하여 제3자로부터 명예훼손, 지적재산권 등의 권리 침해를 이유로 게시중단 요청을 받은 경우 이를 임시로 게시중단(전송중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관련기관의 결정 등이 이루어져 사이트에 접수된 경우 이에 따릅니다.

**제13조 게시물의 보관**
사이트 운영자가 불가피한 사정으로 본 사이트를 중단하게 될 경우, 회원에게 사전 공지를 하고 게시물의 이전이 쉽도록 모든 조치를 취하기 위해 노력합니다.

**제14조 게시물에 대한 저작권**
회원이 사이트 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 다만, 사이트 운영자와 협의에 따라 에디터 및 작가로 임명된 자가 작성하는 글에 대한 저작권은 사이트에게 귀속 됩니다.  사회통념상 허용하는 범위 안에서, 회사는 회원이 작성한 게시글을 회사의 서비스를 홍보 목적으로 사용할 수 있습니다.  회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다. 운영자는 회원이 게시하거나 등록하는 사이트 내의 내용물, 게시 내용에 대해 제12조 각 호에 해당된다고 판단되는 경우 사전통지 없이 삭제하거나 이동 또는 등록 거부할 수 있습니다.

**제15조 손해배상**
본 사이트의 발생한 모든 민,형법상 책임은 회원 본인에게 1차적으로 있습니다. 본 사이트로부터 회원이 받은 손해가 천재지변 등 불가항력적이거나 회원의 고의 또는 과실로 인하여 발생한 때에는 손해배상을 하지 하지 않습니다.

**제16조 면책**
회사는 회원이 사이트의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다. 회사는 본 사이트의 서비스 기반 및 타 통신업자가 제공하는 전기통신서비스의 장애로 인한 경우에는 책임이 면제되며 본 사이트의 서비스 기반과 관련되어 발생한 손해에 대해서는 사이트의 이용약관에 준합니다 회사는 회원이 저장, 게시 또는 전송한 자료와 관련하여 일체의 책임을 지지 않습니다. 회사는 회원의 귀책사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임지지 아니합니다. 회사는 회원 상호간 또는 회원과 제3자 상호간, 기타 회원의 본 서비스 내외를 불문한 일체의 활동(데이터 전송, 기타 커뮤니티 활동 포함)에 대하여 책임을 지지 않습니다. 회사는 회원이 게시 또는 전송한 자료 및 본 사이트로 회원이 제공받을 수 있는 모든 자료들의 진위, 신뢰도, 정확성 등 그 내용에 대해서는 책임지지 아니합니다. 회사는 회원 상호간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 물품거래 등을 한 경우에 그로부터 발생하는 일체의 손해에 대하여 책임지지 아니합니다. 회사는 귀책사유 없이 회원간 또는 회원과 제3자간에 발생한 일체의 분쟁에 대하여 책임지지 아니합니다. 회사는 서버 등 설비의 관리, 점검, 보수, 교체 과정 또는 소프트웨어의 운용 과정에서 고의 또는 고의에 준하는 중대한 과실 없이 발생할 수 있는 시스템의 장애, 제3자의 공격으로 인한 시스템의 장애, 국내외의 저명한 연구기관이나 보안관련 업체에 의해 대응방법이 개발되지 아니한 컴퓨터 바이러스 등의 유포나 기타 운영자가 통제할 수 없는 불가항력적 사유로 인한 회원의 손해에 대하여 책임지지 않습니다.
부칙 이 약관은 2017. 07. 03일부터 시행합니다.
							</textarea></td>
	                    	<td style="vertical-align:bottom;"><label name="termsOfService" style="font-size: 15px; font-weight: normal; padding-left: 20px;"><input type="checkbox" id="agree" style="width: 15px;" required> 약관동의</label></td>
	                    </tr>
	                    <tr>
	                    	<td>개인정보처리방침</td>
	                    	<td><textarea class="form-control" disabled style="height: 90%; resize:none; height:150px">
펫팔 주식회사가 운영하는 펫팔()이하 ‘회사’)(은)는 개인정보 보호법 제30조에 따라 정보주체(고객)의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다.

**1. 개인정보의 처리목적**
회사는 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다. – 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급․배송 등

**2. 개인정보의 처리 및 보유기간**
① 회사는 정보주체로부터 개인정보를 수집할 때 동의받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.
② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다. – 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지 – 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년

**3. 개인정보의 제3자 제공**
회사는 정보주체의 별도 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우 외에는 개인정보를 제3자에게 제공하지 않습니다.

**4. 개인정보처리위탁**
더 편리하고 나은 서비스를 제공하기 위해 업무 중 일부를 외부에 위탁하고 있습니다.

**5. 정보주체와 법정대리인의 권리․의무 및 행사방법**
정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다. 개인정보 열람요구 개인정보에 오류 등이 있을 경우 정정 요구 삭제요구 처리정지 요구

**6. 처리하는 개인정보 항목**
회사는 다음의 개인정보 항목을 처리하고 있습니다.
– 회원가입 시: 성명, 생년월일, 주소, 전화번호, 휴대전화번호, 성별, 이메일 주소
– 뉴스레터 구독 시: 이메일 주소
– 컴백홈 서비스 이용 시: 성명, 생년월일, 주소, 전화번호, 휴대전화번호, 성별, 이메일 주소
– 동물등록 진행 시: 성명, 생년월일, 주민등록번호, 주소, 전화번호, 휴대전화번호, 성별, 이메일 주소 (단, 주민등록번호는 동물등록 접수 완료 후 파기됩니다)

**7. 개인정보의 파기**
①  회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.
② 회사는 다음의 방법으로 개인정보를 파기합니다. 전자적 파일 : 파일 삭제 및 디스크 등 저장매체 포맷 수기(手記) 문서 : 분쇄하거나 소각

**8. 개인정보의 안전성 확보조치**
회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다. 관리적 조치 : 내부관리계획 수립․시행, 직원․종업원 등에 대한 정기적 교육 기술적 조치 : 개인정보처리시스템(또는 개인정보가 저장된 컴퓨터)의 비밀번호 설정 등 접근권한 관리, 백신소프트웨어 등 보안프로그램 설치, 개인정보가 저장된 파일의 암호화 물리적 조치 : 개인정보가 저장․보관된 장소의 시건, 출입통제 등

**9. 개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항**
① 회사는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠기(cookie)’를 사용합니다.
② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
가. 쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.
나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.

**10. 개인정보 보호책임자**
회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제를 처리하기 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.

**11. 개인정보 처리방침 변경**
이 개인정보 처리방침은 2018. 7. 3.부터 적용됩니다.
							</textarea></td>
	                    	<td style="vertical-align:bottom;"><label name="privacyPolicy" style="font-size: 15px; font-weight: normal; padding-left: 20px;"><input type="checkbox" id="agree" style="width: 15px;" required> 약관동의</label></td>
	                    </tr>
					</table>
					
                <div style="margin: 0px auto; text-align: center; margin-bottom: 50px; margin-top: 10px;">
	                <p><input type="submit" id=btnSubmit  value="회원가입"></p>
                </div>
	           	</form>
     		</section>
                

<!-- 회원가입 유효성 검사: 알럿창 -->
<!-- 아이디 중복 스크립트 -->
	<script>
		function duplicationCheck(){
			
			var idCheck = document.getElementById("userId");
			
			var userId = $('#userId').val();
			console.log(userId);
			if(userId == ''){
				alert('아이디를 입력해주세요.');
				$("#hiddenMessage").css("display", "none");
				idCheck.value = "";
	            idCheck.focus();
				return;
			}
			
			/* userId 유효성 검사 */
			var idRegExp = /^[a-zA-z0-9]{4,12}$/; //4~12자의 영문 대소문자와 숫자
			
	        if (!idRegExp.test(userId)) {
	        	
	            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	            $("#hiddenMessage").css("display", "none");
	            idCheck.value = "";
	            idCheck.focus();
	            return false;
	            
	        } else {
			$.ajax({
				url:"${pageContext.servletContext.contextPath}/user/registIdChk",
				type:"post",
				data:{userId:userId},
				success:function(data){
					
					console.log(data);
					
					status = $("#hiddenMessage").css("display");
					console.log(status);
					
					if (data == "fail"){

						if(status == "none" ){
							$("#hiddenMessage").css("display", "");
						}
						
						$("#checkMessage").html("사용할 수 없는 아이디입니다.");
						idCheck.value = "";
			            idCheck.focus();
						return;

					} else if(data == "success") {
						
						if(status == "none"){
							$("#hiddenMessage").css("display", "");
						}
						
					    $("#checkMessage").html("사용 가능합니다.");
					    $("#idCheck").attr("value","success");
					    console.log(idCheck);
					   
					    return;
					}
				}, error:function(data){
					console.log(data);
				}
			});
			return false;
	        }

		}	
	</script>

<!-- 닉네임 중복 스크립트 -->
	<script>
		function duplicationNickCheck(){
			
			var nameCheck = document.getElementById("userNickName");
			var userNickName = $('#userNickName').val();
			
			console.log(userNickName);
			
			//공백체크
			if(userNickName == ''){
				alert('닉네임을 입력해주세요.');
				$("#hiddenNickMessage").css("display", "none");
				nameCheck.value = "";
				nameCheck.focus();
				return false;
			}
			
			//유효성체크
			var nickRegExp = /^[a-zA-z0-9가-힣]{2,12}$/; //2~12자의 영문 대소문자와 숫자
			
	        if (!nickRegExp.test(userNickName)) {
	        	
	            alert("닉네임에는 특수문자를 포함할 수 없습니다.\n한글, 영어 대소문자, 숫자를 사용한 2~12자리로 입력해야합니다!");
	            $("#hiddenNickMessage").css("display", "none");
	            nameCheck.value = "";
	            nameCheck.focus();
	            return false;
	        } else {
	        	//중복체크
	        	$.ajax({
					url:"${pageContext.servletContext.contextPath}/user/registNickChk",
					type:"post",
					data:{userNickName:userNickName},
					success:function(data){
						
						console.log(data);
						
						status = $("#hiddenNickMessage").css("display");
						console.log(status);
						
						if (data == "fail"){

							if(status == "none"){
								$("#hiddenNickMessage").css("display", "");
							}
							
							$("#checkNickMessage").html("사용할 수 없는 아이디입니다.");
							nameCheck.value = "";
							nameCheck.focus();
							return;

						} else if(data == "success") {
							
							if(status == "none"){
								$("#hiddenNickMessage").css("display", "");
							}
							
						    $("#checkNickMessage").html("사용 가능합니다.");
						    $("#nameCheck").attr("value","success");
						    console.log(nameCheck);
						   
						    return;
						}
					}, error:function(data){
						console.log(data);
					}
				});
				return false;
	        }
			
			
			
		}
	</script>

<!-- 이메일 중복 스크립트 -->
	<script>
		function duplicationEmailCheck(){
			
			var emailCheck = document.getElementById("userEmail");
			var userEmail = $('#userEmail').val();
			
			console.log(userEmail);
			
			//공백체크
			if(userEmail == ''){
				$("#hiddenEmailMessage").css("display", "none");
				alert('이메일을 입력해주세요.');
				return false;
			}
			
			//유효성체크
			var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
			//
			
	        if (!emailRegExp.test(userEmail)) {
	        	
	            alert("올바른 이메일 형식이 아닙니다!\n예시) petpal@gmail.com");
	            $("#hiddenEmailMessage").css("display", "none");
	            emailCheck.value = "";
	            emailCheck.focus();
	            return false;
	        } else {
	        	//중복체크
	        	$.ajax({
					url:"${pageContext.servletContext.contextPath}/user/registEmailChk",
					type:"post",
					data:{userEmail:userEmail},
					success:function(data){
						
						console.log(data);
						
						status = $("#hiddenEmailMessage").css("display");
						console.log(status);
						
						if (data == "fail"){

							if(status == "none"){
								$("#hiddenEmailMessage").css("display", "");
							}
							
							$("#checkEmailMessage").html("사용할 수 없는 이메일입니다.");
							emailCheck.value = "";
							emailCheck.focus();
							return;

						} else if(data == "success") {
							
							if(status == "none"){
								$("#hiddenEmailMessage").css("display", "");
							}
							
						    $("#checkEmailMessage").html("사용 가능합니다.");
						    $("#emailCheck").attr("value","success");
						    console.log(emailCheck);
						   
						    return;
						}
					}, error:function(data){
						console.log(data);
					}
				});
				return false;
	        }
			
			
			
		}
	</script>
<!-- 중복체크 없는 값들 유효성 검사 스크립트 -->
<script>

	function validate(){
		
		/* userId 중복체크 확인 */
		var idCheck = document.getElementById("idCheck");
		if(idCheck.value != "success"){
			alert("아이디 중복체크를 완료해주세요.");
			userId.focus();
			return false;
		}
		
		/* userNickName 중복체크 확인 */
		var nickCheck = document.getElementById("nameCheck");
		if(nickCheck.value != "success"){
			alert("닉네임 중복체크를 완료해주세요.");
			userNickName.focus();
			return false;
		}
		
		/* userEmail 중복체크 확인 */
		var nickCheck = document.getElementById("emailCheck");
		if(nickCheck.value != "success"){
			alert("이메일 중복체크를 완료해주세요.");
			userEmail.focus();
			return false;
		}

	   /* userPwd 유효성 검사 */	
	  	var password1RegExp = /^[a-zA-z0-9]{4,12}$/;
	  	var pwd = $('#userPwd').val();
	  	var pwdCheck = $('#userPwdCheck').val();
	  	var id = $('#userId').val();
	  	
	  	//비밀번호가 영대소문자 4~12가 아닐때
		if (!password1RegExp.test(pwd)) {
	        alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	        console.log("userPwd 유효성체크");
	        userPwd.focus();
	        userPwd.value = "";
	        return false;
	    }
		
		//비밀번호가 비밀번호확인과 일치하지 않을때
		if (pwd != pwdCheck) {
		    alert("비밀번호가 일치하지 않습니다!");
		    userPwdCheck.focus();
		    userPwdCheck.value = "";
		    return false;
		}
		
		//아이디와 비밀번호가 같을 때..
        if (id == pwd) {
            alert("아이디와 비밀번호가 일치합니다. 아이디 또는 비밀번호를 변경해주세요!");
            userPwd.value = "";
            userPwdCheck.value = "";
            userPwd.focus();
            return false;
        }
		
		/* userName 유효성 검사 */
        var nameRegExp = /^[가-힣]{2,4}$/;
	  	var name = $('#userName').val();
		
	  	if (!nameRegExp.test(name)) {
            alert("이름이 올바르지 않습니다.\n이름은 2글자에서 4글자 형식의 한글이어야 합니다.\n예외적 이름이신 분들은 홈페이지 아래의 전화번호로 연락부탁드립니다.");
            return false;
        }
        
	  	/* userPhone 유효성 검사 */
	  	var phoneRegExp = /^01[016789]-[0-9]{3,4}-[0-9]{4}$/;
	  	var phone = $('#userPhone').val();
	  	
	  	if(!phoneRegExp.test(phone)){
	  		alert("전화번호가 올바르지 않습니다.\n전화번호는 01?-[4자리 숫자]-[4자리 숫자] 형식으로 작성하셔야 합니다.\n 예시) 010-[4자리숫자]-[4자리숫자]")
	  	}
	}
</script>


            <!-- 푸터 -->
<jsp:include page="../user/common/footer.jsp"/>
</body>
            
</html>













