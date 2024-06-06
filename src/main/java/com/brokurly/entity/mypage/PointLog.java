package com.brokurly.entity.mypage;

import com.brokurly.dto.*;
import com.brokurly.dto.mypage.PointLogUsageDto;
import com.brokurly.dto.mypage.*;
import lombok.*;

import java.util.Date;
@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class PointLog {
    private int pointNo;
    private String orderId;
    private String custId;
    private int pointAmt;
    private Date procDt;
    private String pointSpec;
    private String pointStat;

    public PointLog(String orderId, String custId, int pointAmt, Date procDt, String pointSpec, String pointStat) {
        this.orderId = orderId;
        this.custId = custId;
        this.pointAmt = pointAmt;
        this.procDt = procDt;
        this.pointSpec = pointSpec;
        this.pointStat = pointStat;
    }

    public PointLog(String custId, int pointAmt, Date procDt, String pointSpec, String pointStat) {
        this.custId = custId;
        this.pointAmt = pointAmt;
        this.procDt = procDt;
        this.pointSpec = pointSpec;
        this.pointStat = pointStat;
    }

    public PointLogRecordWithPointNoDto getPointLogRecordWithPointNoDto() {
        return PointLogRecordWithPointNoDto.builder()
                .pointNo(pointNo)
                .orderId(orderId)
                .custId(custId)
                .pointAmt(pointAmt)
                .pointSpec(pointSpec)
                .pointStat(pointStat)
                .build();
    }

    public void setPointLogRecordWithPointNoDto(PointLogRecordWithPointNoDto pointLogRecordWithPointNoDto) {
        this.pointNo = pointLogRecordWithPointNoDto.getPointNo();
        this.orderId = pointLogRecordWithPointNoDto.getOrderId();
        this.custId = pointLogRecordWithPointNoDto.getCustId();
        this.pointAmt = pointLogRecordWithPointNoDto.getPointAmt();
        this.pointSpec = pointLogRecordWithPointNoDto.getPointSpec();
        this.pointStat = pointLogRecordWithPointNoDto.getPointStat();
    }

    public PointLogRecordWithoutPointNoDto getPointLogRecordWithoutPointNoDto() {
        return PointLogRecordWithoutPointNoDto.builder()
                .orderId(orderId)
                .custId(custId)
                .pointAmt(pointAmt)
                .pointSpec(pointSpec)
                .pointStat(pointStat)
                .build();
    }

    public void setPointLogRecordWithoutPointNoDto(PointLogRecordWithoutPointNoDto pointLogRecordWithoutPointNoDto) {
        this.orderId = pointLogRecordWithoutPointNoDto.getOrderId();
        this.custId = pointLogRecordWithoutPointNoDto.getCustId();
        this.pointAmt = pointLogRecordWithoutPointNoDto.getPointAmt();
        this.pointSpec = pointLogRecordWithoutPointNoDto.getPointSpec();
        this.pointStat = pointLogRecordWithoutPointNoDto.getPointStat();
    }

    public PointLogUsageDto getPointLogUsageDto() {
        return PointLogUsageDto.builder()
                .orderId(orderId)
                .pointAmt(pointAmt)
                .procDt(procDt)
                .pointSpec(pointSpec)
                .pointStat(pointStat)
                .build();
    }

    /*public void setPointLogUsageDto(PointLogUsageDto pointLogUsageDto) {
        this.orderId = pointLogUsageDto.getOrderId();
        this.pointAmt = pointLogUsageDto.getPointAmt();
        this.procDt = pointLogUsageDto.getProcDt();
        this.pointSpec = pointLogUsageDto.getPointSpec();
        this.pointStat = pointLogUsageDto.getPointStat();
    }*/

    public PointLogEarningDto getPointLogEarningDto() {
        return PointLogEarningDto.builder()
                .pointAmt(pointAmt)
                .pointStat(pointStat)
                .build();
    }

    public PointLogExpDto getPointLogExpDto() {
        return PointLogExpDto.builder()
                .pointAmt(pointAmt)
                .procDt(procDt)
                .pointSpec(pointSpec)
                .pointStat(pointStat)
                .build();
    }

    /*public void setPointLogExpDto(PointLogExpDto pointLogExpDto) {
        this.pointAmt = pointLogExpDto.getPointAmt();
        this.procDt = pointLogExpDto.getProcDt();
        this.pointSpec = pointLogExpDto.getPointSpec();
        this.pointStat = pointLogExpDto.getPointStat();
    }*/
}
