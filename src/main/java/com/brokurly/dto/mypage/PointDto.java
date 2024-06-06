package com.brokurly.dto.mypage;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class PointDto {
    private int pointNo;
    private String custId;
    private int pointAmt;
    private Date expirDt;
}
