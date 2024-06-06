package com.brokurly.service.board;

import com.brokurly.entity.board.FAQBoard;
import com.brokurly.entity.board.FAQCate;
import com.brokurly.dto.board.FAQListDto;
import com.brokurly.repository.board.FAQCateDao;
import com.brokurly.repository.board.FAQBoardDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class FAQService {
    private final FAQBoardDao faqBoardDao;
    private final FAQCateDao faqCateDao;

//    조인된 FAQList 전부를 반환
    public List<FAQListDto> getFaqList() {
        List<FAQBoard> faqBoardList = faqBoardDao.selectAllFAQList();
        List<FAQCate> faqCateList = faqCateDao.selectFAQCateList();
        return new FAQBoard().cateNameJoin(faqBoardList, faqCateList);
    }

//    PageHandler의 totalCnt를 구하기 위함
    public FAQListDto getMaxbno() {
        return faqBoardDao.selectMax().getFAQListDto("");
    }

    public List<FAQListDto> getFaqSortedList(@RequestParam Integer catecode, int pagesize) {
        List<FAQBoard> faqBoardList = faqBoardDao.selectSortedList(catecode);
        FAQCate faqCate = faqCateDao.selectCate(catecode);

        return new FAQBoard().sortedFAQList(faqBoardList, faqCate);
    }
}
