package com.brokurly.entity.mypage;

import com.brokurly.dto.mypage.ShippingLocationChangeLogAddDto;
import com.brokurly.dto.mypage.ShippingLocationDto;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class ShippingLocationChangeLog {
    private int shipChgNo;
    private String name;
    private String telNo;
    private String addr;
    private String specAddr;
    private String defAddrFl;
    private String chgStatus;
    private Date chgDt = java.sql.Timestamp.valueOf(LocalDateTime.now());
    private String custId;
    private String shipLocaId;

    public ShippingLocationChangeLogAddDto makeShippingLocationChangeLog() {
        return ShippingLocationChangeLogAddDto.builder()
                .name(name)
                .telNo(telNo)
                .addr(addr)
                .specAddr(specAddr)
                .defAddrFl(defAddrFl)
                .chgStatus(chgStatus)
                .custId(custId)
                .shipLocaId(shipLocaId)
                .build();
    }

    public void updateShippingLocationChangeLogAddDto(ShippingLocationChangeLogAddDto shippingLocationChangeLogAddDto) {
        this.name = shippingLocationChangeLogAddDto.getName();
        this.telNo = shippingLocationChangeLogAddDto.getTelNo();
        this.addr = shippingLocationChangeLogAddDto.getAddr();
        this.specAddr = shippingLocationChangeLogAddDto.getSpecAddr();
        this.defAddrFl = shippingLocationChangeLogAddDto.getDefAddrFl();
        this.chgStatus = shippingLocationChangeLogAddDto.getChgStatus();
        this.custId = shippingLocationChangeLogAddDto.getCustId();
        this.shipLocaId = shippingLocationChangeLogAddDto.getShipLocaId();
    }
}
