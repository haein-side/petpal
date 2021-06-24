<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
     <style>
       .table > thead > tr > th {
       text-align: center;
       }
       
        .table > tbody > tr > th {
       text-align: center;
       }
       
       #add {
       border-radius:10px; float:right; margin-right:0px; margin-left:15px; background: white; border:1px solid green; color:green;
       }
       
       #check{
       margin-bottom:10%; margin-top:10%; border-radius:10px; float:right; margin-left:15px; background: white; border:1px solid red; color:red;
       }
       
       </style>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">

        <div class="culmn">
            
            <!-- 헤더  시작 -->
			<jsp:include page="../../admin/common/header.jsp"></jsp:include>
			<!-- 헤더 끝 --> 
			
			 <!-- 바디 시작 -->
             <section>
           		<!-- 큰 컨테이너 시작 -->
                <div class="container" style="padding-bottom:10%">
             			<!-- 제목 -->
                        <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" style="font-weight:800; margin-bottom:12px; font-size:25px; color:black">관리자 정보 등록하기</li>
                             </ul>
                               <a href="${ pageContext.servletContext.contextPath }/views/admin/main/adminList.jsp"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>
                        <!-- 작은 컨테이너 시작 -->
                        <div class="container" style="padding-top:15px;">
                        
                        <form>
                              <div class="form-group">
                                <label for="cname" class="col-lg-2">아이디</label>
                              	<div class="col-lg-10">
	                                  <input class="form-control" id="name" name="name"  type="text"  value=""></input>
	                            </div>
                              </div>
                              
                              <!-- 중복확인 버튼 -->
                                <div class="col-lg-12">
                                 <div class="col-lg-10"></div>
                                 <div class="col-lg-2" style="padding-right:0px"><button class="btn text-center" id="check" style="">중복확인</button></div>
                                </div>
                                
                              <div class="form-group">
	                              <label for="cname" class="col-lg-2">이름</label>
	                                <div class="col-lg-10">
	                                  <input class="form-control" id="name" name="name"  type="text"  value="" style="margin-bottom:3%"></input>
	                                </div>
                               </div>
                               
                               <div class="form-group">
	                              <label for="cname" class="col-lg-2">이메일</label>
	                                <div class="col-lg-10">
	                                  <input type="email" class="form-control" id="email" name="email"  type="text"  value="" style="margin-bottom:3%"></input>
	                                </div>
                               </div>
                              
                               <div class="form-group">
	                              <label for="cname" class="col-lg-2">권한</label>
	                                <div class="col-lg-10">
		                                <ul>
		                                <li class="col-lg-6">
		                                  	<label for="priv" class="col-lg-3">
										    	대표관리자
										  	</label>
		                              		<input class="radio-inline" type="radio" name="priv" id="priv" style="margin-bottom:6%">
		                              	</li>
		                              	<li class="col-lg-6">
		                              		<label for="priv" class="col-lg-3">
										    	서브관리자
										  	</label>
		                              		<input class="radio-inline" type="radio" name="priv" id="priv" style="margin-bottom:6%">
		                              	</li>
		                              	</ul>
	                                </div>
                              	</div>
                         	 
                               <div class="form-group">
	                              <label for="cname" class="control-label col-lg-2">비밀번호</label>
	                                <div class="col-lg-10">
	                                  <input type="password" class="form-control" id="pwd" name="pwd"  type="text"  value="" style="margin-bottom:3%"></input>
	                                </div>
                               </div>
                               
                               <div class="form-group">
	                              <label for="cname" class="control-label col-lg-2">휴대폰번호</label>
	                                <div class="col-lg-10">
	                                  <input class="form-control" id="phoneNum" name="phoneNum"  type="text"  value="" style="margin-bottom:3%" placeholder="예시) 010-3489-2872"></input>
	                                </div>
                               </div>
                               
                               <!-- 등록하기 버튼 -->
                                <div class="col-lg-12">
                                 <div class="col-lg-10"></div>
                                 <div class="col-lg-2" style="padding-right:0px">
                                 <button type="submit" class="btn text-center" id="add">등록하기</button></div>
                                </div>
                                
		                            
                               
                        </form>
                        
                     
                        </div><!-- 작은 컨테이너 끝 -->
                </div><!-- 큰 컨테이너 끝 -->
            </section><!-- 바디 끝 -->
			
			<!-- 푸터 시작 -->
            <footer>
       			<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
            </footer>
			<!-- 푸터 끝 -->



        </div>

     
</html>