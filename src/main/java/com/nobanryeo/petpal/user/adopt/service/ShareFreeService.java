package com.nobanryeo.petpal.user.adopt.service;

import java.util.HashMap;
import java.util.List;

import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.ShareFreeDTO;

public interface ShareFreeService {

	int selectTotalCount();

	List<ShareFreeDTO> selectShareFreeList(HashMap<String, Object> map);

	int insertNewBoard(ShareFreeDTO shareDTO);

	int insertNewBoth(ShareFreeDTO shareDTO, PictureDTO picture);

	void updateShareBoardViews(int code);

	ShareFreeDTO selectBoardDetail(int code);

	int putMissingStatus(int code);

	int insertMessage(MessageTableDTO messageDTO);

	int insertBoardReport(FreeBoardReportDTO boardreportDTO);



}
