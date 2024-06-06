package com.brokurly.dto.mypage;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class PointAndPointLogEarningDto {
    private int pointNo;
    private int pointAmt;
    private Date expirDt;
    private String orderId;
    private Date procDt;
    private String pointSpec;
    private String pointStat;
}
