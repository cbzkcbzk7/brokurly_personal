package com.brokurly.dto.mypage;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShippingLocationAddFormDto {
    private String addr;
    private String specAddr;
    private String defAddrFl;
}
