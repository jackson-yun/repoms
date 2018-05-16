<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:scriptlet>

	pageContext.setAttribute("crlf", "\r\n");

</jsp:scriptlet>
 
<!DOCTYPE html>
<html>

	<head>
		
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>일정 상세조회 </title>
		
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
		
		 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
				

        <script type="text/javaScript" language="javascript" defer="defer">
        <!--
	        function fn_egov_delete() {
	        	
				jConfirm('삭제하시겠습니까?', '알림', 'a', function(r) {
	
					if(r) {
						
						var url = "${pageContext.request.contextPath}/cop/smt/sdm/EgovIndvdlSchdulManageDelete.mdo";
						$('#searchVO').attr('action', url);
						$('#searchVO').attr('data-ajax', 'false');
						$('#searchVO').submit();	
					}
					
				});
				
			}

			function fn_show_list() {

				var url = "";
				var path = $('#path').val();
				
				if(path == "daily") {
					
					url = "${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageDailyList.mdo";
				}
				else if(path == "all") {

					url = "${pageContext.request.contextPath}/cop/smt/sam/EgovAllSchdulManageList.mdo";
				}
				else {

					url = "${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageWeekList.mdo";
				}
				
				$('#searchVO').attr('action', url);
				$('#searchVO').attr('data-ajax', 'false');
				$('#searchVO').submit();
			}

			function fn_egov_updt_view() {
				
				var url = "${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageModify.mdo";
				
				$('#searchVO').attr('action', url);
				$('#searchVO').attr('data-ajax', 'false');
				$('#searchVO').submit();
			}
        -->
        </script>
		
	</head>
	
	<body>
		
		<div id="view" data-role="page">
			
			
			<!-- header start -->
			<div data-role="header">
				<a href="javascript:fn_show_list();" data-icon="arrow-l">뒤로</a>
			    <h1 id="viewTitle">일보 상세보기</h1>
			    <a href="${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageList.mdo" data-icon="search" rel="external">일보관리</a>
			</div>
			<!-- header end -->
			
			<div data-role="content" class="com-copContent">
				<!-- searchVO start -->				
				<form id="searchVO" name="searchVO" method="post">
					<input type="hidden" id="selDate" name="selDate" value="${selDate}"/>
					<input type="hidden" id="path" name="path" value="${path}"/>
					<input type="hidden" id="searchCondition" name="searchCondition" value="${searchVO.searchCondition}"/>
					<input type="hidden" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}"/>
					<input type="hidden" id="diaryId" name="diaryId" value="${result.diaryId}"/>
				</form>
				<!-- searchVO end -->
				<form:form commandName="result" id="detailForm" name="detailForm" method="post">
					
				
				<ul class="uss-hpcDetail">
					<li>
						<span class="uss-tit">계획실적 구분</span>
						<span class="uss-con gray">
						<c:forEach items="${schdulSe}" var="schdulSeInfo" varStatus="status">
							<c:if test="${schdulSeInfo.code eq result.reptitSeCode}">	
								<c:out value="${schdulSeInfo.codeNm}" escapeXml="false"/>
							</c:if>
						</c:forEach>
						</span>
					</li>
					
					<li>
						<span class="uss-tit">직반 </span>
						<span class="uss-con">
							<label for="name-d"><c:out value="${result.schdulDeptName}"/></label>
						</span>
					</li>
					
					<li>
						<span class="uss-tit">작업자</span>
						<span class="uss-con">
							<label for="name-d"><c:out value="${result.schdulChargerName}"/></label>
						</span>
					</li>	
					
					<li>			
						<span class="uss-tit">호선 </span>
					</li>
					<li class="uss-contentsView">
						<label for="name-d"><c:out value="${result.numberLine}"/></label>
					</li>

					<li>			
						<span class="uss-tit">작업장소 </span>
					</li>
					<li class="uss-contentsView">
						<label for="name-d"><c:out value="${result.workingPlace}"/></label>
					</li>

					<li>			
						<span class="uss-tit">작업시간 (정상)</span>
					</li>
					<li class="uss-contentsView">
						<label for="name-d"><c:out value="${result.workTimeRegular}"/></label>
					</li>

					<li>			
						<span class="uss-tit">작업시간 (잔업)</span>
					</li>
					<li class="uss-contentsView">
						<label for="name-d"><c:out value="${result.workTimeExtension}"/></label>
					</li>
					<li>			
						<span class="uss-tit">작업시간 (철야)</span>
					</li>
					<li class="uss-contentsView">
						<label for="name-d"><c:out value="${result.workTimeOvernight}"/></label>
					</li>					

					<li>			
						<span class="uss-tit">작업내용</span>
					</li>
					<li class="uss-contentsView">
						<label for="name-d"><c:out value="${result.workDetail}"/></label>
					</li>	

					<li>			
						<span class="uss-tit">직영부서</span>
					</li>
					<li class="uss-contentsView">
						<label for="name-d"><c:out value="${result.schdulDeptName}"/></label>
					</li>	

					<li>			
						<span class="uss-tit">메모</span>
					</li>
					<li class="uss-contentsView">
						<label for="name-d"><c:out value="${result.memo}"/></label>
					</li>	
										
										
				</ul>
				
				<div class="ui-grid-b">
					<div class="ui-block-a"><a href="javascript:fn_egov_updt_view();" data-role="button" data-theme="b">수정</a></div>
					<div class="ui-block-b"><a href='javascript:fn_egov_delete();' data-role="button" data-theme="b">삭제</a></div>					
					<div class="ui-block-c"><a href='javascript:fn_show_list();' data-role="button" data-theme="b">목록</a></div>
				</div>
				
				</form:form>
			</div>
			
			<!-- footer start -->
			<div data-role="footer" data-position="fixed">
				<h4>Copyright (c) Copyright (c) YOOSHIN Co.Ltd.</h4>
			</div>
			<!-- footer end -->
						
								
		</div>
		
	</body>
</html>
