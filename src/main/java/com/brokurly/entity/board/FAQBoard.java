package com.brokurly.entity.board;

import com.brokurly.dto.board.FAQListDto;
import lombok.*;
import java.util.ArrayList;
import java.util.List;


@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FAQBoard {
    private int bno;
    private String adminId;
    private String title;
    private String cateCode;
    private String content;
    private String regDt;
    private String modiDt;
    private String pubFl;
    private String hit;
    private String attachFile;

    public List<FAQListDto> cateNameJoin(List<FAQBoard> faqBoardList, List<FAQCate> faqCateList) {
        List<FAQListDto> faqListDtoList = new ArrayList<>();
        for (FAQBoard faqBoard : faqBoardList) {
            for (FAQCate faqCate : faqCateList) {
                if(faqBoard.cateCode.equals(faqCate.getCode())) {
                    faqListDtoList.add(faqBoard.getFAQListDto(faqCate.getName()));
                }
            }
        }
        return faqListDtoList;
    }

    public List<FAQListDto> sortedFAQList(List<FAQBoard> faqBoardList, FAQCate faqCate) {
        List<FAQListDto> faqListDtoList = new ArrayList<>();
        for (FAQBoard faqBoard : faqBoardList) {
            if (faqBoard.cateCode.equals(faqCate.getCode())) {
                faqListDtoList.add(faqBoard.getFAQListDto(faqCate.getName()));
            }
        }
        return faqListDtoList;
    }

    public FAQListDto getFAQListDto(String name) {
        return FAQListDto.builder()
                .bno(bno)
                .name(name)
                .title(title)
                .content(content)
                .build();
    }
}
