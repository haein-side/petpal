package com.nobanryeo.petpal.admin.dto;

import java.util.Date;

public class ReportDetailDTO {
	private int reportCode;
	private String userId;
	private String reportedId;
	private String boardTitle;
	private String boardContent;
	private String reportedTitle;
	private String reportedContent;
	private java.util.Date reportDate;
	private String reason;
	private String state;
	
	public ReportDetailDTO() {
		
	}

	public int getReportCode() {
		return reportCode;
	}

	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReportedId() {
		return reportedId;
	}

	public void setReportedId(String reportedId) {
		this.reportedId = reportedId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getReportedTitle() {
		return reportedTitle;
	}

	public void setReportedTitle(String reportedTitle) {
		this.reportedTitle = reportedTitle;
	}

	public String getReportedContent() {
		return reportedContent;
	}

	public void setReportedContent(String reportedContent) {
		this.reportedContent = reportedContent;
	}

	public java.util.Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(java.util.Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public ReportDetailDTO(int reportCode, String userId, String reportedId, String boardTitle, String boardContent,
			String reportedTitle, String reportedContent, Date reportDate, String reason, String state) {
		super();
		this.reportCode = reportCode;
		this.userId = userId;
		this.reportedId = reportedId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.reportedTitle = reportedTitle;
		this.reportedContent = reportedContent;
		this.reportDate = reportDate;
		this.reason = reason;
		this.state = state;
	}

	@Override
	public String toString() {
		return "ReportDetailDTO [reportCode=" + reportCode + ", userId=" + userId + ", reportedId=" + reportedId
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", reportedTitle=" + reportedTitle
				+ ", reportedContent=" + reportedContent + ", reportDate=" + reportDate + ", reason=" + reason
				+ ", state=" + state + "]";
	}

	
	
	
	
	
	
	
}
