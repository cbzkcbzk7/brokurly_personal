package com.brokurly.dto.seller;

import lombok.*;

import javax.validation.constraints.NotBlank;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SellerBsnsNoDto {
    private String name;
    private String bsnsNo;
}
