package com.brokurly.dto.search;
import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class SearchKeywordDto {
    private String keyword;
    private String itemIdList;
}
