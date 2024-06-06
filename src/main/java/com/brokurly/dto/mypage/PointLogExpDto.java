package com.brokurly.dto.mypage;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class PointLogExpDto {
    private int pointAmt;
    private Date procDt;
    private String pointSpec;
    private String pointStat;
}
