package com.brokurly.dto.board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticeBoardDto {
    private String title;
    private String adminId;
    private String regDt;
    private String content;
}
