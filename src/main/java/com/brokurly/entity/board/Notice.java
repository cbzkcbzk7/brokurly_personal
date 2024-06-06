package com.brokurly.entity.board;

import com.brokurly.dto.board.NoticeBoardDto;
import com.brokurly.dto.board.NoticeListDto;
import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@Builder
public class Notice {
    private int bno;
    private String adminId;
    private String title;
    private String content;
    private String regDt;
    private String modiDt;
    private String pubFl;
    private String notiFl;
    private int hit;
    private String attachFile;

    public NoticeListDto getNoticeListDto() {
        return NoticeListDto.builder()
                .bno(bno)
                .title(title)
                .adminId(adminId)
                .regDt(regDt)
                .build();
    }
    public NoticeBoardDto getNoticeBoardDto () {
        return NoticeBoardDto.builder()
                .title(title)
                .adminId(adminId)
                .regDt(regDt)
                .content(content)
                .build();
    }
}
