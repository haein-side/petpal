<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            a > img {
                width: 50%;
                height: 50%;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: 15px;
                margin-right: 15px;
                text-align: center;
            }
            img {
                width: 600px;
                height: 600px;
                margin-bottom: 90px;
/*                 margin-left: 30px;
                margin-right: 30px; */
                text-align: center;
            }
            .sendmessage > input {
                width: 1000px;
                height: 50px;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
                margin-bottom: 50px;
                margin-left: 80px;
            }
            .sendmessage > button {
                background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 10%;
                height: 45px; 
                font-size: 16px; 
                font-weight: 600;
                border-radius: 10px;
                margin-left: 2%;
            }
            .sendmessage > input::placeholder {
                color:#45B99C;
            }
            /* 이미지 콜라주 */
			/* 이미지 크기는 최대로 그냥 두고 span에 너비를 지정해서 사용.*/
			.imgCollage { margin:auto; text-align: center; }
			@media screen and (min-width: 768px) {	
				.imgCollage { 
					display:flex; -webkit-flex:auto; -moz-display:flex; -ms-display:flex; 
					flex-wrap:wrap; -webkit-flex-wrap:wrap; -moz-flex-wrap:wrap; -ms-flex-wrap:wrap; 
				}
				.imgCollage > span { padding: 4px; } 
				.imgCollage > span > .imageblock:not(:last-child) { vertical-align: baseline; } 
			    .imgCollage .imageblock { padding:0; } 
				.imgCollage img { box-shadow: none; }
			}
			@media screen and (max-width: 767px) { 
				.imgCollage > span { padding: 0; width: 100% !important; }  
				.imgCollage .imageblock { padding: 16px 0; } 
				.imgCollage  > span:first-of-type .imageblock:first-of-type { padding-top: 8px; }
				.imgCollage  > span:last-of-type .imageblock:last-of-type { padding-bottom: 4px; }
			}
			/* 이미지 콜라주  끝 */
			
			.overlay {
  				position: fixed;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				background: rgba(0, 0, 0, 0.7);
				transition: opacity 500ms;
				visibility: hidden;
				opacity: 0;
				z-index: 900;
				height: 150% !important;
			}
			.overlay:target {
				visibility: visible;
				opacity: 1;
			}
			.popup {
				position: fixed;
				width: 60%;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
				-webkit-transition: opacity .5s, visibility 0s linear .5s;
				transition: opacity .5s, visibility 0s linear .5s;
				z-index: 1;
			}
			.popup:target {
				visibility: visible;
				opacity: 1;
				-webkit-transition-delay: 0s;
				transition-delay: 0s;
			}
			.popup-close {
				position: absolute;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
			}
			.popup .close {
				position: absolute;
				right: 5px;
				top: 5px;
				padding: 5px;
				color: #000;
				transition: color .3s;
				font-size: 2em;
				line-height: .6em;
			}
			.popup .close:hover {
				color: #007a5c;
			}
            .btn_submit, .certification {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
            }
            
            .findpwd-content > div {
                margin: 0px auto;
            }
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

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


        <div class="culmn">
            <!--Home page style-->
            <jsp:include page="../common/userHeader.jsp"/>
            <!--Home Sections-->
			<section>
				<%-- <div class="port_img" style="float: left;">
                   <img src="${ pageContext.servletContext.contextPath }/resources/images/work-img1.jpg" alt="" />
                </div> --%>
                <div class="imgCollage" style="display: flow-root;"> 
                		<span style="width: 30%"><img src="${ pageContext.servletContext.contextPath }/resources/images/work-img1.jpg" alt="" /></span> 
                		<span style="width: 30%"><img src="${ pageContext.servletContext.contextPath }/resources/images/work-img1.jpg" alt="" /></span> 
                </div>
                <div class="imgCollage" style="display: flow-root;"> 
                		<span style="width: 30%"><img src="${ pageContext.servletContext.contextPath }/resources/images/work-img1.jpg" alt="" /></span> 
                		<span style="width: 30%"><img src="${ pageContext.servletContext.contextPath }/resources/images/work-img1.jpg" alt="" /></span>
                </div>
			</section>
			
            <section id="boradtable" class="boradtable">
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="container">
                        <div class="row">
                        	<div style="width: 600px;">
                	<h2 style="background-color: orange; width: 130px; border-radius: 8px; height: 60px; color: white; font-weight: bold; padding-top: 10px;" align="center">
                	대기중
                	</h2>
                	<button>수정하기</button>
                	<button>삭제하기</button>
                	<!-- 상태 값에 따른 c:if 처리 -->
                	<!-- <h2 style="background-color: #FF6230; width: 130px; border-radius: 8px; height: 60px; color: white; font-weight: bold; padding-top: 10px;" align="center">
                	완료
                	</h2> -->
                	<!-- <button style="background-color: #A91919; width: 100px; border-radius: 8px; height: 40px; color: white; font-weight: bold; padding-top: 5px; ">
                	신고하기
                	</button> -->
                </div>
                <div>
                	<ul style="font-size: large;">
                		<li>작성자 : 
                		<b>QlQlfl</b>
                		<img src="${ pageContext.servletContext.contextPath }/resources/images/message icon.png" alt="" style="height: 50px; width: 50px; margin-top: 0px; margin-bottom: 0px; margin-left: 0px; cursor:pointer;"/>
                		<img onclick="location.href='#reportPost'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="height: 50px; width: 50px; margin-top: 0px; margin-bottom: 0px; margin-left: 0px; cursor:pointer;">
                		</li>
                	</ul>
                </div>
                <div align="center" style="height: 150px;">
                	<h1 style="font-weight: bold;">차이니즈 크레스티드 / 수컷  <br> 3살 / 14KG / 커피색</h1>
                </div>
                <div align="center">
                <pre style="width: 1000px; white-space: pre-wrap; background-color: white; border: 0px; font-size: 20px;">
소심하지만 사람을 좋아하는 아이입니다. 부디 이 아이의 평생 가족을 찾을 수 있게 해주세요. 
현재 곰팡이 질환을 앓고 있어요 지금 치료중이지만 피부가 약해진 아이니 꼭 유의해주셔야해요
						
입양신청때 제가 더 필요로 하는 서류가 있어서 모두 충족시킬 수 있는 책임감 있으신 분을 찾고있어요!
                </pre>
                </div>
                <div align="center" style="margin-bottom: 70px;">
                <!-- 현재 로그인 되어 있는 사용자에 따라서 다르다. c:if처리 -->
                <!-- 작성자가 입양완료 버튼을 눌렀다면 상태값이 변하고 상태값에 따라 버튼이 보이기도 하고, 보이지 않기도 한다. -->
                	<button onclick="location.href='#agreeAction'"
		                style="background-color: #45B99C; border: 0px; border-radius:10px; width:250px; margin-left:10px;">
		                	<h3 style="color: white; padding-top: 10px; font-weight: bold;">입양하기</h3>
                	</button>
             <div align="center" style="margin-top: 20px;">
            	<a href="${ pageContext.servletContext.contextPath }/resources/files/dog.docx" download><h3><b>강아지 입양 신청서 다운로드</b></h3></a>
            	<br>
            	<a href="${ pageContext.servletContext.contextPath }/resources/files/cat.docx" download><h3><b>고양이 입양 신청서 다운로드</b></h3></a>
            </div>
                	<!-- <button  
		                style="background-color: #FF6230; border: 0px; border-radius:10px; width:250px; margin-left:10px;">
		                	<h3 style="color: white; padding-top: 10px; font-weight: bold;">입양완료</h3>
                	</button> -->
                </div>
                        </div>
                    </div>
                </div>
            </div>
            </section>

            <section id="boradtable" class="boradtable">
            	<div class="carousel-inner" role="listbox">
                	<div class="item active">
                    	<div class="container">
                        	<div class="row">
                            	<table class="table" style="margin-bottom: 50px;">
				                    <tbody>
				                        <tr>
				                            <td style="text-align: center;">펫파파</td>
				                            <td>좋은일을 하시다니 대단하신 거 같습니다!</td>
				                            <td style="text-align: center;">2021-06-22</td>
				                            <td><img onclick="location.href='#reportComment'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px; height: 25px; margin-bottom: 0px; cursor:pointer;"></td>
				                        </tr>
				                        <tr>
				                            <td style="text-align: center;">유기농간식</td>
				                            <td style="width: 500px;">아이가 많이 귀엽네요</td>
				                            <td style="text-align: center;">2021-06-23</td>
				                             <td><img onclick="location.href='#reportComment'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px; height: 25px; margin-bottom: 0px; cursor:pointer;"></td>
				                        </tr>
				                        <tr>
				                            <td style="text-align: center;">삐띠딕</td>
				                            <td>새 가족을 꼭 찾길 바랄게요!</td>
				                            <td style="text-align: center;">2021-06-23</td>
				                             <td><img onclick="location.href='#reportComment'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px; height: 25px; margin-bottom: 0px; cursor:pointer;"></td>
				                        </tr>
				                        <tr>
				                            <td style="text-align: center;">Qododor</td>
				                            <td>아이구야 힘내세요</td>
				                            <td style="text-align: center;">2021-06-23</td>
				                             <td><img onclick="location.href='#reportComment'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px; height: 25px; margin-bottom: 0px; cursor:pointer;"></td>
				                        </tr>
				                        <tr>
				                            <td style="text-align: center;">Backgu</td>
				                            <td>멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍멍</td>
				                            <td style="text-align: center;">2021-06-23</td>
				                             <td><img onclick="location.href='#reportComment'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px; height: 25px; margin-bottom: 0px; cursor:pointer;"></td>
				                        </tr>
				                        <tr>
				                        	<td style="text-align: center;"> </td>
				                            <td>삭제 된 댓글입니다.</td>
				                            <td style="text-align: center;"> </td>
				                            <td></td>
				                        </tr>
				                    </tbody>
				                </table>
				                <div class="text-center">
									<ul class="pagination">
										<li><a href="#"><</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">></a></li>
									</ul>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
             	<p style="margin-left: 380px; font-weight: bold; font-size: 20px;">
             	삐비디딕
             	</p>
             <section id="sendmessage" class="sendmessage" style="width: 70%; margin: 0px auto;">
                <input type="text" id="messagecontent" placeholder="  댓글로 임시보호자님을 응원해주세요!" >
                <button class="sendmessagecontent">댓글 작성</button>
            </section>
         </section>
            <!-- 게시글 신고 팝업창 -->
            <div id="reportPost" class="overlay">
                <div class="popup">
                    <a href="#none" class="close">&times;</a>
                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">게시글 신고</p>
                    <div class="findpwd-content" id="contStep02" style="display: block;">
                        <div class="cont-step_preface">
                            <hr style="border:0.5px solid #A8A8A8;">
                        </div>
                        <!-- 신고 내용 입력 -->
                        <div style="text-align: center; margin-top: 30px; width: 80%;"><input type="text" placeholder="신고내용을 입력하세요" style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
                        <div style="text-align: center; margin-top: 30px;"><button class="btn_submit" onclick="location.href='#completeReport'">신고하기</button></div>
                    </div>
                </div>
            </div> 
            
            <!-- 댓글 신고 팝업창 -->
            <div id="reportComment" class="overlay">
                <div class="popup">
                    <a href="#none" class="close">&times;</a>
                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">댓글 신고</p>
                    <div class="findpwd-content" id="contStep02" style="display: block;">
                        <div class="cont-step_preface">
                            <hr style="border:0.5px solid #A8A8A8;">
                        </div>
                        <!-- 신고 내용 입력 -->
                        <div style="text-align: center; margin-top: 30px; width: 80%;"><input type="text" placeholder="신고내용을 입력하세요" style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
                        <div style="text-align: center; margin-top: 30px;"><button class="btn_submit" onclick="location.href='#completeReport'">신고하기</button></div>
                    </div>
                </div>
            </div> 
            
             <!-- 신고 완료 팝업창 -->
            <div id="completeReport" class="overlay">
                <div class="popup">
                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
                     	신고가 정상적으로 접수되었습니다.<br>
                    </p>
                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
                     	신고에 대한 처리는 1~2일 소요될 수 있으며<br>
                     	신고 내역에서 확인 가능합니다.
                    </p>
                        <div style="text-align: center; margin-top: 30px;"><button class="btn_submit" onclick="location.href='#none'">확인</button></div>
                    </div>
                </div>
            </div> 
            
            <!-- 입양약관 팝업창 -->
            <div id="agreeAction" class="overlay">
                <div class="popup">
                    <a href="#none" class="close">&times;</a>
                    <h3 style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px; color: #19A985; font-weight: bold;">입양하기로 결정하셨나요?</h3>
                    <h3 style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px; color: #19A985; font-weight: bold;">아래의 약관 동의를 <b style="color: red;">반드시 읽어주세요!</b></h3>
                    <h3 style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px; color: #19A985; font-weight: bold;">읽지 않은 불이익은 책임지지 않습니다.</h3>
                    <div class="findpwd-content" id="contStep02" style="display: block;">
                        <div class="cont-step_preface">
                            <hr style="border:0.5px solid #A8A8A8;">
                        </div>
                        <!-- 약관 내용 -->
                        <div>
                        	<pre style="height: 300px; background-color: white; white-space: pre-wrap;">
목적
입양의 목표는 임시 보호중인 동물들에게 평생 함께 할 수 있는 가정을 찾아주는 것입니다.

반드시 숙지해야 할 상황
입양할 동물들의 건강과 특성과 행동은 환경과 상황에 따라 달라집니다. 따라서 입양은 주의 사항들을 동반합니다. 부디 아래에 적힌 주의사항들을 고려하시기 바랍니다. 펫팔은 임시보호자와 입양신청자가 만날 수 있는 공간을 제공하는 곳입니다. 개인정보 악용으로 인한 책임은 지지 않습니다. 

입양된 반려동물이 입양자의 소유물을 망가뜨릴 수도 있습니다. 
입양된 반려동물로부터 사람들이나 다른 반려동물이 질병이 노출 될 수도 있습니다. 
입양된 반려동물로부터 사람들이나 다른 반려동물이 상해를 입을 수 있습니다.
입양한 동물이 너무 일찍 죽을 수도 있습니다. 

입양 과정
1. 입양신청자는 성인이어야 하며 모든 가족구성원들이 입양에 찬성, 동의를 해야합니다. 또한 자가 주택이 아닌 경우 집주인의 동의 또한 얻어야 합니다. 임시보호자가 이러한 동의를 서명한 계약서를 요청 할 수도 있습니다.  또한 임시보호자는 동물을 입양하는데 적합하지 않다고 판단되는 신청자들을 거절할 권리가 있습니다. 
 
2. 입양신청자는 신청서를 잘 작성하신 후에 임시보호자가 입양홍보글에 제공한 정보를 통해 직접 연락을 합니다. 이후 입양보호자의 판단에 의해 입양 여부가 결정됩니다. 입양 전 테스트기간동안에 반려동물은 임시보호자의 소속입니다. 

3. 임시보호자의 판단 기간이 끝난 후에 그 동물을 입양하기를 원하시면 계약서에 서명하시고 임시보호자가 입양 비용 조건을 걸었다면 입양 비용을 지불해야 합니다. (단, 임시보호자는 일정 기간 이후 입양자가 다시 반려동물을 파양하지 않았다면 환불해줘야 합니다. 이는 개인과 개인의 거래이므로 펫팔은 책임지지 않습니다.) 모든 단계가 완료되면 반려동물의 소속이 입양자에게로 이전됩니다.

4. 입양 후일 안에 동물병원에 입양한 동물을 데려가셔서 검사 받으시길 권합니다.

5. 펫팔의 입양 방침 동의서 외에 임시보호자가 다른 서류를 요구할 수 있습니다. 입양신청자는 이에 서류를 따른 작성해야 합니다.

입양 후
1. 임시보호자들이 입양자에게 가끔 연락하여 입양된 반려동물이 어떻게 지내고 있는지 소식을 요청할 수 있습니다. 입양된 동물이 새로운 가정에서 잘 적응하고 지내기를 바랍니다. 

2. 입양신청서에 명시되어 있듯이 고양이나 개에게 미용을 목적으로 하는 발톱 제거 수술, 꼬리 절제 수술, 귀의 일부를 잘라내는 수술, 성대 제거 수술, 힘줄 절제술 등을 불필요한 수술을 해서는 안 됩니다.

3. 만약 입양자가 입양한 동물을 파양 하기 바란다면 전 임시보호자의 동의 없이 다른 사람에게 입양 보내시는 안 됩니다. 파양 하는 동물은 다시 전 임시보호자에게 돌아가야 합니다. 또한 그 과정에서 발생한 비용은 모두 본인이 부담해야 합니다. 

5. 파양시 입양비 환불은 불가합니다.
                        	</pre>
                        </div>
                        <!-- 동의 버튼 -->
                        <div align="center">
                        <input type="checkbox" name="pointCheck"><b style="margin-left: 10px;">위의 약관사항을 모두 읽었으며, 이에 따른 방침에 모두 동의합니다.</b>
                        <br><br>
                        <button style="background-color: #19A985; border: 0px; width: 300px; border-radius: 7px;" onclick="checkbox_Check();">
                       		<h3 style="color: white; font-weight: bold; margin-top: 10px;">가족 만나러 가기</h3>
                        </button>
                        </div>
                    </div>
                </div>
            </div> 
            <script>
			    function checkbox_Check(){
			        if ($("input:checkbox[name=pointCheck]").is(":checked") == true) {
			        	location.href='#agreeAfter';
			        } else {
			        	alert("약관에 동의해주셔야합니다.");
			                
			        }
			    }
			</script>
            
            <!-- 동의완료 팝업창 -->
            <div id="agreeAfter" class="overlay">
                <div class="popup">
                    <p style="font-size: 25px; text-align: center; font-weight:bold; margin-top: 50px;">
                     	임시보호자분이 남기신 연락처입니다.<br>
                    </p>
                    
                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
                     	연락처 : 010-2134-2352<br><br>
                     	연릭시 주의사항 : 밤 8시 이후에는 문자주세요
                    </p>
                    <div style="text-align: center; margin-top: 30px;"><button class="btn_submit" onclick="location.href='#none'">확인</button></div>
                    </div>
                </div>
            
            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
            <jsp:include page="../common/footer.jsp"/>
            

        <!-- JS includes -->

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/bootstrap.min.js"></script>

        <script src="${ pageContext.servletContext.contextPath }/resources/js/owl.carousel.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.magnific-popup.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.easing.1.3.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.collapse.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/bootsnav.js"></script>



        <script src="${ pageContext.servletContext.contextPath }/resources/js/plugins.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>
</html>