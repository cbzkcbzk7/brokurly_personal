package com.brokurly.service.board;

import com.brokurly.dto.board.FAQListDto;
import com.brokurly.dto.board.InquiryDto;
import com.brokurly.entity.board.FAQBoard;
import com.brokurly.entity.board.FAQCate;
import com.brokurly.entity.board.Inquiry;
import com.brokurly.repository.board.FAQBoardDao;
import com.brokurly.repository.board.FAQCateDao;
import com.brokurly.repository.board.InquiryBoardDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class InquiryService {
    private final InquiryBoardDao inquiryBoardDao;

    public List<InquiryDto> getOneCustInquiryList(String custid) {
        List<Inquiry> inquiryList = inquiryBoardDao.selectOneCustId(custid);
        List<InquiryDto> inquiryDtoList = new ArrayList<>();
        for (Inquiry inquiry : inquiryList) {
            inquiryDtoList.add(inquiry.getInquiryDto());
        }
        return inquiryDtoList;
    }

}
