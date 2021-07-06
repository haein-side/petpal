package com.nobanryeo.petpal.user.adopt.service;

import java.util.List;

import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;
import com.nobanryeo.petpal.user.dto.MissingPictureDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

public interface MissingService {

	List<MissingPictureDTO> selectMissingList();

	int insertMissingWrite(MissingDTO missing, List<PictureDTO> pictureList);

	MissingDTO selectMissingDetail(int code);

	List<PictureDTO> selectMissingDetailPicture(int code);

	List<AdoptReplyDTO> selectReplyList(int code);

	int insertReply(AdoptReplyDTO replyDTO);

}
