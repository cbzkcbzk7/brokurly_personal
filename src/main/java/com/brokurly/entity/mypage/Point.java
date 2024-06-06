package com.brokurly.entity.mypage;

import com.brokurly.dto.mypage.PointDto;
import lombok.*;

import java.util.Date;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class Point {
    private int pointNo;
    private String custId;
    private int pointAmt;
    private Date expirDt;

    public PointDto getPointDto() {
        return PointDto.builder()
                .pointNo(pointNo)
                .custId(custId)
                .pointAmt(pointAmt)
                .expirDt(expirDt)
                .build();
    }

    public void setPointDto(PointDto pointDto) {
        this.pointNo = pointDto.getPointNo();
        this.custId = pointDto.getCustId();
        this.pointAmt = pointDto.getPointAmt();
        this.expirDt = pointDto.getExpirDt();
    }
}
