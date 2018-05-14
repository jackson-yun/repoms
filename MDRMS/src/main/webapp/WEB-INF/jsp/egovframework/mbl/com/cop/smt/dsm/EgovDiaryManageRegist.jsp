<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html>

<html>
 
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>작업일보 등록</title>
		
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/cop/smt/dsm/diary-popup.js"></script>

		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/datepicker/jqm-datebox.css"/>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.core.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.calbox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.datebox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.flipbox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jquery.mobile.datebox.i18n.ko.utf8.js"></script>
		 

		<script type="text/javascript" src="${pageContext.request.contextPath}/validator.do"></script>
		<validator:javascript formName="diaryManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/cop/smt/sdm/schdul-popup.js"></script>
		
		
		<script type="text/javaScript">
					
			/* ********************************************************
			 * 저장처리화면
			 ******************************************************** */
			function fn_egov_save_DiaryManage(){
				
				

				var vForm = document.registForm;
				
				vForm.action =  "${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageRegistActor.mdo"; 
				
				vForm.submit();
				
// 				if(!validateDiaryManageVO(vForm)){
// 					jAlert("test");		
// 					return;
// 				}else{

// 					var process = vForm.diaryProcsPte.value;
// 					if(process > 100 || process < 0){
// 						jAlert("진척률을 확인해 주세요", "알림", "a");
// 						return;
// 					}
									
// 					vForm.submit();
// 					jAlert("test2");	
// 				}
				
				jAlert("test3");
			}  

			function fn_egov_show_list() {

				var vFrom = document.registForm;
				
				vFrom.action = "${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageList.mdo";
				vFrom.submit();
				
			}
			
			//부서코드 조회 후 세팅
			function fn_sel_orgn(orgnztId, orgnztNm) {
				
				$('#schdulDeptName').val(orgnztNm);
				$('#schdulDeptId').val(orgnztId);

				$.mobile.changePage($("#view"));
			}
			
			//사원코드 조회 후 세팅
			function fn_sel_emp(chargerId, chargerNm) {
				
				$('#schdulChargerName').val(chargerNm);
				$('#schdulChargerId').val(chargerId);

				$.mobile.changePage($("#view"));
			}			
        	
		</script>
	</head>
	
	<body>
		
		<div id="view" data-role="page">
									
			
			<div data-role="header">
			    <h1>작업일보 등록</h1>
			    <a href="javascript:fn_egov_show_list();" data-icon="arrow-l">뒤로</a>
			</div>
			
			<form:form commandName="diaryManageVO" name="registForm" method="post">
			<form:hidden path="diaryId" value=""/>
			<form:hidden path="searchKeyword"/>
			<form:hidden path="searchCondition"/>
			<form:hidden path="pageIndex"/>
			
			<input name="cmd" id="cmd" type="hidden" value="<c:out value='save'/>"/>
			<div data-role="content" class="com-ussContent">
				
				<div data-inline="true">
					<dl class="uss-registOk">
					
						<dd>
							<fieldset data-role="controlgroup" data-type="horizontal"  data-inline="true"> 	
				        		<c:forEach items="${reptitSeCode}" var="reptitSe">
				        			<form:radiobutton path="reptitSeCode" value="${reptitSe.code}" label="${reptitSe.codeNm}"/>
				        		</c:forEach>
			        		</fieldset>
						</dd>

						<dt><label for="reptitSeCode"><strong>일자</strong></label></dt>
						<dd class="department">
							<div>
								<span class="uss-dataBox"><form:input path="schdulBgndeYYYMMDD" type="date" data-role="datebox" data-options='{"mode": "datebox"}' class="new"/></span>
							</div>
						</dd>
						
						
						
						<dt><label for="dept"><strong>직반</strong></label></dt>
						<dd class="department">
							<div class="uss-typ3">
								<form:input path="schdulDeptName" maxlength="30" readonly="true"/>
								<form:hidden path="schdulDeptId" maxlength="30"/>
							</div>
							<div class="uss-typ4"><a href="${pageContext.request.contextPath}/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopupView.mdo" id="layer_1" data-rel="dialog" data-role="button" data-icon="search" data-iconpos="notext">조회</a></div>
						</dd>
							
						<dt><label for="dept"><strong>작업자</strong></label></dt>
						<dd>
							<div class="uss-typ3">
								<form:input path="schdulChargerName" maxlength="30" readonly="true"/>
								<form:hidden path="schdulChargerId"/></div>
							<div class="uss-typ4"><a href="${pageContext.request.contextPath}/uss/olp/mgt/EgovMeetingManageLisEmpLyrPopupView.mdo" data-rel="dialog" id="layer_2" data-role="button" data-icon="search" data-iconpos="notext">조회</a></div>
						</dd>
						
						<dt><label for="name"><strong>호선</strong></label></dt>
						<dd>
							<div class="uss-typ3">
								<form:input path="numberLine" maxlength="30"  readonly="true"/>
							</div>
			        		<div class="uss-typ4">
			        			<a href="${pageContext.request.contextPath}/cop/smt/sdm/EgovDeptSchdulManageListPopupView.mdo" data-rel="dialog" id="layer_1" data-role="button" data-icon="search" data-iconpos="notext"></a>
							</div>
							<form:hidden path="numberLine"/></dd>

						<dt><label for="workingPlace"><strong>작업 장소</strong></label></dt>
						<dd><form:input path="workingPlace" maxlength="300"/></dd>
						
						<dt><label for="name"><strong>정상</strong></label><label for="ipcr"><strong>잔업</strong></label><label for="ipcr"><strong>철야</strong></label></dt>
						<dd>
							<form:select path="" data-role="none">
					            <form:options items="${workTimeRegular}" itemValue="code" itemLabel="codeNm"/>
					        </form:select>
							<form:select path="" data-role="none">
					            <form:options items="${workTimeExtension}" itemValue="code" itemLabel="codeNm"/>
					        </form:select>
							<form:select path="" data-role="none">
					            <form:options items="${workTimeOvernight}" itemValue="code" itemLabel="codeNm"/>
					        </form:select>					        					        
						</dd>
						
<!-- 						<dt><label for="ipcr"><strong>잔업</strong></label></dt> -->
<!-- 						<dd> -->
<%-- 							<form:select path="" data-role="none"> --%>
<%-- 					            <form:options items="${schdulIpcrCode}" itemValue="code" itemLabel="codeNm"/> --%>
<%-- 					        </form:select> --%>
<!-- 						</dd> -->
<!-- 						<dt><label for="ipcr"><strong>철야</strong></label></dt> -->
<!-- 						<dd> -->
<%-- 							<form:select path="" data-role="none"> --%>
<%-- 					            <form:options items="${schdulIpcrCode}" itemValue="code" itemLabel="codeNm"/> --%>
<%-- 					        </form:select> --%>
<!-- 						</dd>													 -->

						<dt><label for="workDetail"><strong>작업 내용</strong></label></dt>
						<dd><form:input path="workDetail" maxlength="300"/></dd>
																			
						<dt><label for="name"><strong>직영 부서</strong></label></dt>
						<dd class="department">
							<div class="uss-typ3">
								<form:input path="schdulDeptName" maxlength="30" readonly="true"/>
								<form:hidden path="schdulDeptId" maxlength="30"/>
							</div>
							<div class="uss-typ4"><a href="${pageContext.request.contextPath}/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopupView.mdo" id="layer_1" data-rel="dialog" data-role="button" data-icon="search" data-iconpos="notext">조회</a></div>
						</dd>

						<dt><label for="memo"><strong>메모</strong></label></dt>
						<dd><form:textarea path="memo" maxlength="300"/></dd>

					</dl>
				</div>
				<div class="ui-grid-a uss-clear">	
					<div class="ui-block-a"><a href="javascript:fn_egov_save_DiaryManage();" data-role="button" data-theme="b">등록</a></div>
					<div class="ui-block-b"><a href='javascript:fn_egov_show_list();' data-role="button" data-theme="b">목록</a></div>
				</div>
			</div>
			</form:form>
			
			<!-- footer start -->
			<div data-role="footer">
				<h4>Copyright (c) YooShin Co.Ltd.</h4>
			</div>
			<!-- footer end -->
				
		</div>
		
	</body>
</html>

