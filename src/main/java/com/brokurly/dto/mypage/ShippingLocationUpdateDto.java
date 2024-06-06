package com.brokurly.dto.mypage;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class ShippingLocationUpdateDto {
    private String shipLocaId;
    private String specAddr;
    private String defAddrFl;
    private String telNo;
    private String recAddr;
    private String recName;
    private String delFl;
    private String currAddrFl;
}
