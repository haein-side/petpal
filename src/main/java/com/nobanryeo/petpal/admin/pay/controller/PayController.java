package com.nobanryeo.petpal.admin.pay.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nobanryeo.petpal.admin.dto.AdAdminDTO;
import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.pay.service.PayAdminService;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

@Controller
@RequestMapping("/admin/*")
public class PayController {

	private PayAdminService payAdminService;

	@Autowired
	public PayController(PayAdminService payAdminService) {
		this.payAdminService = payAdminService;
	}

	//광고결제관리 리스트
	@RequestMapping("payList")
	public String paymentManageListReturning(Model model, AdminPageInfoDTO paging,
			  @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="category", required=false)String category
			, @RequestParam(value="searchCondition", required=false)String searchCondition
            , @RequestParam(value="searchValue", required=false)String searchValue, HttpServletRequest request) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		AdminPageInfoDTO cat2 = new AdminPageInfoDTO(category);
		
		// 전체 광고 갯수 조회
		int realTotal = payAdminService.selectAdPayList(cat2);
		
		System.out.println("전체 광고 갯수 : " + realTotal);
		// 전체 광고 조회
		List<AdAdminDTO> selectPayAllForMonthList = payAdminService.selectPayAllForMonthList();
		
		System.out.println("전체 광고 조회 : " + selectPayAllForMonthList);
		
		// 청구일자
    	for(int i = 0; i < realTotal; i++) {
    		
    		if( selectPayAllForMonthList.get(i).getPayDate1st() != null && selectPayAllForMonthList.get(i).getCancelApplyDate() == null) {
    			selectPayAllForMonthList.get(i).setPayUntilDate(selectPayAllForMonthList.get(i).getPostEndDate());
    		} else if( selectPayAllForMonthList.get(i).getPayDate1st() == null ) {
    			selectPayAllForMonthList.get(i).setPayUntilDate(selectPayAllForMonthList.get(i).getDecision().getDecisionDate());
    		} else if( selectPayAllForMonthList.get(i).getPayDate1st() != null && !selectPayAllForMonthList.get(i).getCancelApplyDate().equals(null)){
    			selectPayAllForMonthList.get(i).setPayUntilDate(selectPayAllForMonthList.get(i).getCancelApplyDate());
    		}
    		
    		System.out.println(selectPayAllForMonthList.get(i).getPayUntilDate());
    	}
		
    	// 청구일자 업데이트
    	for(int j = 0; j < realTotal; j++) {
    		
    	AdAdminDTO adInfo = new AdAdminDTO(selectPayAllForMonthList.get(j).getPayUntilDate(), selectPayAllForMonthList.get(j).getAdCode());
    	
    	boolean result = payAdminService.updateAdPayDate(adInfo);
		
	    	if (result) {
	    		System.out.println("업데이트 성공!");
	    	} else {
	    		System.out.println("업데이트 실패!");
	    	}
    	
    	}
    	
		
		List<AdAdminDTO> selectAdPayAllList = null;
		
		// 검색 안 했을 떄
	    if(searchValue == null) {
	    	
	    	AdminPageInfoDTO cat = new AdminPageInfoDTO(category);
	    	
	    	System.out.println("검색 안했을 때 cat 출력 : " + cat);
	    	
	    	// 총 개수
	    	int total = payAdminService.selectAdPayList(cat);
	    	
	    	System.out.println("총 개수 : " + total);
	    	
	    	// 페이징 정보
	    	paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category);
	    	
	    	// 광고 심사 리스트
	    	selectAdPayAllList = payAdminService.selectAdPayAllList(paging);
	    	
	    	// 현재 페이지에 보여지는 게시물 갯수 
	    	int cntNowPage = payAdminService.selectNumber(paging);
	    	
	    
	    	
	    	// 청구일자
	    	for(int i = 0; i < cntNowPage; i++) {
	    		
	    		if( selectAdPayAllList.get(i).getPayDate1st() != null && selectAdPayAllList.get(i).getCancelApplyDate() == null) {
	    			selectAdPayAllList.get(i).setPayUntilDate(selectAdPayAllList.get(i).getPostEndDate());
	    			System.out.println("2차 청구일");
	    		} else if( selectAdPayAllList.get(i).getPayDate1st() == null ) {
	    			selectAdPayAllList.get(i).setPayUntilDate(selectAdPayAllList.get(i).getDecision().getDecisionDate());
	    			System.out.println("1차 청구일");
	    		} else if( selectAdPayAllList.get(i).getPayDate1st() == null && !selectAdPayAllList.get(i).getCancelApplyDate().equals(null)){
	    			selectAdPayAllList.get(i).setPayUntilDate(selectAdPayAllList.get(i).getCancelApplyDate());
	    			System.out.println("납부취소일");
	    		}  else if( selectAdPayAllList.get(i).getPayDate1st() != null && !selectAdPayAllList.get(i).getCancelApplyDate().equals(null)){
	    			selectAdPayAllList.get(i).setPayUntilDate(selectAdPayAllList.get(i).getCancelApplyDate());
	    			System.out.println("취소신청일");
	    		}
	    		
	    		System.out.println(selectAdPayAllList.get(i).getPayUntilDate());
	    	}
	    	
	    	Calendar cal = Calendar.getInstance();
	    	
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
	    	
	    	String day = sdf.format(cal.getTime());
	    	
	    	SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
	    	
	    	Date today = null;
	    	try {
				today = format.parse(day);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	    	    	
	    	
	    	// 납부상태
	    	for(int j = 0; j < cntNowPage; j++) {
	    		
	    		Date de2 = null;
	    		Date po2 = null;
	    		Date can2 = null;
	    		 
	    		// 승인일  - 날짜 형식에 맞게 형변환
	    		if(selectAdPayAllList.get(j).getDecision().getDecisionDate() != null ) {
	    			String de1 = sdf.format(selectAdPayAllList.get(j).getDecision().getDecisionDate().getTime());
	    			
	    			try {
						de2 = format.parse(de1);
					} catch (ParseException e) {
						e.printStackTrace();
					}
	    		}
	    		
	    		
	    		// 종료일 - 날짜 형식에 맞게 형변환
	    		if(selectAdPayAllList.get(j).getPostEndDate() != null) {
	    			String po1 = sdf.format(selectAdPayAllList.get(j).getDecision().getDecisionDate().getTime());
	    			
	    			try {
						po2 = format.parse(po1);
					} catch (ParseException e) {
						e.printStackTrace();
					}
	    		}
	    		
	    		// 취소일 - 날짜 형식에 맞게 형변환
	    		if(selectAdPayAllList.get(j).getPostEndDate() != null) {
	    			String can1 = sdf.format(selectAdPayAllList.get(j).getDecision().getDecisionDate().getTime());
	    			
	    			try {
	    				can2 = format.parse(can1);
					} catch (ParseException e) {
						e.printStackTrace();
					}
	    		}
	    		
	    		if(selectAdPayAllList.get(j).getPayDate1st() == null && Math.abs((today.getTime() - de2.getTime())/ (24*60*60*1000)) <= 3
	    				&& selectAdPayAllList.get(j).getCancelApplyDate() == null ) {
	    			selectAdPayAllList.get(j).setPayStatus("납부전");
	    			System.out.println("차이1 : " + (today.getTime() - de2.getTime())/ (24*60*60*1000));

	    		} else if (selectAdPayAllList.get(j).getPayDate1st() != null && selectAdPayAllList.get(j).getCancelApplyDate() != null
	    				&& selectAdPayAllList.get(j).getPayDate1st().equals(selectAdPayAllList.get(j).getCancelApplyDate())) {
	    			selectAdPayAllList.get(j).setPayStatus("환불");
	    				
	    		} else if (selectAdPayAllList.get(j).getPayDate1st() != null && Math.abs((today.getTime() - po2.getTime())/ (24*60*60*1000)) <= 7
	    				&& selectAdPayAllList.get(j).getPayDate2nd() == null ) {
	    			selectAdPayAllList.get(j).setPayStatus("납부전");
	    			System.out.println("차이2 : " + (today.getTime() - po2.getTime())/ (24*60*60*1000));
	    			
	    		} else if(selectAdPayAllList.get(j).getPayDate1st() != null && selectAdPayAllList.get(j).getPayDate2nd() == null ) {
	    			selectAdPayAllList.get(j).setPayStatus("납부전");
	    			
	    		} else if (selectAdPayAllList.get(j).getPayDate1st() == null && selectAdPayAllList.get(j).getCancelApplyDate() != null) {
	    			selectAdPayAllList.get(j).setPayStatus("납부취소");
	    			
	    		} else if (selectAdPayAllList.get(j).getPayDate1st() != null && selectAdPayAllList.get(j).getPayDate2nd() != null ||
	    				selectAdPayAllList.get(j).getPayDate1st() != null && selectAdPayAllList.get(j).getCancelApplyDate() != null) {
	    			selectAdPayAllList.get(j).setPayStatus("납부완료");
	    			
	    		} else {
	    			selectAdPayAllList.get(j).setPayStatus("납부초과");
	    		}
	    		System.out.println("취소일 : " + selectAdPayAllList.get(j).getCancelApplyDate());
	    		
	    		System.out.println("납부 상태 : " + selectAdPayAllList.get(j).getPayStatus());
	    		
//	    		&& selectAdPayAllList.get(j).getCancelApplyDate() != null
	    	}
	    	
	    	
         	System.out.println("검색 안 했을 때 검색결과 : " + selectAdPayAllList);
	    	
	    		// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
	    		model.addAttribute("paging", paging);
	    		model.addAttribute("payList", selectAdPayAllList);
	    		model.addAttribute("category", category);
	    		model.addAttribute("total", total);

	    } else {
	    	
	    // 검색했을 때
	    	AdminPageInfoDTO cat = new AdminPageInfoDTO(category,searchValue);
			
			System.out.println("검색했을 때 cat 출력 : " + cat);
			System.out.println(cat.getSearchValue());
			
			// 카테고리
	        System.out.println("카테고리 : " + category);
	        // 검색값
	        System.out.println("검색값 : " + searchValue);
			
			// 총 개수
			int total = payAdminService.searchAdPayList(cat);
	         
	        System.out.println("총 개수 : " + total);
	        
	        paging = new AdminPageInfoDTO(Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category, searchValue, total);
			
			// 광고 심사 리스트
			List<AdAdminDTO> searchAdPayAllList = payAdminService.searchAdPayAllList(paging);
			
			// 현재 페이지에 보여지는 게시물 갯수 
	    	int cntNowPage = payAdminService.selectNumber(paging);
			
	    	// 청구일자
	    	for(int i = 0; i < cntNowPage; i++) {
	    		
	    		if( searchAdPayAllList.get(i).getPayDate1st() != null && searchAdPayAllList.get(i).getCancelApplyDate() == null) {
	    			searchAdPayAllList.get(i).setPayUntilDate(searchAdPayAllList.get(i).getPostEndDate());
	    			System.out.println("2차 청구일");
	    		} else if( searchAdPayAllList.get(i).getPayDate1st() == null ) {
	    			searchAdPayAllList.get(i).setPayUntilDate(searchAdPayAllList.get(i).getDecision().getDecisionDate());
	    			System.out.println("1차 청구일");
	    		} else if( searchAdPayAllList.get(i).getPayDate1st() == null && !searchAdPayAllList.get(i).getCancelApplyDate().equals(null)){
	    			searchAdPayAllList.get(i).setPayUntilDate(searchAdPayAllList.get(i).getCancelApplyDate());
	    			System.out.println("납부취소일");
	    		}  else if( searchAdPayAllList.get(i).getPayDate1st() != null && !searchAdPayAllList.get(i).getCancelApplyDate().equals(null)){
	    			searchAdPayAllList.get(i).setPayUntilDate(searchAdPayAllList.get(i).getCancelApplyDate());
	    			System.out.println("취소신청일");
	    		}
	    		
	    		System.out.println(searchAdPayAllList.get(i).getPayUntilDate());
	    	}
	    	
	    	Calendar cal = Calendar.getInstance();
	    	
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
	    	
	    	String day = sdf.format(cal.getTime());
	    	
	    	SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
	    	
	    	Date today = null;
	    	try {
				today = format.parse(day);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	    	    	
	    	
	    	// 납부상태
	    	for(int j = 0; j < cntNowPage; j++) {
	    		
	    		Date de2 = null;
	    		Date po2 = null;
	    		Date can2 = null;
	    		 
	    		// 승인일  - 날짜 형식에 맞게 형변환
	    		if(searchAdPayAllList.get(j).getDecision().getDecisionDate() != null ) {
	    			String de1 = sdf.format(searchAdPayAllList.get(j).getDecision().getDecisionDate().getTime());
	    			
	    			try {
						de2 = format.parse(de1);
					} catch (ParseException e) {
						e.printStackTrace();
					}
	    		}
	    		
	    		
	    		// 종료일 - 날짜 형식에 맞게 형변환
	    		if(searchAdPayAllList.get(j).getPostEndDate() != null) {
	    			String po1 = sdf.format(searchAdPayAllList.get(j).getDecision().getDecisionDate().getTime());
	    			
	    			try {
						po2 = format.parse(po1);
					} catch (ParseException e) {
						e.printStackTrace();
					}
	    		}
	    		
	    		// 취소일 - 날짜 형식에 맞게 형변환
	    		if(searchAdPayAllList.get(j).getPostEndDate() != null) {
	    			String can1 = sdf.format(searchAdPayAllList.get(j).getDecision().getDecisionDate().getTime());
	    			
	    			try {
	    				can2 = format.parse(can1);
					} catch (ParseException e) {
						e.printStackTrace();
					}
	    		}
	    		
	    		if(searchAdPayAllList.get(j).getPayDate1st() == null && Math.abs((today.getTime() - de2.getTime())/ (24*60*60*1000)) <= 3
	    				&& searchAdPayAllList.get(j).getCancelApplyDate() == null ) {
	    			searchAdPayAllList.get(j).setPayStatus("납부전");
	    			System.out.println("차이1 : " + (today.getTime() - de2.getTime())/ (24*60*60*1000));

	    		} else if (searchAdPayAllList.get(j).getPayDate1st() != null && searchAdPayAllList.get(j).getCancelApplyDate() != null
	    				&& searchAdPayAllList.get(j).getPayDate1st().equals(searchAdPayAllList.get(j).getCancelApplyDate())) {
	    			searchAdPayAllList.get(j).setPayStatus("환불");
	    				
	    		} else if (searchAdPayAllList.get(j).getPayDate1st() != null && Math.abs((today.getTime() - po2.getTime())/ (24*60*60*1000)) <= 7
	    				&& searchAdPayAllList.get(j).getPayDate2nd() == null ) {
	    			searchAdPayAllList.get(j).setPayStatus("납부전");
	    			System.out.println("차이2 : " + (today.getTime() - po2.getTime())/ (24*60*60*1000));
	    			
	    		} else if(searchAdPayAllList.get(j).getPayDate1st() != null && searchAdPayAllList.get(j).getPayDate2nd() == null ) {
	    			searchAdPayAllList.get(j).setPayStatus("납부전");
	    			
	    		} else if (searchAdPayAllList.get(j).getPayDate1st() == null && searchAdPayAllList.get(j).getCancelApplyDate() != null) {
	    			searchAdPayAllList.get(j).setPayStatus("납부취소");
	    			
	    		} else if (searchAdPayAllList.get(j).getPayDate1st() != null && searchAdPayAllList.get(j).getPayDate2nd() != null ||
	    				searchAdPayAllList.get(j).getPayDate1st() != null && searchAdPayAllList.get(j).getCancelApplyDate() != null) {
	    			searchAdPayAllList.get(j).setPayStatus("납부완료");
	    			
	    		} else {
	    			searchAdPayAllList.get(j).setPayStatus("납부초과");
	    		}
	    		System.out.println("취소일 : " + searchAdPayAllList.get(j).getCancelApplyDate());
	    		
	    		System.out.println("납부 상태 : " + searchAdPayAllList.get(j).getPayStatus());
	    		
//	    		&& selectAdPayAllList.get(j).getCancelApplyDate() != null
	    	}
			
			System.out.println("검색 했을 때 검색결과1 : " + searchAdPayAllList);
			System.out.println("총 개수1 : " + total);
			System.out.println("검색값1 : " + searchValue);
			System.out.println("탭메뉴1 : " + category);
			System.out.println("검색했을 때 cat 출력1 : " + cat);
			System.out.println("paging: " + paging);
		
			// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
			model.addAttribute("paging", paging);
			model.addAttribute("payList", searchAdPayAllList);
			model.addAttribute("category", category);
			model.addAttribute("total", total);
	    	
	    }
		
		return "admin/main/paymentManageList";
	}
	
	
	//광고결제관리 디테일
	@RequestMapping(value= "paymentDetail/{adCode}", method=RequestMethod.GET)
	public String paymentDetailReturning(Model model, @PathVariable("adCode") int adCode) {
		
		System.out.println("adCode : " + adCode);
		
		// 광고결제관리 정보 조회
		List<AdAdminDTO> selectPayAdminDetail = payAdminService.selectPayAdminDetail(adCode);
		
		System.out.println("조회된 광고결제관리 디테일 : " + selectPayAdminDetail);
		
		// 최신 청구일자
		if( selectPayAdminDetail.get(0).getPayDate1st() != null && selectPayAdminDetail.get(0).getCancelApplyDate() == null) {
			selectPayAdminDetail.get(0).setPayUntilDate(selectPayAdminDetail.get(0).getPostEndDate());
		} else if( selectPayAdminDetail.get(0).getPayDate1st() == null ) {
			selectPayAdminDetail.get(0).setPayUntilDate(selectPayAdminDetail.get(0).getDecision().getDecisionDate());
		} else if( selectPayAdminDetail.get(0).getPayDate1st() != null && !selectPayAdminDetail.get(0).getCancelApplyDate().equals(null)){
			selectPayAdminDetail.get(0).setPayUntilDate(selectPayAdminDetail.get(0).getCancelApplyDate());
		}
		
		System.out.println("상세보기 청구일자 :" + selectPayAdminDetail.get(0).getPayUntilDate());
		
		// 최신 납부상태
		Calendar cal = Calendar.getInstance();
    	
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
    	
    	String day = sdf.format(cal.getTime());
    	
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
    	
    	Date today = null;
    	try {
			today = format.parse(day);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
    	Date de2 = null;
		Date po2 = null;
		
		// 승인일  - 날짜 형식에 맞게 형변환
		if(selectPayAdminDetail.get(0).getDecision().getDecisionDate() != null ) {
			String de1 = sdf.format(selectPayAdminDetail.get(0).getDecision().getDecisionDate().getTime());
			
			try {
				de2 = format.parse(de1);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		
		// 종료일 - 날짜 형식에 맞게 형변환
		if(selectPayAdminDetail.get(0).getPostEndDate() != null) {
			String po1 = sdf.format(selectPayAdminDetail.get(0).getDecision().getDecisionDate().getTime());
			
			try {
				po2 = format.parse(po1);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
//		if(selectPayAdminDetail.get(0).getPayDate1st() == null && Math.abs((today.getTime() - de2.getTime())/ (24*60*60*1000)) <= 3
//				&& selectPayAdminDetail.get(0).getCancelApplyDate() == null ) {
//			selectPayAdminDetail.get(0).setPayStatus("납부전");
//			System.out.println("차이1 : " + (today.getTime() - de2.getTime())/ (24*60*60*1000));
//
//		} else if (selectPayAdminDetail.get(0).getPayDate1st() != null && Math.abs((today.getTime() - po2.getTime())/ (24*60*60*1000)) <= 7
//				&& selectPayAdminDetail.get(0).getPayDate2nd() == null ) {
//			selectPayAdminDetail.get(0).setPayStatus("납부전");
//			System.out.println("차이2 : " + (today.getTime() - po2.getTime())/ (24*60*60*1000));
//			
//		} else if(selectPayAdminDetail.get(0).getPayDate1st() != null && selectPayAdminDetail.get(0).getPayDate2nd() == null ) {
//			selectPayAdminDetail.get(0).setPayStatus("납부전");
//			
//		} else if (selectPayAdminDetail.get(0).getPayDate1st() == null && selectPayAdminDetail.get(0).getCancelApplyDate() != null) {
//			selectPayAdminDetail.get(0).setPayStatus("납부취소");
//			
//		} else if (selectPayAdminDetail.get(0).getPayDate1st() != null && selectPayAdminDetail.get(0).getPayDate2nd() != null ||
//				selectPayAdminDetail.get(0).getPayDate1st() != null && selectPayAdminDetail.get(0).getCancelApplyDate() != null) {
//			selectPayAdminDetail.get(0).setPayStatus("납부완료");
//			
//		} else {
//			selectPayAdminDetail.get(0).setPayStatus("납부초과");
//		}
		
		// test
		
		if(selectPayAdminDetail.get(0).getPayDate1st() == null && Math.abs((today.getTime() - de2.getTime())/ (24*60*60*1000)) <= 3
				&& selectPayAdminDetail.get(0).getCancelApplyDate() == null ) {
			selectPayAdminDetail.get(0).setPayStatus("납부전");
			System.out.println("차이1 : " + (today.getTime() - de2.getTime())/ (24*60*60*1000));

		} else if (selectPayAdminDetail.get(0).getPayDate1st() != null && selectPayAdminDetail.get(0).getCancelApplyDate() != null
				&& selectPayAdminDetail.get(0).getPayDate1st().equals(selectPayAdminDetail.get(0).getCancelApplyDate())) {
			selectPayAdminDetail.get(0).setPayStatus("환불");
				
		} else if (selectPayAdminDetail.get(0).getPayDate1st() != null && Math.abs((today.getTime() - po2.getTime())/ (24*60*60*1000)) <= 7
				&& selectPayAdminDetail.get(0).getPayDate2nd() == null ) {
			selectPayAdminDetail.get(0).setPayStatus("납부전");
			System.out.println("차이2 : " + (today.getTime() - po2.getTime())/ (24*60*60*1000));
			
		} else if(selectPayAdminDetail.get(0).getPayDate1st() != null && selectPayAdminDetail.get(0).getPayDate2nd() == null ) {
			selectPayAdminDetail.get(0).setPayStatus("납부전");
			
		} else if (selectPayAdminDetail.get(0).getPayDate1st() == null && selectPayAdminDetail.get(0).getCancelApplyDate() != null) {
			selectPayAdminDetail.get(0).setPayStatus("납부취소");
			
		} else if (selectPayAdminDetail.get(0).getPayDate1st() != null && selectPayAdminDetail.get(0).getPayDate2nd() != null ||
				selectPayAdminDetail.get(0).getPayDate1st() != null && selectPayAdminDetail.get(0).getCancelApplyDate() != null) {
			selectPayAdminDetail.get(0).setPayStatus("납부완료");
			
		} else {
			selectPayAdminDetail.get(0).setPayStatus("납부초과");
		}
		
		System.out.println("상세보기 납부 상태 : " + selectPayAdminDetail.get(0).getPayStatus());
		
		
		
		
		model.addAttribute("payDetail",selectPayAdminDetail);
		
		return "admin/main/paymentDetail";
	}
	
	//세금계산서관리 리스트
	@RequestMapping("taxManageList")
	public String taxManageListReturning(Model model, AdminPageInfoDTO paging,
			  @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="category", required=false)String category
			, @RequestParam(value="searchCondition", required=false)String searchCondition
			, @RequestParam(value="searchValue", required=false)String searchValue
			, @RequestParam(value="month", required=false)String month) {
		
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		// 검색 안 했을 떄
		if(searchValue == null) {
			
			// 월별 조회 시
			if (month != null) {

				int fullMonth = Integer.parseInt("2021" + month + "01");
				
				System.out.println("검색한 월 : " + fullMonth);
				
				AdminPageInfoDTO cat2 = new AdminPageInfoDTO(category, fullMonth);
				
				// 월별 조회 선택 시 총 개수
				int totalMonth = payAdminService.selectTaxMonthList(cat2);
				
				// 월별 조회 선택 시 페이징 정보
				paging = new AdminPageInfoDTO(totalMonth, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category, fullMonth);
				
				// 세금계산서 리스트
				List<AdAdminDTO> selectTaxMonthAllList = payAdminService.selectTaxMonthAllList(paging);
				
				// 세금계산서 현재 페이지 게시물 갯수 조회
				int cntNowPage = payAdminService.selectTaxMonthNumber(paging);
				
				for (int i = 0; i < cntNowPage; i++) {
					
					if(selectTaxMonthAllList.get(i).getCancelApplyDate() != null && selectTaxMonthAllList.get(i).getCalApplyDate() > 7) {
						selectTaxMonthAllList.get(i).setPayStatus("납부완료");
					} else if(selectTaxMonthAllList.get(i).getCancelApplyDate() == null && selectTaxMonthAllList.get(i).getCalEndDate() > 7) {
						selectTaxMonthAllList.get(i).setPayStatus("납부완료");
					} else {
						selectTaxMonthAllList.get(i).setPayStatus("납부전");
						System.out.println("납부전 : " + selectTaxMonthAllList.get(i).getCalApplyDate());
						System.out.println("납부전2 : " + selectTaxMonthAllList.get(i).getCalEndDate());
						System.out.println("납부전3 : " + selectTaxMonthAllList.get(i).getCancelApplyDate());
						
					}
					
					System.out.println(selectTaxMonthAllList.get(i).getPayStatus());
				}
				
				System.out.println("월별 조회 시 검색결과 : " + selectTaxMonthAllList);
				
				// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
				model.addAttribute("paging", paging);
				model.addAttribute("taxList", selectTaxMonthAllList);
				model.addAttribute("category", category);
				model.addAttribute("total", totalMonth);
				
				
			} else {
			// 월별 조회 안 했을 시
				
			AdminPageInfoDTO cat = new AdminPageInfoDTO(category);
			
			System.out.println("검색 안했을 때 cat 출력 : " + cat);
			
			// 총 개수
			int total = payAdminService.selectTaxList(cat);
			
			System.out.println("총 개수 : " + total);
			
			// 페이징 정보
			paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category);
			
			// 세금계산서 리스트
			List<AdAdminDTO> selectTaxAllList = payAdminService.selectTaxAllList(paging);
			
			// 세금계산서 현재 페이지 게시물 갯수 조회
			int cntNowPage = payAdminService.selectTaxNumber(paging);
			
			for (int i = 0; i < cntNowPage; i++) {
				
				if(selectTaxAllList.get(i).getCancelApplyDate() != null && selectTaxAllList.get(i).getCalApplyDate() > 7) {
					selectTaxAllList.get(i).setPayStatus("납부완료");
				} else if(selectTaxAllList.get(i).getCancelApplyDate() == null && selectTaxAllList.get(i).getCalEndDate() > 7) {
					selectTaxAllList.get(i).setPayStatus("납부완료");
				} else {
					selectTaxAllList.get(i).setPayStatus("납부전");
					System.out.println("납부전 : " + selectTaxAllList.get(i).getCalApplyDate());
					System.out.println("납부전2 : " + selectTaxAllList.get(i).getCalEndDate());
					System.out.println("납부전3 : " + selectTaxAllList.get(i).getCancelApplyDate());
					
				}
				
				System.out.println(selectTaxAllList.get(i).getPayStatus());
			}
			
			
			System.out.println("검색 안 했을 때 검색결과 : " + selectTaxAllList);
			
			// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
			model.addAttribute("paging", paging);
			model.addAttribute("taxList", selectTaxAllList);
			model.addAttribute("category", category);
			model.addAttribute("total", total);
			
			}
					
			} else {
				
				AdminPageInfoDTO cat = new AdminPageInfoDTO(category);
				
				System.out.println("검색했을 때 cat 출력 : " + cat);
				
				// 총 개수
				int total = payAdminService.searchTaxList(cat);
				
				System.out.println("총 개수 : " + total);
				
				// 페이징 정보
				paging = new AdminPageInfoDTO(Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category, searchValue, total);
				
				// 세금계산서 리스트
				List<AdAdminDTO> searchTaxAllList = payAdminService.searchTaxAllList(paging);
				
				// 세금계산서 현재 페이지 게시물 갯수 조회
				int cntNowPage = payAdminService.searchTaxNumber(paging);
				
				for (int i = 0; i < cntNowPage; i++) {
					
					if(searchTaxAllList.get(i).getCancelApplyDate() != null && searchTaxAllList.get(i).getCalApplyDate() > 7) {
						searchTaxAllList.get(i).setPayStatus("납부완료");
					} else if(searchTaxAllList.get(i).getCancelApplyDate() == null && searchTaxAllList.get(i).getCalEndDate() > 7) {
						searchTaxAllList.get(i).setPayStatus("납부완료");
					} else {
						searchTaxAllList.get(i).setPayStatus("납부전");
					}
					
					System.out.println(searchTaxAllList.get(i).getPayStatus());
				}
				
				
				System.out.println("검색 했을 때 검색결과 : " + searchTaxAllList);
				
				// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
				model.addAttribute("paging", paging);
				model.addAttribute("taxList", searchTaxAllList);
				model.addAttribute("category", category);
				model.addAttribute("total", total);
				
			}
		
		

		
		return "admin/main/taxManageList";
	}
	
	
	//세금계산서 디테일 (세금계산서 보기)
	@RequestMapping(value="taxManageList/{adCode}", method=RequestMethod.GET)
	public String taxbillReturning(Model model, @PathVariable("adCode") int adCode) {
		
		// 광고관리 정보 조회
		List<AdAdminDTO> selectTaxDetail = payAdminService.selectTaxDetail(adCode);
				
		System.out.println("조회된 광고 관리 디테일 : " + selectTaxDetail);
		
		// 2차 금액
		String price2nd = String.valueOf(selectTaxDetail.get(0).getPrice2nd());
		
		// 세액
		String taxPrice = String.valueOf(selectTaxDetail.get(0).getTaxPrice());
		
		// 월 일
		Date taxday = selectTaxDetail.get(0).getTaxBillDate();
		
		String taxString = DateFormatUtils.format(taxday, "yyyy-MM-dd");
		
		System.out.println("taxString : " + taxString);
		
		String year = taxString.substring(0,4);
		String month = taxString.substring(5,7);
		String day = taxString.substring(8,10);
		
		System.out.println("년도 : " + year);
		System.out.println("월 : " + month);
		System.out.println("일 : " + day);
				
		model.addAttribute("adApprove", selectTaxDetail);
		model.addAttribute("taxMonthDay", month);
		model.addAttribute("taxDayDay", day);
		model.addAttribute("price2nd", price2nd);
		model.addAttribute("taxPrice", price2nd);
		
		
		return "admin/main/taxbill";
	}
}
