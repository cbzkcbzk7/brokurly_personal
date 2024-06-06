package com.brokurly.entity.mypage;

import com.brokurly.dto.mypage.PointAndPointLogEarningDto;
import lombok.*;

import java.util.Date;

@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class PointAndPointLog {
    // pointNo로 조인

    // Point
    private int pointNo;
    private String custId;
    private int pointAmt;
    private Date expirDt;

    // PointLog
    // private int pointNo;
    private String orderId;
    // private String custId;
    // private int pointAmt;
    private Date procDt;
    private String pointSpec;
    private String pointStat;

    public PointAndPointLogEarningDto getPointAndPointLogEarningDto() {
        return PointAndPointLogEarningDto.builder()
                .pointNo(pointNo)
                .pointAmt(pointAmt)
                .expirDt(expirDt)
                .orderId(orderId)
                .procDt(procDt)
                .pointSpec(pointSpec)
                .pointStat(pointStat)
                .build();
    }

    /*public void setPointAndPointLogEarningDto(PointAndPointLogEarningDto pointAndPointLogEarningDto) {
        this.pointNo = pointAndPointLogEarningDto.getPointNo();
        this.pointAmt = pointAndPointLogEarningDto.getPointAmt();
        this.expirDt = pointAndPointLogEarningDto.getExpirDt();
        this.orderId = pointAndPointLogEarningDto.getOrderId();
        this.procDt = pointAndPointLogEarningDto.getProcDt();
        this.pointSpec = pointAndPointLogEarningDto.getPointSpec();
        this.pointStat = pointAndPointLogEarningDto.getPointStat();
    }*/
}
