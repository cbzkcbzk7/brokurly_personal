package com.brokurly.utils;

//  공지사항 페이지에서 게시글목록을 보여줄 때나 관리자 측면에서 공지사항 작성한 목록을 보여줄 떄 사용

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NoticePageHandler {
    private int firstOfPage;            //  현 페이지 기준 가장 첫번째 글의 bno
    private int page;                   //  현재 페이지 번호
    private int totalCnt;               //  전체 게시글 수
    private int totalPages;              //  전체 페이지수
    private boolean showPrev = false;
    private boolean showNext = false;
    private final int pagesize = 15;

    public void refreshPages(int totalCnt, int firstOfPage) {
        this.totalCnt = totalCnt;
        this.totalPages = totalCnt/pagesize + (totalCnt%pagesize == 0 ? 0 : 1);
        try {
            if (0 < firstOfPage && firstOfPage < totalPages) {
                this.firstOfPage = firstOfPage;
            } else {
                throw new Exception("out of bound");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.page = totalPages - firstOfPage/pagesize;
        this.showPrev = page != 1;
        this.showNext = page != totalPages;
    }
}
