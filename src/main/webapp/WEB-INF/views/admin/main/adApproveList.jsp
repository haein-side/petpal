<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
       <head>
       <style>
        .table > tbody > tr > th {
       text-align: center;
       }
       
	   #outter {
		display: block;
		width: 60%;
		margin: auto;
	   }
       </style>
       
     <script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="adApproveList?nowPage=${paging.nowPage}&cntPerPage="+sel;
		}
	 </script>
	
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">

        <div class="culmn">
        
           
            
            <!-- 헤더  시작 -->
			<jsp:include page="../../admin/common/header.jsp"></jsp:include>
			<!-- 헤더 끝 --> 
	
			<!-- sidebar start -->
			<nav class="col-sm-3 sidenav" style="
		      position: fixed;
		      width: 200px;
		      height: 100%;
		      margin-left: -20px;
		      text-align:center;
		      color:#25213b">
		      <ul class="nav nav-pills nav-stacked">
		        <li class="active1"><a href="adApproveList">광고 심사</a></li>
		        <hr>
		        <li><a href="adList">광고 관리</a></li>
		      </ul>
		    </nav>
		    <!-- sidebar end -->
				
				
             <!-- 광고 심사 바디 시작 -->
             <section>
                <div class="container" style="padding-bottom:10%">
                   
                        <div class="head_title text-left fix">
                            <h2 class="text-uppercase">광고 심사</h2>
                        </div>
                        
                        <ul class="nav nav-tabs" role="tablist">
                        				 <c:if test="${ empty category }">
	                        				<li role="presentation" class="active"><a onclick="location.href='adApproveList?nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="all" role="tab" data-toggle="tab">All</a></li>
	                                        <li role="presentation"><a onclick="location.href='adApproveList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">대기</a></li>
	                                        <li role="presentation"><a onclick="location.href='adApproveList?category=2&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="messages" role="tab" data-toggle="tab">승인</a></li>
	                                        <li role="presentation"><a onclick="location.href='adApproveList?category=3&nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="messages" role="tab" data-toggle="tab">거절</a></li>
                                         </c:if>
                                         <c:if test="${ category eq 1 }">
	                                        <li role="presentation"><a onclick="location.href='adApproveList?nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="all" role="tab" data-toggle="tab">All</a></li>
	                                        <li role="presentation" class="active"><a onclick="location.href='adApproveList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">대기</a></li>
	                                        <li role="presentation"><a onclick="location.href='adApproveList?category=2&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="messages" role="tab" data-toggle="tab">승인</a></li>
	                                        <li role="presentation"><a onclick="location.href='adApproveList?category=3&nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="messages" role="tab" data-toggle="tab">거절</a></li>
                                   		 </c:if>
                                   		 <c:if test="${ category eq 2 }">
	                                        <li role="presentation"><a onclick="location.href='adApproveList?nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="all" role="tab" data-toggle="tab">All</a></li>
	                                        <li role="presentation"><a onclick="location.href='adApproveList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">대기</a></li>
	                                        <li role="presentation" class="active"><a onclick="location.href='adApproveList?category=2&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="messages" role="tab" data-toggle="tab">승인</a></li>
	                                        <li role="presentation"><a onclick="location.href='adApproveList?category=3&nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="messages" role="tab" data-toggle="tab">거절</a></li>
                                   		 </c:if>
                                   		 <c:if test="${ category eq 3 }">
	                                        <li role="presentation"><a onclick="location.href='adApproveList?nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="all" role="tab" data-toggle="tab">All</a></li>
	                                        <li role="presentation"><a onclick="location.href='adApproveList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">대기</a></li>
	                                        <li role="presentation"><a onclick="location.href='adApproveList?category=2&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="messages" role="tab" data-toggle="tab">승인</a></li>
	                                        <li role="presentation" class="active"><a onclick="location.href='adApproveList?category=3&nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="messages" role="tab" data-toggle="tab">거절</a></li>
                                   		 </c:if>		
                                   		<p style="float:right;">총 광고 수 : ${ requestScope.total }개</p>
                                    </ul>
							<div class="container-fluid" style="margin-top: 15px;">
								    
								<!-- 검색폼 시작 -->					    
								<form action="adApproveList/search" method="post" class="d-flex">	
									<c:choose>
									    <c:when test="${ !empty requestScope.searchValue }">
					   					    <select id="searchCondition" name="searchCondition" style="margin-left: -540px; margin-top: 10px;">
					   					    <!-- select 박스 -->
					   					    <!-- ~를 선택했을 때 value를 넘겨줌 -->
												<option value="category" <c:if test="${requestScope.searchCondition eq 'category'}">selected</c:if>>카테고리</option>
												<option value="adCode" <c:if test="${requestScope.searchCondition eq 'adCode'}">selected</c:if>>광고코드</option>
												<option value="adTitle" <c:if test="${requestScope.searchCondition eq 'adTitle'}">selected</c:if>>광고제목</option>
											</select>
											<!-- input 값도 넘겨줌 -->
									        <input type="search" id="searchValue" name="searchValue" value="${ requestScope.searchValue }">
									    </c:when>
									    <c:otherwise>
										    <select id="searchCondition" name="searchCondition" style="margin-left: -540px; margin-top: 10px;">
												<option value="category">카테고리</option>
												<option value="adCode">광고코드</option>
												<option value="adTitle">광고제목</option>
											</select>
									        <input id="searchValue" name="searchValue" placeholder="검색어를 입력하세요" 
									        aria-label="Search"  class="form-control me-2" type="search" 
									        style="width: 300px; border-radius: 15px; background-color: #F1FAF8; float:left; height:40px; margin-left:80px;">
									    </c:otherwise>
									</c:choose>
									<button class="btn btn-outline-success" type="submit" 
									style="float: left; margin-left: 30px; width: 10px; border-radius: 50px; height:40px" >Search</button>
								</form>
						
						</div>
                        
                        <!-- 광고 심사 표 시작 -->
                        <div class="tab-content" style="padding:0px;">
                        
                        <!-- All 광고 -->
                        <%-- <c:if test="${category ne 2 }"> --%>
                         <div role="tabpanel" class="tab-pane active" id="all">
                            <table class="table table-hover" style="text-align:center;">
                                <thead>
                                 <tr>
                                    <th style="text-align:center;">광고 코드</th>
                                    <th style="text-align:center;">광고 신청자</th>
                                    <th style="text-align:center;">광고 제목</th>
                                    <th style="text-align:center;">사업자번호</th>
                                    <th style="text-align:center;">신청 일자</th>
                                    <th style="text-align:center;">심사 상태</th>
                                 </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                <c:when test="${ empty category}">
                                <c:forEach var="adApprove" items="${ requestScope.adApproveList }">
                                  <tr onclick="location.href='adApproveDetail/${ adApprove.adCode }'"> 
                                    <th scope="row">${ adApprove.adCode }</th>
                                    <td>${ adApprove.user.name }(${ adApprove.user.id })</td>
                                    <td>${ adApprove.adTitle }</td>
                                    <td>${ adApprove.companyNumber }</td>
                                    <td>${ adApprove.applyDate }</td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${ adApprove.stateCode eq 1}">
                                    			대기
                                    		</c:when>
                                    		<c:when test="${ adApprove.stateCode eq 2}">
                                    			승인
                                    		</c:when>
                                    		<c:when test="${ adApprove.stateCode eq 3}">
                                    			거절
                                    		</c:when>
                                    	</c:choose>
                                    </td>
                                  </tr>
                                 </c:forEach>
                                 </c:when>
                                 
                                 <c:when test="${ category eq 1 }">
                            	 <c:forEach var="adApprove" items="${ requestScope.adApproveList }">
                                 <c:if test="${ adApprove.stateCode eq 1 }">
	                                 <tr onclick="location.href='adApproveDetail/${ adApprove.adCode }'">
		                                    <th scope="row">${ adApprove.adCode }</th>
		                                    <td>${ adApprove.user.name }(${ adApprove.user.id })</td>
		                                    <td>${ adApprove.adTitle }</td>
		                                    <td>${ adApprove.companyNumber }</td>
		                                    <td>${ adApprove.applyDate }</td>
		                                    <td>
		                                    	 <c:choose>
		                                    		<c:when test="${ adApprove.stateCode eq 1}">
		                                    			대기
		                                    		</c:when>
		                                    	</c:choose> 
		                                    </td>
	                                  </tr>
                                </c:if> 
                                 </c:forEach>
                                </c:when>
                                
                                 <c:when test="${ category eq 2 }">
                            	 <c:forEach var="adApprove" items="${ requestScope.adApproveList }">
                                 <c:if test="${ adApprove.stateCode eq 2 }">
	                                 <tr onclick="location.href='adApproveDetail/${ adApprove.adCode }'">
		                                    <th scope="row">${ adApprove.adCode }</th>
		                                    <td>${ adApprove.user.name }(${ adApprove.user.id })</td>
		                                    <td>${ adApprove.adTitle }</td>
		                                    <td>${ adApprove.companyNumber }</td>
		                                    <td>${ adApprove.applyDate }</td>
		                                    <td>
		                                    	<c:choose>
		                                    		<c:when test="${ adApprove.stateCode eq 2}">
		                                    			승인
		                                    		</c:when>
		                                    	</c:choose> 
		                                    </td>
	                                  </tr>
                                </c:if> 
                                 </c:forEach>
                                </c:when>
                                 
                               <c:when test="${ category eq 3 }">
                            	 <c:forEach var="adApprove" items="${ requestScope.adApproveList }">
                                 <c:if test="${ adApprove.stateCode eq 3 }">
	                                 <tr onclick="location.href='adApproveDetail/${ adApprove.adCode }'">
		                                    <th scope="row">${ adApprove.adCode }</th>
		                                    <td>${ adApprove.user.name }(${ adApprove.user.id })</td>
		                                    <td>${ adApprove.adTitle }</td>
		                                    <td>${ adApprove.companyNumber }</td>
		                                    <td>${ adApprove.applyDate }</td>
		                                    <td>
		                                    	<c:choose>
		                                    		<c:when test="${ adApprove.stateCode eq 3}">
		                                    			거절
		                                    		</c:when>
		                                    	</c:choose> 
		                                    </td>
	                                  </tr>
                                </c:if> 
                                 </c:forEach>
                                </c:when>
                                 
                              
                              
                                 
                                 </c:choose>
                                </tbody>
                            </table>
                            
                            
                            
                            <div style="display: block; text-align: center;">	
				                              <div style="float: right;">
						<select id="cntPerPage" name="sel" onchange="selChange()">
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
						</select>
					</div> <!-- 옵션선택 끝 -->
                            
                            
                            	
								<c:if test="${paging.startPage != 1 }">
									<a href="adApproveList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="adApproveList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="adApproveList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
								
								
								
								
							</div>
                        </div>
                        <%-- </c:if> --%>
                        
                        <!-- 대기 클릭시 -->
                        <%-- <c:if test="${category eq 1 }"> --%>
                        <div role="tabpanel" class="tab-pane" id="wait">
                            <table class="table table-hover" style="text-align:center;">
                                <thead>
                                 <tr>
                                    <th style="text-align:center;">광고 코드</th>
                                    <th style="text-align:center;">광고 신청자</th>
                                    <th style="text-align:center;">광고 제목</th>
                                    <th style="text-align:center;">사업자번호</th>
                                    <th style="text-align:center;">신청 일자</th>
                                    <th style="text-align:center;">심사 상태</th>
                                 </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="adApprove" items="${ requestScope.adApproveList }">
                                 <tr onclick="location.href='adApproveDetail/${ adApprove.adCode }'">  
                                  <c:if test="${ adApprove.stateCode eq 1 }">
                                    <th scope="row">${ adApprove.adCode }</th>
                                    <td>${ adApprove.user.name }(${ adApprove.user.id })</td>
                                    <td>${ adApprove.adTitle }</td>
                                    <td>${ adApprove.companyNumber }</td>
                                    <td>${ adApprove.applyDate }</td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${ adApprove.stateCode eq 1}">
                                    			대기
                                    		</c:when>
                                    	</c:choose>
                                    </td>
                                    </c:if>
                                  </tr>
                                 </c:forEach>
                                </tbody>
                            </table>
                            
                             <div style="display: block; text-align: center;">	
				                              <div style="float: right;">
						<select id="cntPerPage" name="sel" onchange="selChange()">
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
						</select>
					</div> <!-- 옵션선택 끝 -->
                            
                            
                            	
								<c:if test="${paging.startPage != 1 }">
									<a href="adApproveList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="adApproveList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="adApproveList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
							</div>
                            
                        </div>
                        <%-- </c:if> --%>
                   
                   		 <!-- 승인 클릭시 -->
                   		<c:if test="${cat eq 2 }">
                        <div role="tabpanel" class="tab-pane" id="ok">
                            <table class="table table-hover" style="text-align:center;">
                                <thead>
                                 <tr>
                                    <th style="text-align:center;">광고 코드</th>
                                    <th style="text-align:center;">광고 신청자</th>
                                    <th style="text-align:center;">광고 제목</th>
                                    <th style="text-align:center;">사업자번호</th>
                                    <th style="text-align:center;">신청 일자</th>
                                    <th style="text-align:center;">심사 상태</th>
                                 </tr>
                                </thead>
                                <tbody>
                               <c:forEach var="adApprove" items="${ requestScope.adApproveList }">
                                 <tr onclick="location.href='adApproveDetail/${ adApprove.adCode }'">  
                                  <c:if test="${ adApprove.stateCode eq 2 }">
                                    <th scope="row">${ adApprove.adCode }</th>
                                    <td>${ adApprove.user.name }(${ adApprove.user.id })</td>
                                    <td>${ adApprove.adTitle }</td>
                                    <td>${ adApprove.companyNumber }</td>
                                    <td>${ adApprove.applyDate }</td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${ adApprove.stateCode eq 2}">
                                    			승인
                                    		</c:when>
                                    	</c:choose>
                                    </td>
                                    </c:if>
                                  </tr>
                                 </c:forEach>
                                </tbody>
                            </table>
                            
                             <div style="display: block; text-align: center;">	
				                              <div style="float: right;">
						<select id="cntPerPage" name="sel" onchange="selChange()">
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
						</select>
					</div> <!-- 옵션선택 끝 -->
                            
                            
                            	
								<c:if test="${paging.startPage != 1 }">
									<a href="adApproveList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="adApproveList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="adApproveList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
							</div>
                            
                        </div>
                        </c:if>
                        
                         <!-- 거절 클릭시 -->
                        <div role="tabpanel" class="tab-pane" id="no">
                            <table class="table table-hover" style="text-align:center;">
                                <thead>
                                 <tr>
                                    <th style="text-align:center;">광고 코드</th>
                                    <th style="text-align:center;">광고 신청자</th>
                                    <th style="text-align:center;">광고 제목</th>
                                    <th style="text-align:center;">사업자번호</th>
                                    <th style="text-align:center;">신청 일자</th>
                                    <th style="text-align:center;">심사 상태</th>
                                 </tr>
                                </thead>
                                <tbody>
                              <%--  <c:if test="${requestScope.sCode eq 3}"> --%>
                               <c:forEach var="adApprove" items="${ requestScope.adApproveList }">
                                <tr onclick="location.href='adApproveDetail/${ adApprove.adCode }'"> 
                                  <c:if test="${ adApprove.stateCode eq 3 }">
                                    <th scope="row">${ adApprove.adCode }</th>
                                    <td>${ adApprove.user.name }(${ adApprove.user.id })</td>
                                    <td>${ adApprove.adTitle }</td>
                                    <td>${ adApprove.companyNumber }</td>
                                    <td>${ adApprove.applyDate }</td>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${ adApprove.stateCode eq 3}">
                                    			거절
                                    		</c:when>
                                    	</c:choose>
                                    </td>
                                    </c:if>
                                  </tr>
                                 </c:forEach>
                  
                                </tbody>
                            </table>
                            
                             <div style="display: block; text-align: center;">	
				                              <div style="float: right;">
						<select id="cntPerPage" name="sel" onchange="selChange()">
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
						</select>
					</div> <!-- 옵션선택 끝 -->
                            
                            
                            	
								<c:if test="${paging.startPage != 1 }">
									<a href="adApproveList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="adApproveList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="adApproveList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
							</div>
                            
                            
                        </div>
                      	
                      	<div class="text-center">
						<ul class="pagination">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
						</ul>
										</div>	
                      	
                </div><!-- End off container -->
                </div>
            </section><!-- End off Product section -->
           
           
          
            

			<!-- 푸터 시작 -->
            <footer>
       			<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
            </footer>
			<!-- 푸터 끝 -->

        </div>

     
</html>