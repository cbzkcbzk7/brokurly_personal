package com.brokurly.dto.mypage;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class PointLogEarningDto {
    private int pointAmt;
    private String pointStat;
}
