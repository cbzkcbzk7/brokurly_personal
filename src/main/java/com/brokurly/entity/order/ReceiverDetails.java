package com.brokurly.entity.order;

import com.brokurly.dto.order.ReceiverDetailsDto;
import com.brokurly.dto.order.ReceiverDetailsRequestDto;
import com.brokurly.dto.order.ReceiverDetailsResponseDto;
import lombok.*;

@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReceiverDetails {
    private String rcvDtlId;
    private String shipLocaId;
    private String custId;
    private String rcvName;
    private String telNo;
    private String rcvPlace;
    private String enterMthd;
    private String placeExp;
    private String msgTime;

    public ReceiverDetailsResponseDto toResponseDto() {
        return ReceiverDetailsResponseDto.builder()
                .shipLocaId(shipLocaId)
                .rcvName(rcvName)
                .telNo(telNo)
                .rcvPlace(rcvPlace)
                .enterMthd(enterMthd)
                .placeExp(placeExp)
                .msgTime(msgTime)
                .build();
    }

    public void changeReceiverDetails(ReceiverDetailsRequestDto changeDto) {
        this.rcvDtlId = changeDto.getRcvDtlId();
        this.shipLocaId = changeDto.getShipLocaId();
        this.custId = changeDto.getCustId();
        this.rcvName = changeDto.getRcvName();
        this.telNo = changeDto.getTelNo();
        this.rcvPlace = changeDto.getRcvPlace();
        this.enterMthd = changeDto.getEnterMthd();
        this.placeExp = changeDto.getPlaceExp();
        this.msgTime = changeDto.getMsgTime();
    }
}
