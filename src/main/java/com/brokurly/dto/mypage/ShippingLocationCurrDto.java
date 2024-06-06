package com.brokurly.dto.mypage;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class ShippingLocationCurrDto {
    private String shipLocaId;
    private String addr;
    private String specAddr;
    private String defAddrFl;
    private String currAddrFl;
}
