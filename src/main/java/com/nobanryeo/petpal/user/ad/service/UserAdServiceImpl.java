package com.nobanryeo.petpal.user.ad.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.ad.dao.UserAdMapper;
import com.nobanryeo.petpal.user.dto.AdDTO;
import com.nobanryeo.petpal.user.dto.AdQnADTO;

@Service
public class UserAdServiceImpl implements UserAdService {

	private final UserAdMapper adMapper;
	
	@Autowired
	public UserAdServiceImpl(UserAdMapper adMapper) {
		this.adMapper = adMapper;
	}
	
	@Override
	public List<AdDTO> selectAdList(AdDTO adDTO) {
		
		List<AdDTO> adList = new ArrayList<>();
		
		adList = adMapper.selectAdList(adDTO);
		
		return adList;
	}

	@Override
	public List<AdDTO> selectAdPaymentList(AdDTO adDTO) {

		List<AdDTO> adPaymentList = new ArrayList<>();
		
		adPaymentList = adMapper.selectAdPaymentList(adDTO);
		
		return adPaymentList;
	}

	@Override
	public AdDTO selectAdApplyDetail(AdDTO adDTO) {
		
		return adMapper.selectAdApplyDetail(adDTO);
	}

	@Override
	public int insertAdQnA(AdQnADTO adQnA) {

		return adMapper.insertAdQnA(adQnA);
	}

	@Override
	public int insertAdSubmit(AdDTO adDTO) {

		return adMapper.insertAdSubmit(adDTO);
	}

	@Override
	public int insertAdSubmit2(AdDTO adDTO) {

		return adMapper.insertAdSubmit2(adDTO);
	}

	@Override
	public int updateFirstAdPayment(AdDTO adDTO) {

		return adMapper.updateFirstAdPayment(adDTO);
	}

}
