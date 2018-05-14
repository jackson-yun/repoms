package egovframework.com.cop.smt.dsm.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;
/**
 * 일지관리 VO Class 구현
 * @author 공통서비스 장동한
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  장동한          최초 생성
 *
 * </pre>
 */
public class DiaryManageVO extends ComDefaultVO implements Serializable {

	private static final long serialVersionUID = 8243616489957327248L;

	/** 일지ID */
	private String diaryId;

	/** 최초등록시점 */
	private String frstRegisterPnttm = "";

	/** 최초등록자ID */
	private String frstRegisterId = "";

	/** 최종수정시점 */
	private String lastUpdusrPnttm = "";

	/** 최종수정ID */
	private String lastUpdusrId = "";
	
	
	
	/*************신규 추가한 변수들 *****************/
	
	/** 계획/실적구분(계획,실적) */
	private String reptitSeCode;
	
	/** 작업시간(정상) */
	private String workTimeRegular;

	/** 작업시간(잔업) */
	private String workTimeExtension;

	/** 작업시간(철야) */
	private String workTimeOvernight;
	
	/** 일정시작일자(Year/Month/Day) */
	private String schdulBgndeYYYMMDD = "";
	
	/** 작업직반ID */
	private String schdulDeptId;
	
	/** 작업직반명칭 */
	private String schdulDeptName = "";	
	
	/** 담당자명 */
	private String schdulChargerName = "";
	
	/** 담담자ID */
	private String schdulChargerId;
	
	/** 작업내용 */
	private String workDetail;
	
	/** 메모 */
	private String memo;
	
	/** 호선 */
	private String numberLine;
	
	/** 작업장소 */
	private String workingPlace;		
	

	/**
	 * diaryId attribute 를 리턴한다.
	 * @return the String
	 */
	public String getDiaryId() {
		return diaryId;
	}

	/**
	 * diaryId attribute 값을 설정한다.
	 * @return diaryId String
	 */
	public void setDiaryId(String diaryId) {
		this.diaryId = diaryId;
	}

	/**
	 * frstRegisterPnttm attribute 를 리턴한다.
	 * @return the String
	 */
	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	/**
	 * frstRegisterPnttm attribute 값을 설정한다.
	 * @return frstRegisterPnttm String
	 */
	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}

	/**
	 * frstRegisterId attribute 를 리턴한다.
	 * @return the String
	 */
	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	/**
	 * frstRegisterId attribute 값을 설정한다.
	 * @return frstRegisterId String
	 */
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	/**
	 * lastUpdusrPnttm attribute 를 리턴한다.
	 * @return the String
	 */
	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}

	/**
	 * lastUpdusrPnttm attribute 값을 설정한다.
	 * @return lastUpdusrPnttm String
	 */
	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}

	/**
	 * lastUpdusrId attribute 를 리턴한다.
	 * @return the String
	 */
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	/**
	 * lastUpdusrId attribute 값을 설정한다.
	 * @return lastUpdusrId String
	 */
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	public String getReptitSeCode() {
		return reptitSeCode;
	}

	public void setReptitSeCode(String reptitSeCode) {
		this.reptitSeCode = reptitSeCode;
	}

	public String getWorkTimeRegular() {
		return workTimeRegular;
	}

	public void setWorkTimeRegular(String workTimeRegular) {
		this.workTimeRegular = workTimeRegular;
	}

	public String getWorkTimeExtension() {
		return workTimeExtension;
	}

	public void setWorkTimeExtension(String workTimeExtension) {
		this.workTimeExtension = workTimeExtension;
	}

	public String getWorkTimeOvernight() {
		return workTimeOvernight;
	}

	public void setWorkTimeOvernight(String workTimeOvernight) {
		this.workTimeOvernight = workTimeOvernight;
	}

	public String getSchdulBgndeYYYMMDD() {
		return schdulBgndeYYYMMDD;
	}

	public void setSchdulBgndeYYYMMDD(String schdulBgndeYYYMMDD) {
		this.schdulBgndeYYYMMDD = schdulBgndeYYYMMDD;
	}

	public String getSchdulDeptId() {
		return schdulDeptId;
	}

	public void setSchdulDeptId(String schdulDeptId) {
		this.schdulDeptId = schdulDeptId;
	}

	public String getSchdulDeptName() {
		return schdulDeptName;
	}

	public void setSchdulDeptName(String schdulDeptName) {
		this.schdulDeptName = schdulDeptName;
	}

	public String getSchdulChargerName() {
		return schdulChargerName;
	}

	public void setSchdulChargerName(String schdulChargerName) {
		this.schdulChargerName = schdulChargerName;
	}

	public String getSchdulChargerId() {
		return schdulChargerId;
	}

	public void setSchdulChargerId(String schdulChargerId) {
		this.schdulChargerId = schdulChargerId;
	}

	public String getWorkDetail() {
		return workDetail;
	}

	public void setWorkDetail(String workDetail) {
		this.workDetail = workDetail;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getNumberLine() {
		return numberLine;
	}

	public void setNumberLine(String numberLine) {
		this.numberLine = numberLine;
	}

	public String getWorkingPlace() {
		return workingPlace;
	}

	public void setWorkingPlace(String workingPlace) {
		this.workingPlace = workingPlace;
	}




}
