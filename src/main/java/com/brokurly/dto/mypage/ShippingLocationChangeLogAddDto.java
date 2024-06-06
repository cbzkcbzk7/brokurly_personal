package com.brokurly.dto.mypage;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class ShippingLocationChangeLogAddDto {
    private String name;
    private String telNo;
    private String addr;
    private String specAddr;
    private String defAddrFl;
    private String chgStatus;
    private String custId;
    private String shipLocaId;
}
