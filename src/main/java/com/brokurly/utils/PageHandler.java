package com.brokurly.utils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageHandler {
    private int totalCnt;   //  총 게시물의 갯수
    private int pageSize;   //  한 페이지의 크기
    private int totalPage;  //  전체 페이지의 갯수
    private Integer page;   //  현재 페이지
    private boolean showPrev;   //  이전 페이지로 이동하는 링크를 보여줄 것인지 여부
    private boolean showNext;   //  다음 페이지로 이동하는 링크를 보여줄 것인지 여부

    private final int naviSize = 5;  //  페이지 내비게이션의 크기
    private int beginPage;  //  내비게이션의 첫번째 페이지
    private int endPage;    //  내비게이션의 마지막 페이지

    public PageHandler(int totalCnt, Integer page) {
        this(totalCnt, page, 9);
    }

    public PageHandler(int totalCnt, Integer page, int pageSize) {
        this.totalCnt = totalCnt;
        this.page = page;
        this.pageSize = pageSize;

        totalPage = (int) Math.ceil(totalCnt / (double) pageSize);
        beginPage = (page-1) / naviSize * naviSize + 1;
        endPage = Math.min(beginPage + naviSize - 1, totalPage);
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }

    void print() {
        System.out.println("page = " + page);
        System.out.println(showPrev ? "[Prev] " : " ");
        for (int i = beginPage; i <= endPage; i++) {
            System.out.println(i + " ");
        }
        System.out.println(showNext ? " [Next]" : " ");
    }
}

