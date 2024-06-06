package com.brokurly.utils;

//  공지사항 페이지에서 게시글목록을 보여줄 때나 관리자 측면에서 공지사항 작성한 목록을 보여줄 떄 사용

import com.brokurly.dto.board.FAQListDto;
import com.brokurly.dto.board.NoticeListDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Slf4j

//  어떤 조건이든 매개변수로 들어온 List에 대해서 PageHandling을 진행한다.

public class BoardPageHandler {
    private int firstOfPage;            //  현 페이지 기준 가장 첫번째 글의 index(bno와는 다르다)
    private int page;                   //  현재 페이지 번호
    private int totalCnt;               //  전체 게시글 수
    private int totalPages;              //  전체 페이지수
    private boolean firstPage = false;
    private boolean lastPage = false;
    private final int pagesize = 15;

    public void refreshPages(int page, int totalCnt) {
//        현 페이지의 첫번째 게시물의 index
        this.firstOfPage = pagesize * page;
        this.page = page;
        this.totalCnt = totalCnt;
        this.totalPages = totalCnt/pagesize + (totalCnt % pagesize == 0 ? 0 : 1);
        this.firstPage = (this.page == 0);
        this.lastPage = (this.page == totalPages - 1);

    }

//    dto리스트(대상)과 페이지(번호)를 받아서 페이징을 하고 내보냄
    public List<NoticeListDto> getPagedNoticeList(List<NoticeListDto> list, int page) {

        refreshPages(page,list.size());

//        시작 인덱스부터 15개씩 끊는다.
//        담을 공간
        List<NoticeListDto> pagingList = new ArrayList<>();
        for (int i = firstOfPage; i < firstOfPage + 15; i++) {
            if (i == totalCnt) { break; }
            pagingList.add(list.get(i));
        }
        return pagingList;
    }


//    Q. 지네릭스로 묶기...

    public List<FAQListDto> getPagedFAQList(List<FAQListDto> list, int page) {

        refreshPages(page,list.size());

        List<FAQListDto> pagingList = new ArrayList<>();
        for (int i = firstOfPage; i < firstOfPage + 15; i++) {
            if (i == totalCnt) { break; }
            pagingList.add(list.get(i));
        }
        return pagingList;
    }
}