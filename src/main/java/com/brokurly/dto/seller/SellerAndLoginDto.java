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
public class SellerAndLoginDto {
    @NotBlank
    private String id;
    @NotBlank
    private String pwd;

    private String name;
}
