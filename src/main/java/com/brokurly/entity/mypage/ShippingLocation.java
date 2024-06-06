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
public class ShippingLocation {
    private String shipLocaId;
    private String addr;
    private String specAddr;
    private String defAddrFl;
    private Date shipLocaRegDt = java.sql.Timestamp.valueOf(LocalDateTime.now());
    private String telNo;
    private String recAddr;
    private String recName;
    private String delFl;
    private String currAddrFl = "Y";

    public ShippingLocationDto makeShippingLocationDto() {
        return ShippingLocationDto.builder()
                .shipLocaId(shipLocaId)
                .addr(addr)
                .specAddr(specAddr)
                .defAddrFl(defAddrFl)
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
        this.telNo = shippingLocationDto.getTelNo();
        this.recAddr = shippingLocationDto.getRecAddr();
        this.recName = shippingLocationDto.getRecName();
        this.delFl = shippingLocationDto.getDelFl();
        this.currAddrFl = shippingLocationDto.getCurrAddrFl();
    }

    public ShippingLocationModifyPageDto makeShippingLocationModifyPageDto() {
        return ShippingLocationModifyPageDto.builder()
                .shipLocaId(shipLocaId)
                .addr(addr)
                .specAddr(specAddr)
                .defAddrFl(defAddrFl)
                .telNo(telNo)
                .recName(recName)
                .currAddrFl(currAddrFl)
                .build();
    }

    public void updateShippingLocationModifyPageDto(ShippingLocationModifyPageDto shippingLocationModifyPageDto) {
       this.shipLocaId = shippingLocationModifyPageDto.getShipLocaId();
       this.addr = shippingLocationModifyPageDto.getAddr();
       this.specAddr = shippingLocationModifyPageDto.getSpecAddr();
       this.defAddrFl = shippingLocationModifyPageDto.getDefAddrFl();
       this.telNo = shippingLocationModifyPageDto.getTelNo();
       this.recName = shippingLocationModifyPageDto.getRecName();
       this.currAddrFl = shippingLocationModifyPageDto.getCurrAddrFl();
    }

    public ShippingLocationManagementDto makeShippingLocationManagementDto() {
        return ShippingLocationManagementDto.builder()
                .shipLocaId(shipLocaId)
                .addr(addr)
                .specAddr(specAddr)
                .defAddrFl(defAddrFl)
                .telNo(telNo)
                .recName(recName)
                .delFl(delFl)
                .build();
    }

    public void updateShippingLocationManagementDto(ShippingLocationManagementDto shippingLocationManagementDto) {
        this.shipLocaId = shippingLocationManagementDto.getShipLocaId();
        this.addr = shippingLocationManagementDto.getAddr();
        this.specAddr = shippingLocationManagementDto.getSpecAddr();
        this.defAddrFl = shippingLocationManagementDto.getDefAddrFl();
        this.telNo = shippingLocationManagementDto.getTelNo();
        this.recName = shippingLocationManagementDto.getRecName();
        this.delFl = shippingLocationManagementDto.getDelFl();
    }

    public ShippingLocationAddDto makeShippingLocationAddDto() {
        return ShippingLocationAddDto.builder()
                .shipLocaId(shipLocaId)
                .addr(addr)
                .specAddr(specAddr)
                .defAddrFl(defAddrFl)
                .delFl(delFl)
                .build();
    }

    public void updateShippingLocationAddDto(ShippingLocationAddDto shippingLocationAddDto) {
        this.shipLocaId = shippingLocationAddDto.getShipLocaId();
        this.addr = shippingLocationAddDto.getAddr();
        this.specAddr = shippingLocationAddDto.getSpecAddr();
        this.defAddrFl = shippingLocationAddDto.getDefAddrFl();
        this.delFl = shippingLocationAddDto.getDelFl();
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

    public ShippingLocationModifyDto makeShippingLocationModifyDto() {
        return ShippingLocationModifyDto.builder()
                .shipLocaId(shipLocaId)
                .specAddr(specAddr)
                .defAddrFl(defAddrFl)
                .telNo(telNo)
                .recName(recName)
                .delFl(delFl)
                .currAddrFl(currAddrFl)
                .build();
    }

    public void updateShippingLocationModifyDto(ShippingLocationModifyDto shippingLocationModifyDto) {
        this.shipLocaId = shippingLocationModifyDto.getShipLocaId();
        this.specAddr = shippingLocationModifyDto.getSpecAddr();
        this.defAddrFl = shippingLocationModifyDto.getDefAddrFl();
        this.telNo = shippingLocationModifyDto.getTelNo();
        this.recName = shippingLocationModifyDto.getRecName();
        this.delFl = shippingLocationModifyDto.getDelFl();
        this.currAddrFl = shippingLocationModifyDto.getCurrAddrFl();
    }
}
