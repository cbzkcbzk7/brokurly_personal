package com.brokurly.dto.board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
    public class InquiryDto {
        private String title;
        private String regDt;
        private String ansStat;
        private String majorCate;
        private String subCate;
        private String content;
    }