package com.nobanryeo.petpal.user.adopt.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.adopt.dao.MissingMapper;
import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;
import com.nobanryeo.petpal.user.dto.MissingPictureDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

@Service
public class MissingServiceImpl implements MissingService {

	private final MissingMapper missingMapper;

	@Autowired
	public MissingServiceImpl(MissingMapper missingMapper) {
		this.missingMapper = missingMapper; 
	}

	@Override
	public List<MissingPictureDTO> selectMissingList() {
		
		List<MissingPictureDTO> missingList = new ArrayList<>();
		missingList = missingMapper.selectMissingList();
		
		return missingList;
	}


	@Override
	public int insertMissingWrite(MissingDTO missing, List<PictureDTO> pictureList) {
		int result1 = missingMapper.insertMissingInfo(missing);
		
		System.out.println("infoResult in service: "+result1);
		
		int boardCode = missing.getBoardCode();
		System.out.println("boardCode in service: "+boardCode);
		
		int pictureResult = 0;
		
		for(PictureDTO picture : pictureList) {
			picture.setBoardCode(boardCode);
			
			pictureResult += missingMapper.insertPicture(picture);
			
			int midTableResult = missingMapper.insertMidTab(picture);
			
		}
		
		int result = 0;
		
		if(result1>0 && pictureResult == pictureList.size()) {
			result =1;
		}
		return result;
	}

	@Override
	public MissingDTO selectMissingDetail(int code) {
		
		MissingDTO missingDetail = new MissingDTO();
		missingDetail = missingMapper.selectMissingDetail(code);
		
		return missingDetail;
	}

	@Override
	public List<PictureDTO> selectMissingDetailPicture(int code) {
		
		List<PictureDTO> pictureList = new ArrayList<>();
		pictureList = missingMapper.selectMissingDetailPicture(code);
		return pictureList;
	}

	@Override
	public List<AdoptReplyDTO> selectReplyList(int code) {
		List<AdoptReplyDTO> missingReplyList = new ArrayList<>();
		missingReplyList = missingMapper.selectAllMissingReply(code);
		return missingReplyList;
	}

	@Override
	public int insertReply(AdoptReplyDTO replyDTO) {
		
		int result1 = missingMapper.insertReply(replyDTO);
		System.out.println("ReplyResult in Missing service:"+ result1);
		
		int result2 = missingMapper.insertReplyBoard(replyDTO);
		
		int result = 0;
		
		if(result1>0 && result2>0) {
			result = 1;
		}
		return result;
	}

	
}
