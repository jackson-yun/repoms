<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>주간 일정 보기</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
		
		 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
		
		<!-- datebox javascript-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/datepicker/jqm-datebox.css"/>

		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.core.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.calbox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.datebox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.flipbox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jquery.mobile.datebox.i18n.ko.utf8.js"></script>
		
		<script type="text/javaScript" language="javascript" defer="defer">
			<!--

			$(document).on('pagehide', "#view", function(){ $(this).remove(); });		

			/* ********************************************************
			 * 페이징 처리 함수
			 ******************************************************** */
			function linkPage(pageNo){
				if(document.subForm.pageIndex.value == pageNo) {
					return;
				}
				document.subForm.pageIndex.value = pageNo;
				document.subForm.action = "${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageList.mdo";
			   	document.subForm.submit();
			}
			/* ********************************************************
			 * 등록 처리 함수 
			 ******************************************************** */
			function fn_egov_regist_DiaryManage(){
				location.href = "${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageRegist.mdo";
			}
			/* ********************************************************
			 * 상세회면 처리 함수
			 ******************************************************** */
			function fn_egov_detail_DiaryManage(diaryId){
				var vFrom = document.subForm; 
				vFrom.diaryId.value = diaryId; 
				vFrom.action = "${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageDetail.mdo"; 
				vFrom.submit();
			}

			/* ********************************************************
			 * 검색 함수
			 ******************************************************** */
			function fn_egov_search_DiaryManage(pageNo){
				var vFrom = document.searchVO;
				vFrom.pageIndex.value = pageNo;
				
				vFrom.action = "${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageList.mdo";
				vFrom.submit();
				
			}

			/* ********************************************************
			 * 저장처리화면(등록창에서 사용)
			 ******************************************************** */
			function fn_egov_save_DiaryManage(){

				var vForm = document.registForm;
				
				vForm.action =  "${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageRegistActor.mdo";
				
				if(!validateDiaryManageVO(vForm)){
				 			
					return;
				}else{
				
					vForm.submit();
				} 
			}  

			 /* ********************************************************
				 * 검색 함수(팝업창에서 사용)
				 ******************************************************** */
				function fn_egov_search_DeptSchdulManage(){
					var vFrom = document.searchPopVO;
					
					vFrom.action = "${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageListPopup.mdo";
					vFrom.submit();
				}
				/* ********************************************************
				* 선택 처리 함수(팝업창에서 사용)
				******************************************************** */
				function fn_egov_open_Popup(cnt, schdulId, schdulCn){

					var vFrom = document.subPopForm;
					vFrom.schdulId.value=schdulId;
					vFrom.schdulCn.value=schdulCn;
					
					vFrom.action = "${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageRegist.mdo";
					vFrom.submit();
				}

				/* ********************************************************
				* 등록 화면 호출 함수
				******************************************************** */
				function fn_egov_show_regist(url) {

					var vFrom = document.searchVO;
					
					vFrom.action = url;
					vFrom.submit();
				}

				
        	-->
			/* ********************************************************
			* 등록 화면 호출 함수
			******************************************************** */
			function fn_egov_show_regist(url) {

				var vFrom = document.searchVO;
				
				vFrom.action = url;
				vFrom.submit();
			}
		</script>
	</head>
	
	<body>

	<div id="list" data-role="page">
	
		<!-- header start -->
		<div data-role="header">
				<a href="${pageContext.request.contextPath}/index.jsp" data-icon="home" rel="external">홈</a>
			    <h1>일보관리목록</h1>
			    <a href='javascript:fn_egov_show_regist("${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageRegist.mdo");' data-icon="arrow-right">등록</a>

			<div data-role="navbar">
				<ul>
<%-- 					<li><a href="${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageWeekList.mdo" class="ui-btn-active" id="week" name="week" data-ajax="false">주간별 일보보기</a></li> --%>
					<li><a href="${pageContext.request.contextPath}/cop/smt/sim/EgovIndvdlSchdulManageDailyList.mdo" id="date" name="date" data-ajax="false">일별 일보보기</a></li>
				</ul>
			</div>
		</div>			
		<!-- header end -->
			
		<!-- contents start -->
		<div data-role="content">
			
			<div id="searchview">
				<form id="searchVO" name="searchVO" method="post" data-role="none">
					<div class="uss-calSearch">
	                	<select id="searchCondition" name="searchCondition" data-role="none" onchange="javascript:initList();">
	       					<c:forEach items="${schdulSe}" var="schdul">	
	       						<option value="${schdul.code}" <c:if test='${searchVO.searchCondition eq schdul.code}'> selected="selected" </c:if>> ${schdul.codeNm} </option>	
	       					</c:forEach>
	                	</select>
                	</div>
	                <div class="egov-grid uss-calpadd">
		                <div class="egov-wid3"><a name="btnSearch_before" id="btnSearch_before" data-role="none" href='javascript:fn_search("before");' class="uss-btnBack">이전</a></div>
						<div class="egov-wid7 uss-calendar" id="term"></div>
						<div class="egov-wid2"><a name="btnSearch_after" id="btnSearch_after" data-role="none" href='javascript:fn_search("after");' class="uss-btnNext">다음</a></div>
					</div>
					<input type="hidden" id="selDate" name="selDate" value="${selDate}"/>
					<input type="hidden" id="schdulId" name="schdulId" value=""/>
					<input type="hidden" id="path" name="path" value="week"/>
				</form>
			</div>
			
			<ul data-role="listview">
								
			</ul>
			
		</div>
		<!-- contents end -->
		
		<!-- footer start -->
			<div data-role="footer" data-position="fixed">
				<h4>Copyright (c) YOOSHIN Co.Ltd.</h4>
			</div>
		<!-- footer end -->
	</div>

	</body>
	
</html>
