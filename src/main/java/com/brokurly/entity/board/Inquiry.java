package com.brokurly.entity.board;

import com.brokurly.dto.board.InquiryDto;
import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Inquiry {
    private int bno;
    private String custId;
    private String title;
    private String majorCate;
    private String subCate;
    private String content;
    private String img;
    private String regDt;
    private String ansStat;
    private boolean smsFlag;

    public InquiryDto getInquiryDto() {
        return InquiryDto.builder()
                .title(title)
                .regDt(regDt)
                .ansStat(ansStat)
                .majorCate(majorCate)
                .subCate(subCate)
                .content(content)
                .build();
    }
}
