<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 상세 페이지</title>
<style>
.table>tr>td{
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../../admin/common/header.jsp"></jsp:include> 
	
	<!-- sidebar start -->
	<nav class="col-sm-3 sidenav" style="
      position: fixed;
      width: 200px;
      height: 100%;
      margin-left: -20px;
      text-align:center;
      color:#25213b">
      <ul class="nav nav-pills nav-stacked">
        <li><a href="${ pageContext.servletContext.contextPath }/views/admin/main/report.jsp">신고 게시판</a></li>
        <hr>
        <li class="active1"><a href="${ pageContext.servletContext.contextPath }/views/admin/main/ask_board.jsp">문의 게시판</a></li>
      </ul>
    </nav>
    <!-- sidebar end -->
    
	 <section id="product" class="product">

		<div class="container">		
				<div class="row">
					 <div class="col-md-25">
                                    <!-- Nav tabs -->
                             <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" style="font-weight:800; margin-bottom:12px; font-size:25px; color:black">문의 상세 페이지</li>
                             </ul>
                               <a href="${ pageContext.servletContext.contextPath }/views/admin/main/ask_board.jsp"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>
                            <div class="tab-content" style="padding-top: 15px;">
                                <div role="tabpanel" class="tab-pane active" id="profile">	
                                	<div class="col-md-10">
		                                 <table class="table">
		                                 <tr>
		                                    <th scope="col-md-3" style="border: none; width: 150px;">문의한 아이디</th>
		                                    <td style="border: none;">judy123</td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">문의한 유저 이름</th>
		                                    <td style="border: none;"></td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">문의 글제목</th>
		                                    <tdstyle="border: none;"></td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">문의 일자</th>
		                                    <td style="border: none;"></td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col">문의 내용</th>
		                                    <td>아님 우리포맷 싫다 그럼 업체가 작성해서 주면 관리자가 검토 후 글을 올리는거지아님 우리포맷 싫다 그럼 업체가 작성해서 주면 관리자가 검토 후 글을 올리는거지아님 우리포맷 싫다 그럼 업체가 작성해서 주면 관리자가 검토 후 글을 올리는거지</td>
		                                 </tr>
		                            </table>
			           	
				           	 </div>	                       
                        	<br>
                        	<br>
                        	<br>
                            </div>  
                </div>        
          </div> 
                      	<div class="container">		
				<div class="row">
                   <!-- 심사상태 : 대기일 때 -->   
                   <!--관리자 심사 폼 시작 -->
                 <div class="col-md-12">
                         <hr>
                   <form action="">
	               <!-- 광고 심사 사유 입력 -->
                   <div class="form-group">
                   		<label for="writer" class="col-sm-2 control-label" style="font-size:20px; font-weight:bold;">관리자 답변: </label>
	                   <div class="col-sm-10">
                        <textarea class="form-control" name="message" rows="5" placeholder="문의에대한 댓글을 입력해주세요." required="" style="margin-bottom:3%;"></textarea>
		               </div>
		               <div class="form-group col-sm-3"  style="float:right;">
		               	<button type="submit" class="btn btn-primary btn-sm" style="border-radius:10px;"]>문의 댓글 등록</button>
		               </div>
                   </div>   	
	               </form>
	               </div>
                            	</div>
                            </div>
       
                </div>        
          </div>              
      </section><!-- End off Product section -->
	

	<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
</body>
</html>