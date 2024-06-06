package com.brokurly.dto.mypage;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class PointLogRecordWithoutPointNoDto {
    private String orderId;
    private String custId;
    private int pointAmt;
    private String pointSpec;
    private String pointStat;
}
