package com.brokurly.entity.mypage;

import com.brokurly.dto.mypage.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class ShippingLocationAndShoppingLocationChangeLog {
    // ShoppingLocation
    private String shipLocaId;
    private String addr;
    private String specAddr;
    private String defAddrFl;
    private Date shipLocaRegDt;
    private String telNo;
    private String recAddr;
    private String recName;
    private String delFl;
    private String currAddrFl;

    // ShoppingLocationChangeLog
    private int shipChgNo;
    private String name;
    private String chgStatus;
    private Date chgDt = java.sql.Timestamp.valueOf(LocalDateTime.now());
    private String custId;

    public ShippingLocationDto makeShippingLocationDto() {
        return ShippingLocationDto.builder()
                .shipLocaId(shipLocaId)
                .addr(addr)
                .specAddr(specAddr)
                .defAddrFl(defAddrFl)
                .shipLocaRegDt(shipLocaRegDt)
                .telNo(telNo)
                .recAddr(recAddr)
                .recName(recName)
                .delFl(delFl)
                .currAddrFl(currAddrFl)
                .build();
    }

    public void updateShippingLocationDto(ShippingLocationDto shippingLocationDto) {
        this.shipLocaId = shippingLocationDto.getShipLocaId();
        this.addr = shippingLocationDto.getAddr();
        this.specAddr = shippingLocationDto.getSpecAddr();
        this.defAddrFl = shippingLocationDto.getDefAddrFl();
        this.shipLocaRegDt = shippingLocationDto.getShipLocaRegDt();
        this.telNo = shippingLocationDto.getTelNo();
        this.recAddr = shippingLocationDto.getRecAddr();
        this.recName = shippingLocationDto.getRecName();
        this.delFl = shippingLocationDto.getDelFl();
        this.currAddrFl = shippingLocationDto.getCurrAddrFl();
    }

    public ShippingLocationUpdateDto makeShippingLocationUpdateDto() {
        return ShippingLocationUpdateDto.builder()
                .shipLocaId(shipLocaId)
                .specAddr(specAddr)
                .defAddrFl(defAddrFl)
                .telNo(telNo)
                .recAddr(recAddr)
                .recName(recName)
                .delFl(delFl)
                .currAddrFl(currAddrFl)
                .build();
    }

    public void updateShippingLocationUpdateDto(ShippingLocationUpdateDto shippingLocationUpdateDto) {
        this.shipLocaId = shippingLocationUpdateDto.getShipLocaId();
        this.specAddr = shippingLocationUpdateDto.getSpecAddr();
        this.defAddrFl = shippingLocationUpdateDto.getDefAddrFl();
        this.telNo = shippingLocationUpdateDto.getTelNo();
        this.recAddr = shippingLocationUpdateDto.getRecAddr();
        this.recName = shippingLocationUpdateDto.getRecName();
        this.delFl = shippingLocationUpdateDto.getDelFl();
        this.currAddrFl = shippingLocationUpdateDto.getCurrAddrFl();
    }


    public ShippingLocationCurrDto makeShippingLocationCurrDto() {
        return ShippingLocationCurrDto.builder()
                .shipLocaId(shipLocaId)
                .addr(addr)
                .specAddr(specAddr)
                .defAddrFl(defAddrFl)
                .currAddrFl(currAddrFl)
                .build();
    }
}
