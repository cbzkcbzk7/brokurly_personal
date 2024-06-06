package com.brokurly.dto.mypage;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
public class ShippingLocationModifyPageDto {
    private String shipLocaId;
    private String addr;
    private String specAddr;
    private String defAddrFl;
    private String telNo;
    private String recName;
    private String currAddrFl;
}
