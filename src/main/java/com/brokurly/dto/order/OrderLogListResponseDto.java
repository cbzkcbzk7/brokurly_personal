package com.brokurly.dto.order;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderLogListResponseDto {
    private OrderResponseDto order;
    private String itemName;
    private String payMthd;
}
